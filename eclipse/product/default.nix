#
# Produce "product" package root, register instances
#
{ pkgs, eclipse }:

let
    include = pkgs.lib.callPackageWith ( pkgs // context );
    instance = include ./instance.nix {} ;
    context = {
      inherit eclipse instance;
    };
in context

// include ./instance/base.nix {}
// include ./instance/core.nix {}

// include ./instance/cpp.nix {}

// include ./instance/java.nix {}
// include ./instance/java-dsl.nix {}
// include ./instance/java-main.nix {}

// include ./instance/scala.nix {}
// include ./instance/scala-main.nix {}
// include ./instance/scala-total.nix {}

// include ./instance/total.nix {}

// include ./instance/xmind.nix {}
