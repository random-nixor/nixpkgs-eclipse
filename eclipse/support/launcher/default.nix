#
# Eclipse launcher support
#
{ stdenvNoCC
, pkgs
, buildEnv
, fetchurl
, eclipse
}:

let

    lib = stdenvNoCC.lib;

    include = lib.callPackageWith ( pkgs // pkgs.xlibs // context );

    launcher = {
    
        dirNameOf = path: lib.concatStringsSep "/" ( lib.init ( lib.splitString "/" path) );
        
        javaVersion = name: 
            if builtins.match ".*jdk-8.*"  name != null then "8" else
            if builtins.match ".*jdk-9.*"  name != null then "9" else
            if builtins.match ".*jdk-10.*" name != null then "10" else
            abort "Unsupported java version: ${name}"
        ;
        
        javaVendor = name:
            if builtins.match ".*oracle.*"  name != null then "oracle" else
            if builtins.match ".*openjdk.*"  name != null then "openjdk" else
            abort "Unsupported java vendor: ${name}"
        ;
        
    }
    // include ./desktop.nix {}
    // include ./dot-settings.nix {}
    // include ./eclipse-ini.nix {}
    // include ./install.nix {}
    // include ./maven.nix {}
    // include ./splasher.nix {}
    // include ./wrapper.nix {}
    ; 

    context = rec {
        inherit eclipse launcher;
    };
    
in launcher
