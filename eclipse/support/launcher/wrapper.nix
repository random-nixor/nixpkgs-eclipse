#
# Produce eclipse wrapper maker
#
{ stdenvNoCC
, eclipse

, pkgs

, buildEnv
, makeWrapper

, libXtst, glib, gtk2 ? null, gtk3 ? null # required runtime

# optional 2D graphics via gtk/cairo # FIXME
, freetype, fontconfig, libX11, libXrender, zlib

, webkitgtk220x ? null # optional browser support (gtk3)
, glib-networking ? null # optional browser ssl/tls support
, libcanberra_gtk2 ? null, libcanberra_gtk3 ? null  # optional sound system support

, javaList ?  eclipse.option.optionJavaList

}:

with builtins;
with stdenvNoCC.lib;
with eclipse.option;

let

    javaName = optionEclipseJDK.name;

    javaVersion = 
        if match ".*jdk-8.*"  javaName != null then 8 else
        if match ".*jdk-9.*"  javaName != null then 9 else
        if match ".*jdk-10.*" javaName != null then 10 else
        abort "Unsupported java version: ${javaName}"
    ;
    
    javaLibrary = 
        if javaVersion == 8  then { gtk=gtk2; canb=libcanberra_gtk2; webk=null; } else
        if javaVersion == 9  then { gtk=gtk2; canb=libcanberra_gtk2; webk=null; }  else
        if javaVersion == 10 then { gtk=gtk3; canb=libcanberra_gtk3; webk=webkitgtk220x; }  else
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

    wrapperCairoLibs = makeLibraryPath ([ 
        freetype fontconfig libX11 libXrender zlib
    ]) ;

    wrapperLibCanberra = optional (javaLibrary.canb != null) javaLibrary.canb;
    
    wrapperGlibNetwork = optional (glib-networking != null) glib-networking;
    
    wrapperWebkitGTK = optional (javaLibrary.webk != null) javaLibrary.webk;
    
    wrapperLibraryPath = makeLibraryPath ([ 
        glib javaLibrary.gtk libXtst 
    ] 
    ++ wrapperLibCanberra ++ wrapperGlibNetwork ++ wrapperWebkitGTK
    );
    
#    wrapperJavaList = makeSearchPath "" javaList;
#    wrapperLauncherPath = path: ''--launcher.ini \"${path}\"'' ;
    
    # generate wrapper arguments
    wrapperParams = {
        flagsList ? [], variablesList ? []
    }: 
    let

        flagsGens = filter (x: x != "") [
        ];
        
        variablesGens = filter (x: x != "") [
            (if optionSetFonts then (''FONTCONFIG_FILE "${fontsConf}"'') else "")
        ];

        funAdd = x: ''--add-flags "${x}"'';
        funSet = x: ''--set ${x}'';

        flagsText = concatMapStringsSep (" ") funAdd (flagsGens ++ flagsList);
        variablesText = concatMapStringsSep (" ") funSet (variablesGens ++ variablesList);
        
    in
    ''
        --prefix PATH : "${optionEclipseJDK}/bin" \
        --prefix LD_LIBRARY_PATH : "${wrapperLibraryPath}" \
        ${flagsText} ${variablesText}
    '';
    
    # generate eclipse wrapper
    makeLauncherWrapper = { sors, name, base, eclipini }:
    let 
        result = stdenvNoCC.mkDerivation {
            inherit base;
	        name = "wrapper-${name}";
	        link = "bin/${name}";
	        path = optionLauncherExe;
	        buildInputs = [ makeWrapper ];
	        phases = [ "buildPhase" ];
	        buildPhase = ''
	           exec=${sors.base}/$path
	           link=$out/$link
	           makeWrapper "$exec" "$link" ${wrapperParams {
	               flagsList = [ ''--launcher.ini \"${eclipini.path}\"'' ];
	           }}
	        '';
        };
    in 
    result // {
       base = with result; "${out}/${base}";
       link = with result; "${out}/${link}";
    };

}

#            --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH" \
