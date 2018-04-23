#
# Eclipse customization examples.
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
#
# Place similar file into $HOME/.config/nixpkgs/overlays
# and provide eclipse product custom instance definitions there.
#
# This file must sort after "overlay.nix" file during overlay discovery.
# 
self: super:

with super.eclipse; # expose "product", "dropin".

{

    # Custom base instance.
    # install command: nix-env -iA nixpkgs.eclipse-base
    # artifact result: /bin/eclipse-product-base
    eclipse-base = product.instance { # inject into root name space: nixpkgs.*
       name = "base"; # inject into eclipse name space: "eclipse.product.*"
       super = product.base-473a; # product inheritance, see: eclipse/product/instance/*.nix
       execArgs = # launcher parameters override
       [
            "-clean" # force osgi bundle reload
            "-data" "/home/work/space/base" # define workspace location
       ];
       javaArgs = # java-jvm parameters override
       [
            "-Xms1G" # define memory limits
            "-Xmx1G" # define memory limits
            "-Xverify:none" # seedup class loading
            "-XX:-OmitStackTraceInFastThrow" # expose full traces
       ];
    };

}
