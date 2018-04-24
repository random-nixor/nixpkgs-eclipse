#
# Overlay repository entry. 
# Uses dedicated overlay module folder.
# 
self: super: 

let

    lib = super.lib;

    namespace = "nixpkgs-eclipse";

    homeDir = builtins.getEnv "HOME";
    configDir = homeDir + "/.config/nixpkgs/overlays";
    eclipseDir = configDir + "/${namespace}";
    
    hasNixFile = file: builtins.match ".*[.]nix" file != null;
    
    mergeNull = {};
    mergeFunc = one: two: one // two;
    mergeOverlays = overlays: lib.foldl mergeFunc mergeNull overlays;
    
    eclipseFiles = builtins.attrNames (builtins.readDir eclipseDir);
    eclipseNixes = builtins.filter hasNixFile eclipseFiles;
    eclipseOverlay = file: import (eclipseDir + "/${file}") self super;
    eclipseOverlays = builtins.map eclipseOverlay eclipseNixes;
    eclipsePackages = mergeOverlays eclipseOverlays;

in 
{
    eclipse = super.callPackage ./eclipse {};
} 
// eclipsePackages
