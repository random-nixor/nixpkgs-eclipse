#
# Produce desktop presentation
#
{ stdenvNoCC
, eclipse
, pkgs
, makeDesktopItem
, librsvg ? null # TODO
, fetchzip
}:

with builtins;
with pkgs.lib;
with eclipse.option;

let
in
rec {

    deskBase = optionEclipseDesk;

    deskFolder =
    let
        file = ".desktop";
        text = ''
            [Desktop Entry]
            Icon=user-desktop
            Type=Directory
        '';
        folder = stdenvNoCC.mkDerivation {
            name = "eclipse-desk";
            phases = [ "buildPhase" ];
            buildPhase = ''
                baseDir=$out/${deskBase}
                baseFile=$baseDir/${file}
			    mkdir -p $baseDir
                echo "${text}" > $baseFile
            '';
        } // {
	        base = "${folder.out}/${deskBase}";
	        file = "${folder.out}/${deskBase}/${file}";
        };
    in folder; 

    # entry in /share/applications
    makeDeskItem = { name, fullName, icon, exec }:
    let
    
        file = ./icon + "/${icon}.svg";
        size = "256";
        type = "png";

        deskIcon = stdenvNoCC.mkDerivation {
            name = "desk-icon-${fullName}.${type}";
            buildInputs = [ librsvg ];
            phases = [ "buildPhase" ];
            buildPhase = ''
                rsvg-convert \
                    --format ${type} \
                    --width ${size} \
                    --height ${size} \
                    --keep-aspect-ratio \
                    ${file} --output=$out
            '';
        };

        deskItem = makeDesktopItem {
            name = fullName; 
            icon = deskIcon;
            exec = exec;
            comment = fullName;
            desktopName = name;
            genericName = name;
            categories = "Application;Development;Eclipse;";
        } // {
            file = "${deskItem.out}/share/applications/${deskItem.name}"; 
        };
    in deskItem;
    
    # entry in /eclipse/desk
    makeDeskLink = { deskItem }:
    let
        deskLink = stdenvNoCC.mkDerivation {
            name = "desk-link-${deskItem.name}";
            phases = [ "buildPhase" ];
#            buildInputs = [ deskFolder ];
            buildPhase = ''
                baseDir=$out/${deskBase}
                mkdir -p $baseDir
                ln -s ${deskItem.file} $baseDir/${deskItem.name}
            '';
        };
    in deskLink;
    
}
