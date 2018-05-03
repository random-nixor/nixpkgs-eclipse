#
# DSL development.
#
{ instance, fetchzip, fetchsite, dropin }:

with dropin;

let
    drop-site = http://artifacts.metaborg.org/content/repositories/releases/org/metaborg/org.metaborg.spoofax.eclipse.updatesite ; 
    meta = {
        homepage = http://www.metaborg.org/en/latest/index.html ;
        description = "Spoofax Language Workbench";
    };
in 
rec {

  ide-spoofax-241 = instance.repoDir {
    inherit meta;
    name = "ide-spoofax-241";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.4.1/org.metaborg.spoofax.eclipse.updatesite-2.4.1-assembly.zip" ;
      sha256 = "0fqfxjnj5vhfy800mywxjwcvpfad8giqzxyqnxrm2nf2fzi2p9bp";
    };
    deps = [
#        model-emfxsd-2130
#        model-xpand-220
#        model-mwe-291
#        orbit-google-inject-300
#        orbit-objectweb-asm-520
    ]
    ;
  };

}
