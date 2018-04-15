#
# Eclipse Modeling Framework / Core 
#
{ instance, fetchzip }:

#
# FIXME split 
# http://download.eclipse.org/modeling/emf/emf/downloads/drops/2.14.0/S201711020636/
#

let 
    drop-site = http://download.eclipse.org/modeling/emf/emf/downloads/drops ;
    meta = {
        homepage = https://www.eclipse.org/modeling/emf ;
        description = "Eclipse Modeling Framework (EMF) core";
    };
in 
rec {

  model-emf-2140 = instance.repoDir {
    inherit meta;
    name = "model-emf-2140";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.14.0/S201711020636/emf-xsd-Update-2.14.0M3.zip" ;
      sha256 = "0p31q4d481yvam6fqyq2p01qgj70b8748pv1lg8a2sxj8mm78ygj";
    };
  };

}
