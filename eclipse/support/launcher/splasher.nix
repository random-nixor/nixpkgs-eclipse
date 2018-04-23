#
# Provide splash maker
#
{ stdenvNoCC
, eclipse
, librsvg ? null # optional splash renderer: svn -> png
, splash-image ? ./splash/splash-name.svg # splash image template
}:

with eclipse.option;

let

    javaName = optionEclipseJDK.name;
    
    splashFile = name: "splash-${name}.png";

    # produce splash image without specific name
    splashSimple =  name: stdenvNoCC.mkDerivation {
        name = splashFile name;
        phases = [ "buildPhase" ];
        buildPhase = ''
            source="${./splash/splash-none.png}"
            cp $source $out
        '';
    };

    # produce splash image with embedded name
    splashRender = name: stdenvNoCC.mkDerivation {
        name = splashFile name;
        buildInputs = [ librsvg ];
        phases = [ "buildPhase" ];
        buildPhase = ''
            source="$TMPDIR/splash.svg"
            target="$TMPDIR/splash.png"
            cp ${splash-image} $source
            sed -r -i "s/%name%/${name}/g" $source 
            sed -r -i "s/%java%/${javaName}/g" $source 
            rsvg-convert \
                --format png \
                --keep-aspect-ratio \
                $source --output=$target 
            cp $target $out
        '';
    };

in
{

    # produce splash image
    makeSplash = name: if librsvg == null 
        then splashSimple name
        else splashRender name
    ;


}
