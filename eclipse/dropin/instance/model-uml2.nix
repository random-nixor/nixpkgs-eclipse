#
# Model Development Tools (MDT) / UML2 
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/modeling/mdt/uml2/downloads/drops ;
    meta = {
        homepage = https://www.eclipse.org/modeling/mdt/?project=uml2 ;
        description = "Eclipse Modeling Framework (EMF) core";
    };
in 
rec {

  model-uml2-530 = instance.repoDir {
    inherit meta;
    name = "model-uml2-530";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/5.3.0/R201706051616/mdt-uml2-Update-5.3.0.zip" ;
      sha256 = "1s4r6qllyjmgn3h5p0ixzb1zhyq3rxhv97lkx10400qkx7nd3bmj";
    };
  };

}
