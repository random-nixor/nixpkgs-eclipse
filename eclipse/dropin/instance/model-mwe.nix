#
# Modeling Workflow Engine 
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/modeling/emft/mwe/downloads/drops ;
    meta = {
        homepage = https://www.eclipse.org/modeling/emft ;
        description = "Modeling Workflow Engine (MWE) is an extensible framework for the integration and orchestration of model processing workflows" ;
    };
in 
rec {

  model-mwe-291 = instance.repoDir {
    inherit meta;
    name = "model-mwe-291";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.9.1/R201705291010/emft-mwe-2-lang-Update-2.9.1.zip" ;
      sha256 = "1qlw0xqcyfq5yd0vkrzbp6pzgsnps8hi2v3ray6mbq8599b6spll";
    };
  };

}
