#
# Eclipse repository entry. 
#

{ system ? builtins.currentSystem }:

let

  pkgs = import <nixpkgs> { inherit system; };
  
  makeCall = pkgs.lib.callPackageWith ( pkgs // context );

  context = rec {
    inherit pkgs;
    eclipse = makeCall ./eclipse {};
  };
  
in

context
