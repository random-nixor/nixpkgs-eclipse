#
# Java DSL development.
#
{ instance, fetchzip, fetchsite, dropin }:

with dropin;

let
    drop-site = http://download.eclipse.org/modeling/tmf/xtext/downloads/drops ; 
    meta = {
        homepage = https://www.eclipse.org/Xtext ;
        description = "Xtext is a framework for development of programming languages and domain-specific languages";
    };
in 
rec {

  ide-xtext-2130 = instance.repoDir {
    inherit meta;
    name = "ide-xtext-2130";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.13.0/N201710240209/tmf-xtext-Update-N201710240209.zip" ;
      sha256 = "0qqcwxyvpasanw32nwgcvndj6bifhj6b2hfnskvix8kk2mh8pshx";
    };
    deps = [
        model-emfxsd-2130
        model-xpand-220
        model-mwe-291
        orbit-google-inject-300
        orbit-objectweb-asm-520
    ]
    ;
  };

}
