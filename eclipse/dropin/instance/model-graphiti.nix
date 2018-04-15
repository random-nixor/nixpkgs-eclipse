
{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/graphiti ;
    drop-site = http://download.eclipse.org/graphiti/archives ;
in 
rec {

  model-graphiti-0140 = instance.repoDir {
    name = "model-graphiti-0140";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/0.14.0/org.eclipse.graphiti.site_0.14.0.201705161212.zip" ;
      sha256 = "14fi9fjfjjnfdifh888pach479dvddyshp2n37k7wkf7q9aql6xj";
    };
  };

}
