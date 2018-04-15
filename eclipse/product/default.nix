#
# Produce "product" package root, register instances
#
{ pkgs, eclipse }:

let
  include = pkgs.lib.callPackageWith ( pkgs // context );
  context = {
    inherit eclipse;
	instance = include ./instance.nix {} ;
  };
in rec
{}

// include ./instance/base.nix {}
// include ./instance/core.nix {}

// include ./instance/cpp.nix {}

// include ./instance/java.nix {}
// include ./instance/java-main.nix {}

// include ./instance/scala.nix {}
// include ./instance/scala-main.nix {}
// include ./instance/scala-total.nix {}

// include ./instance/total.nix {}
