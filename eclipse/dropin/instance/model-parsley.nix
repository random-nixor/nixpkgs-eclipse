#
# Parsley modeling components 
#
{ instance, fetchzip, fetchsite }:

let 
    drop-site = http://download.eclipse.org/emf-parsley/updates;
    meta = {
        homepage = http://www.eclipse.org/emf-parsley ;
        description = "EMF Parsley is an Eclipse project that provides a set of reusable UI components based on EMF" ;
    };
in 
rec {

  model-parsley-123 = instance.repoDir {
    inherit meta;
    name = "model-parsley-123";
    src = fetchsite {
      url = "${drop-site}/1.2/1.2.3.v20180220-1246" ;
      sha256 = "14n1qha5wkgjcy9jf4w3nra3w786ykvzdv6r86cqdjb1dwb0h4sq";
    };
  };

}
