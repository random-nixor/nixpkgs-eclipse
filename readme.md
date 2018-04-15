
## nixpkgs-eclipse

[![Eclipse Splash][splash_icon]][splash_link]

This nix package repository provides alternative setup for Eclipse:
[pkgs/applications/editors/eclipse][nixos_eclipse]

Features:
* [runtime](eclipse/runtime), [dropin](eclipse/dropin), [product](eclipse/product)
* clean package name space
* modular package structure
* mirrors eclipse update sites
* supports `dropin` dependency 
* supports `product` inheritance
* automatically downloads oracle jdk
* provides splash screen customization
* enables more platform / version combinations

Usage:
* clone this repository
* enable [unfree for oracle][wiki_unfree]
* append/change dropins, products
* remove matching `$HOME/.eclipse/${product}`
* invoke provided [build scripts](.build) to verify install

Notes:
* [build-all.sh](.build/build-all.sh) from scratch (behind cache/proxy)
  takes 10 minutes and 10 GB of disk

[nixos_eclipse]: https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/editors/eclipse

[wiki_unfree]: https://nixos.wiki/wiki/FAQ/How_can_I_install_a_proprietary_or_unfree_package%3F

[splash_icon]: .gitrepo/splash.png
[splash_link]: eclipse
