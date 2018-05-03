#
# Produce eclipse wrapper maker
#
{ stdenvNoCC
, eclipse

, buildEnv
, makeWrapper

, libXtst, glib, gtk2, gtk3 # required runtime

, freetype, fontconfig, fontconfig-penultimate, libX11, libXrender, zlib # FIXME optional?

, webkitgtk220x ? null # optional browser support (gtk3)
, glib-networking ? null # optional browser ssl/tls support
, libcanberra ? null  # optional sound system support

, javaList ?  eclipse.option.optionJavaList

, launcher

}:

with eclipse.option;

let

    lib = stdenvNoCC.lib;

#    javaName = optionEclipseJDK.name;

#    javaVersion = launcher.javaVersion javaName; 
    
#    javaLibrary = javaVersion: 
#        if javaVersion == "8"  then { gtk=gtk2; canb=libcanberra_gtk2; webk=null; } else
#        if javaVersion == "9"  then { gtk=gtk2; canb=libcanberra_gtk2; webk=null; }  else
#        if javaVersion == "10" then { gtk=gtk3; canb=libcanberra_gtk3; webk=webkitgtk220x; }  else
#        abort "Unsupported java version: ${javaName}"
#    ;
    
    # fonts config using profile, i.e.:
    # <dir>~/.nix-profile/share/fonts</dir>
    fontsEnv = buildEnv {
        name = "fonts-env";
        paths = [
            fontconfig.out # use /etc
            fontconfig-penultimate
        ];
        ignoreCollisions = true;
    } // {
        path = fontsEnv + "/etc/fonts";
        file = fontsEnv + "/etc/fonts/fonts.conf";
    };
    
in

rec {

    wrapperCairoLibs = lib.makeLibraryPath ([ 
        freetype fontconfig libX11 libXrender zlib
    ]) ;

    wrapperLibraryPath = lib.makeLibraryPath ([ 
        glib gtk2 gtk3 libXtst 
        glib-networking webkitgtk220x libcanberra
    ]);
    
    wrapperBinaryPath = lib.makeSearchPath "bin" [
    ];
    
    # generate wrapper arguments
    wrapperParams = {
        scriptList ? [], enviroList ? [], prefixList ? [], optionList ? [],
    }: 
    let
        scriptText = lib.concatMapStringsSep (" ") (x: ''--run "${x}"'') scriptList;
        enviroText = lib.concatMapStringsSep (" ") (x: ''--set ${x}'') enviroList;
        prefixText = lib.concatMapStringsSep (" ") (x: ''--prefix ${x}'') prefixList;
        optionText = lib.concatMapStringsSep (" ") (x: ''--add-flags "${x}"'') optionList;
    in 
        ''${scriptText} ${enviroText} ${prefixText} ${optionText}'';
    
    # generate eclipse wrapper
    makeLauncherWrapper = { 
        sors, name, base, java, layout,
        eclipseIni ? null, mavenConfig ? null, 
        scriptList ? [], enviroList ? [], prefixList ? [], optionList ? [],
    }:
    let 
        hasBin = true;
        hasLib = true;
        hasIni = optionSetIni && eclipseIni != null;
        hasMaven = optionSetMaven && mavenConfig != null;
        hasFonts = optionSetFonts;
        #
        params = wrapperParams {
            scriptList = []
                #
                ++ scriptList # keep last
            ;
            enviroList = []
                # use stable fonts configuration
                ++ ( if hasFonts then [ ''FONTCONFIG_FILE "${fontsEnv.file}"'' ] else [] )
                ++ ( if hasFonts then [ ''FONTCONFIG_PATH "${fontsEnv.path}"'' ] else [] )
                # maven wrapper configuration
                ++ ( if hasMaven then [ ''MAVEN_CONFIG "${mavenConfig.options}"'' ] else [] )
                # FIXME user.home vs maven.home setup
                ++ ( if hasMaven then [ ''M2_HOME "${mavenConfig.folder}"'' ] else [] )
                ++ enviroList # keep last
            ;
            prefixList = []
                # use configured jdk
                ++ ( if hasBin then [ ''PATH : "${java}/bin"'' ] else [] )
                # required swt dependencies                
                ++ ( if hasLib then [ ''LD_LIBRARY_PATH : "${wrapperLibraryPath}"'' ] else [] )                
                # use stable fonts applications
                ++ ( if hasFonts then [ ''PATH : "${fontconfig}/bin"'' ] else [] )
                ++ prefixList # keep last
            ;
            optionList = []
                # inject startup settings
                ++ ( if hasIni then [ ''--launcher.ini \"${eclipseIni.path}\"''] else [] )
                ++ optionList # keep last
            ;
        };
        #
        exec = "${layout.root}/${layout.exec}";
        link = "bin/${name}";
        wrapper = stdenvNoCC.mkDerivation {
            name = "wrapper-${name}";
            buildInputs = [ makeWrapper ];
            phases = [ "buildPhase" ];
            buildPhase = ''
               exec=${sors.base}/${exec}
               link=$out/${link}
               makeWrapper "$exec" "$link" ${params}
            '';
        };
    in wrapper // {
       base = with wrapper; "${out}/${base}";
       link = with wrapper; "${out}/${link}";
    };

}

#            --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH" \
