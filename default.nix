#
# Private repository entry. 
#
{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  include = pkgs.lib.callPackageWith ( pkgs // context );
  context = rec {
    inherit pkgs;
    eclipse = include ./eclipse {};
  };
  
in
context
