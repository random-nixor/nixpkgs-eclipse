
{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/modeling/emft ;
    drop-site = http://download.eclipse.org/modeling/emft/mwe/downloads/drops ;
    
in 
rec {

  model-mwe-291 = instance.repoDir {
    name = "model-mwe-291";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.9.1/R201705291010/emft-mwe-2-lang-Update-2.9.1.zip" ;
      sha256 = "1qlw0xqcyfq5yd0vkrzbp6pzgsnps8hi2v3ray6mbq8599b6spll";
    };
  };

}
