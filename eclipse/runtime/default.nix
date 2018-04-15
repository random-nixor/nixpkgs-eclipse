#
# Produce "runtime" package root, register instances
#
{ pkgs, eclipse }:

let
  include = pkgs.lib.callPackageWith ( pkgs // context );
  context = {
    inherit eclipse;
    instance = include ./instance.nix {};
  };
in rec
{} 

// include ./instance/base.nix {}
// include ./instance/core.nix {}
// include ./instance/cpp.nix {}
// include ./instance/java.nix {}
// include ./instance/java-ee.nix {}
// include ./instance/java-dsl.nix {}
// include ./instance/javascript.nix {}
// include ./instance/modeling.nix {}
// include ./instance/php.nix {}
// include ./instance/rcp.nix {}
