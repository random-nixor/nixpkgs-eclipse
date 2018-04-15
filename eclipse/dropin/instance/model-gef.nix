
{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/gef ;
    drop-site = http://download.eclipse.org/tools/gef/downloads/drops ;
in 
rec {

  model-gef-502 = instance.repoDir {
    name = "model-gef-502";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/5.0.2/R201711130301/GEF-Update-5.0.2.zip" ;
      sha256 = "0hgn48r16idj7j5z6b5892r72ybkgwwvih526ihy8ixda8zy4j11";
    };
  };

}
