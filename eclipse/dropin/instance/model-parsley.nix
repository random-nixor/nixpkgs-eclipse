
{ instance, fetchzip, fetchsite }:

let 
    home-page = http://www.eclipse.org/emf-parsley ;
    drop-site = http://download.eclipse.org/emf-parsley/updates;
in 
rec {

  model-parsley-123 = instance.repoDir {
    name = "model-parsley-123";
    src = fetchsite {
      url = "${drop-site}/1.2/1.2.3.v20180220-1246" ;
      sha256 = "14n1qha5wkgjcy9jf4w3nra3w786ykvzdv6r86cqdjb1dwb0h4sq";
    };
  };

}
