#
# Graphiti - a Graphical Tooling
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/graphiti/archives ;
    meta = {
        homepage = https://www.eclipse.org/graphiti ;
        description = "Graphiti - a Graphical Tooling Infrastructure around the Eclipse Modeling Framework (EMF)" ;
    };
in 
rec {

  model-graphiti-0140 = instance.repoDir {
    inherit meta;
    name = "model-graphiti-0140";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/0.14.0/org.eclipse.graphiti.site_0.14.0.201705161212.zip" ;
      sha256 = "14fi9fjfjjnfdifh888pach479dvddyshp2n37k7wkf7q9aql6xj";
    };
  };

}
