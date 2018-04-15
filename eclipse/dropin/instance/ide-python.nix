#
# Python development
#

{ instance, fetchzip, fetchsite }:

let 
in 
rec {

  ide-pydev-632 = instance.repoDir {
    name = "ide-pydev-632";
    src = fetchsite {
      url = "https://dl.bintray.com/fabioz/pydev/6.3.2" ;
      sha256 = "194lcazgjng6r42v3b6l2szdniglswnzaxgphmz1hh1my42qq1r4";
    };
  };

}
