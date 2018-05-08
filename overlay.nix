#
# Overlay repository entry. 
# https://nixos.org/nixpkgs/manual/#chap-overlays
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
# 
self: super: 

let

    lib = super.lib;

    module = "nixpkgs-eclipse";

    homeDir = builtins.getEnv "HOME";
    moduleDir = homeDir + "/.config/nixpkgs/overlays/${module}";
    
    hasNixFile = file: builtins.match ".*[.]nix" file != null;
    
    mergeNull = {};
    mergeFunc = one: two: one // two;
    mergeOverlays = overlays: lib.foldl mergeFunc mergeNull overlays;
    
    moduleFiles = builtins.attrNames (builtins.readDir moduleDir);
    moduleNixes = builtins.filter hasNixFile moduleFiles;
    moduleImport = file: import (moduleDir + "/${file}") self super;
    moduleOverlays = builtins.map moduleImport moduleNixes;
    modulePackages = mergeOverlays moduleOverlays;

in 
{
    eclipse = super.callPackage ./eclipse {};
} 
// modulePackages
