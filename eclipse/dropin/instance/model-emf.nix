#
# Eclipse Modeling Framework / Core, XSD 
#
{ instance, fetchzip }:

#
# FIXME provide split core/xsd
#

let 
    drop-site = http://download.eclipse.org/modeling/emf/emf/downloads/drops ;
    meta = {
        homepage = https://www.eclipse.org/modeling/emf ;
        description = "Eclipse Modeling Framework (EMF) core";
    };
in 
rec {

  # 2.13.0  

  model-emfxsd-2130 = instance.repoDir {
    inherit meta;
    name = "model-emfxsd-2130";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.13.0/R201706090928/emf-xsd-Update-2.13.0.zip" ;
      sha256 = "0s4r6qllyjmgn3h5p0ixzb1zhyq3rxhv97lkx10400qkx7nd3bmj";
    };
  };

  # 2.14.0  

#  model-emfxsd-2140 = instance.repoDir {
#    inherit meta;
#    name = "model-emfxsd-2140";
#    src = fetchzip {
#      stripRoot = false;
#      url = "${drop-site}/2.14.0/S201711020636/emf-xsd-Update-2.14.0M3.zip" ;
#      sha256 = "0p31q4d481yvam6fqyq2p01qgj70b8748pv1lg8a2sxj8mm78ygj";
#    };
#  };

}
