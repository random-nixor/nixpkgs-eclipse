
## nixpkgs-eclipse

[![Project License][licence_icon]][licence_link]
[![Travis Status][travis_icon]][travis_link]
[![Project Files][tokei_files_icon]][tokei_basic_link]
[![Project Lines][tokei_lines_icon]][tokei_basic_link]
[![Lines of Code][tokei_basic_icon]][tokei_basic_link]

[![Eclipse Splash][splash_icon]][splash_link]

Nix package repository with improved setup for Eclipse:
[pkgs/applications/editors/eclipse][nixos_eclipse]

Features:
* [runtime](eclipse/runtime), [dropin](eclipse/dropin), [product](eclipse/product)
* clean package name space
* modular package structure
* mirrors eclipse update sites
* supports `nixpkgs` [overlays][overlay_blog_link]
* supports `dropin` dependency 
* supports `product` inheritance
* automatically downloads `oracle-jdk`
* provisions eclipse default settings
* supports desktop item customization
* provides splash screen customization
* supports launching companion `jdks/jres`
* exposes installed applications for review
* provisions maven toolchains configuration
* enables many platform / version combinations

Usage:
* clone this repository
* enable [unfree for oracle][wiki_unfree]
* cleanup `$HOME/.eclipse/${product}` if any
* invoke provided [overlay.sh](overlay.sh) to activate overlays
* append/change products, following [examples](.build/demo) 

Notes:
* [build-all.sh](.build/build-all.sh) from scratch (behind cache/proxy)
  takes some 10 minutes and 10 GB of disk

[nixos_eclipse]: https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/editors/eclipse

[wiki_unfree]: https://nixos.wiki/wiki/FAQ/How_can_I_install_a_proprietary_or_unfree_package%3F

[splash_icon]: .build/repo/splash.png
[splash_link]: eclipse

[licence_icon]: https://img.shields.io/github/license/random-nixor/nixpkgs-eclipse.svg?label=License
[licence_link]: http://www.apache.org/licenses/

[travis_icon]: https://travis-ci.org/random-nixor/nixpkgs-eclipse.svg
[travis_link]: https://travis-ci.org/random-nixor/nixpkgs-eclipse/builds

[tokei_files_icon]: https://tokei.rs/b1/github/random-nixor/nixpkgs-eclipse?category=files 
[tokei_lines_icon]: https://tokei.rs/b1/github/random-nixor/nixpkgs-eclipse?category=lines 
[tokei_basic_icon]: https://tokei.rs/b1/github/random-nixor/nixpkgs-eclipse
[tokei_basic_link]: https://github.com/random-nixor/nixpkgs-eclipse 

[overlay_blog_link]: https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
