#
# Eclipse launcher support
#
{ stdenvNoCC
, pkgs
, buildEnv
, fetchurl
, eclipse
}:

with stdenvNoCC.lib;

let

    include = callPackageWith ( pkgs // pkgs.xlibs // context );

    launcher = {
        dirNameOf = path: concatStringsSep "/" ( init ( splitString "/" path) );
    }
    // include ./dot-settings.nix {}
    // include ./eclipse-ini.nix {}
    // include ./install.nix {}
    // include ./splasher.nix {}
    // include ./wrapper.nix {}
    ; 

    context = rec {
        inherit eclipse launcher;
    };
    
    
in launcher
