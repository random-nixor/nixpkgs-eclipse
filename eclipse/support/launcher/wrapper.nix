#
# Produce eclipse wrapper maker
#
{ stdenvNoCC
, eclipse

, pkgs

, buildEnv
, makeWrapper

, libXtst, glib, gtk2, gtk3 # required runtime

# optional 2D graphics via gtk/cairo # FIXME
, freetype, fontconfig, libX11, libXrender, zlib

, webkitgtk220x ? null # optional browser support (gtk3)
, glib-networking ? null # optional browser ssl/tls support
, libcanberra_gtk2 ? null, libcanberra_gtk3 ? null  # optional sound system support

, javaList ?  eclipse.option.optionJavaList

, launcher

}:

with eclipse.option;

let

    lib = stdenvNoCC.lib;

    javaName = optionEclipseJDK.name;

    javaVersion = launcher.javaVersion javaName; 
    
    javaLibrary = 
        if javaVersion == "8"  then { gtk=gtk2; canb=libcanberra_gtk2; webk=null; } else
        if javaVersion == "9"  then { gtk=gtk2; canb=libcanberra_gtk2; webk=null; }  else
        if javaVersion == "10" then { gtk=gtk3; canb=libcanberra_gtk3; webk=webkitgtk220x; }  else
        abort "Unsupported java version: ${javaName}"
    ;
    
#    fontsConf = pkgs.makeFontsConf {
#      fontDirectories = [
#        pkgs.ubuntu_font_family
#      ];
#    };

    fontsConf = pkgs.fontconfig.out + "/etc/fonts/fonts.conf";
    
in

rec {

    wrapperCairoLibs = lib.makeLibraryPath ([ 
        freetype fontconfig libX11 libXrender zlib
    ]) ;

    wrapperLibCanberra = lib.optional (javaLibrary.canb != null) javaLibrary.canb;
    
    wrapperGlibNetwork = lib.optional (glib-networking != null) glib-networking;
    
    wrapperWebkitGTK = lib.optional (javaLibrary.webk != null) javaLibrary.webk;
    
    wrapperLibraryPath = lib.makeLibraryPath ([ 
#        glib javaLibrary.gtk libXtst 
        glib gtk2 gtk3 libXtst 
    ] 
    ++ wrapperLibCanberra ++ wrapperGlibNetwork ++ wrapperWebkitGTK
    );
    
#    wrapperJavaList = makeSearchPath "" javaList;
    
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
        sors, name, base,
        java ? optionEclipseJDK,
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
            scriptList = scriptList
            ;
            enviroList = enviroList
                ++ ( if hasMaven then [ ''MAVEN_CONFIG "${mavenConfig.options}"'' ] else [] )
                ++ ( if hasFonts then [ ''FONTCONFIG_FILE "${fontsConf}"'' ] else [] )
            ;
            prefixList = prefixList
                ++ ( if hasBin then [ ''PATH : "${java}/bin"'' ] else [] )                
                ++ ( if hasLib then [ ''LD_LIBRARY_PATH : "${wrapperLibraryPath}"'' ] else [] )                
            ;
            optionList = optionList
                ++ ( if hasIni then [ ''--launcher.ini \"${eclipseIni.path}\"''] else [] )
            ;
        };
        #
        wrapper = stdenvNoCC.mkDerivation {
            inherit base;
            name = "wrapper-${name}";
            link = "bin/${name}";
            path = optionLauncherExe;
            buildInputs = [ makeWrapper ];
            phases = [ "buildPhase" ];
            buildPhase = ''
               exec=${sors.base}/$path
               link=$out/$link
               makeWrapper "$exec" "$link" ${params}
            '';
        };
    in wrapper // {
       base = with wrapper; "${out}/${base}";
       link = with wrapper; "${out}/${link}";
    };

}

#            --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH" \
