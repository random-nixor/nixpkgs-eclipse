#
# Graphical Modeling Framework (GMF)
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/modeling/gmp/gmf-runtime/downloads/drops ;
    meta = {
        homepage = http://www.eclipse.org/modeling/gmp ;
        description = "Graphical Modeling Framework (GMF)";
    };
in 
rec {

  model-gmf-1120 = instance.repoDir {
    inherit meta;
    name = "model-gmf-1120";
    src = fetchzip {
      stripRoot = true;
      url = "${drop-site}/1.12.0/S201801291558/gmf-sdk-runtime-S201801291558.zip" ;
      sha256 = "0b9y4i66jclpg6jjp5cmdf70sca5cb8vpbb6d19hviszrmldhh4g";
    };
  };

}
