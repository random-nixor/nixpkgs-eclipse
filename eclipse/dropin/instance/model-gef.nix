#
# GEF (Graphical Editing Framework)
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/tools/gef/downloads/drops ;
    meta = {
        homepage = https://www.eclipse.org/gef ;
        description = "GEF (Graphical Editing Framework)";
    };
in 
rec {

  model-gef-502 = instance.repoDir {
    inherit meta;
    name = "model-gef-502";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/5.0.2/R201711130301/GEF-Update-5.0.2.zip" ;
      sha256 = "0hgn48r16idj7j5z6b5892r72ybkgwwvih526ihy8ixda8zy4j11";
    };
  };

}
