#
# Provide splash maker
#
{ stdenvNoCC
, eclipse
, librsvg ? null # optional splash renderer: svn -> png
, splash-image ? ./image/splash-name.svg # splash image template
}:

with eclipse.option;

let

    javaName = optionEclipseJDK.name;

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

in
{

    # produce splash image
    makeSplash = name: if librsvg != null 
        then splashRender name 
        else splashSimple name
    ;


}
