#
# Overlay repository entry. 
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
# 
self: super:

{
    eclipse = super.callPackage ./eclipse {};
}
