#
# Eclipse Modeling Framework / Core 
#

#
# FIXME split 
# http://download.eclipse.org/modeling/emf/emf/downloads/drops/2.14.0/S201711020636/
#

{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/modeling/emf ;
    drop-site = http://download.eclipse.org/modeling/emf/emf/downloads/drops ;
in 
rec {

  model-emf-2140 = instance.repoDir {
    name = "model-emf-2140";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.14.0/S201711020636/emf-xsd-Update-2.14.0M3.zip" ;
      sha256 = "0p31q4d481yvam6fqyq2p01qgj70b8748pv1lg8a2sxj8mm78ygj";
    };
  };

}
