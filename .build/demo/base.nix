#
# Customization example: new product package. 
# https://nixos.org/nixpkgs/manual/#chap-overlays
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
#
# Place this or similar file into the folder 
#   $HOME/.config/nixpkgs/overlays/nixpkgs-eclipse/
# and provide custom product/dropin instance definitions there.
#
self: super:

with self.eclipse; # expose "product", "dropin".

let
    space = "/home/work/space/base";
in {

    # Define custom base instance.
    # install command: nix-env -iA nixpkgs.eclipse-base
    # artifact result: /bin/eclipse-product-base
    eclipse-base = product.instance { # inject into root name space: nixpkgs.*
       name = "base"; # inject into eclipse name space: "eclipse.product.*"
       super = product.base-473a; # product inheritance, see: eclipse/product/instance/*.nix
       dropins = # activate extra eclipse features/plugins, see: eclipse/dropin/instance/*.nix
       [
            dropin.base-equinox-473a # use extended osgi framework
       ];
       execArgs = # launcher parameters override
       [
            "-clean" # force osgi bundle reload
            "-configuration" "${space}/data" # define configuration location
            "-data"          "${space}/data" # define workspace location
       ];
       javaArgs = # java-jvm parameters override
       [
            "-Xms1G" "-Xmx1G" # set memory limits
            "-Xverify:none" # seedup class loading
            "-XX:-OmitStackTraceInFastThrow" # expose full traces
            "-Djava.net.useSystemProxies=true" # inherit proxy from environment
            "-Dfile.encoding=UTF-8" # use eclipse charset independent of environment
       ];
    };

}
