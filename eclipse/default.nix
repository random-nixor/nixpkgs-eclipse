#
# Produce "eclipse" package root
#
{ pkgs, eclipse }:

let
    makeCall = pkgs.lib.callPackageWith ( pkgs // pkgs.xlibs // context );
    requireFetch = makeCall ./support/requireFetch {};
    context = {
        inherit eclipse requireFetch;
    };

in rec
{

    dropin = makeCall ./dropin {};
    product = makeCall ./product {};
    runtime = makeCall ./runtime {};

    option = makeCall ./option.nix {};

    wrapper = makeCall ./support/wrapper {};
    fetchsite = makeCall ./support/fetchsite {};
    
}
