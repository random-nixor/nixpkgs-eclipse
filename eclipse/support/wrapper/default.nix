#
# Eclipse executable wrapper provider
#

{ stdenvNoCC
, eclipse
, makeWrapper

, librsvg ? null # optional splash renderer: svn -> png
, splash-image ? ./splash-name.svg # splash image template

, libXtst, glib, gtk2 ? null, gtk3 ? null # required runtime

# optional 2D graphics via gtk/cairo # FIXME
, freetype, fontconfig, libX11, libXrender, zlib

, webkitgtk220x ? null # optional browser support (gtk3)
, glib-networking ? null # optional browser ssl/tls support
, libcanberra_gtk2 ? null, libcanberra_gtk3 ? null  # optional sound system support

}:

with builtins;
with stdenvNoCC.lib;
with eclipse.option;

let

    javaName = optionJDK.name;

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
    
    # produce splash image with embedded name
    splashRender = name: stdenvNoCC.mkDerivation {
        name = "eclipse-splash";
        buildInputs = [ librsvg ];
        phases = [ "buildPhase" ];
        buildPhase = ''
            source="$TMPDIR/splash.svg"
            target="$TMPDIR/splash.bmp"
            cp ${splash-image} $source
            sed -r -i "s/%name%/${name}/g" $source 
            sed -r -i "s/%java%/${javaName}/g" $source 
            rsvg-convert $source --output=$target 
            cp $target $out
        '';
    };

    # produce splash image without specific name
    splashSimple = name: stdenvNoCC.mkDerivation {
        name = "eclipse-splash";
        phases = [ "buildPhase" ];
        buildPhase = ''
            source="${./splash-none.png}"
            cp $source $out
        '';
    };

    # produce splash image for instance
    makeSplash = name: if librsvg != null 
        then splashRender name 
        else splashSimple name
    ;
    
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
    
    #
    # Eclipse command line options  
    # https://help.eclipse.org/oxygen/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Freference%2Fmisc%2Fruntime-options.html
    #
    wrapperTitle = name: ''-name \"${name}\"'';
    wrapperSplash = name: ''-showSplash \"${makeSplash name}\"'' ;
    wrapperConfigPath = name: ''-configuration \"\$HOME/.eclipse/${name}/conf\"'' ;
    wrapperInstancePath = name: ''-data \"\$HOME/.eclipse/${name}/data\"'' ;
    wrapperLauncherPath = path: ''--launcher.ini \"${path}\"'' ; 
     
    # generate wrapper invocation
    wrapperCommand = { 
        name, # instance name
        exec, # path to executable
        link, # path to bin/symlink
        config ? null # path to config.ini
    }: 
    let
        flagsList = filter (x: x != "") [
            (if optionUseTitle then (wrapperTitle name) else "")             
            (if optionUseSplash then (wrapperSplash name) else "")             
            (if optionUseConfigPath then (wrapperConfigPath name) else "")             
            (if optionUseInstancePath then (wrapperInstancePath name) else "")             
            (if config != null then (wrapperLauncherPath config) else "")             
        ];
        flagsText = concatMapStringsSep (" ") (x: ''--add-flags "${x}"'') flagsList;
    in 
    ''
	    makeWrapper "${exec}" "${link}" \
	      --prefix PATH : "${optionJDK}/bin" \
          --prefix LD_LIBRARY_PATH : "${wrapperLibraryPath}" \
	      --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH" \
	      ${flagsText}
    '';

}
