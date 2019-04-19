#
# Python development
#
{ instance, fetchzip, fetchsite }:

let 
    meta = {
        homepage = http://www.pydev.org ;
        description = "PyDev is a Python IDE for Eclipse";
    };
in 
rec {

  ide-pydev-632 = instance.repoDir {
    inherit meta;
    name = "ide-pydev-632";
    src = fetchsite {
      url = "https://dl.bintray.com/fabioz/pydev/6.3.2" ;
      sha256 = "194lcazgjng6r42v3b6l2szdniglswnzaxgphmz1hh1my42qq1r4";
    };
  };

  ide-pydev-720 = instance.repoDir {
    inherit meta;
    name = "ide-pydev-720";
    src = fetchsite {
      url = "https://dl.bintray.com/fabioz/pydev/7.2.0" ;
      sha256 = "12wssrasx61kg9y838i95cb1151b8q98lvb1430p88phm79h1gn3";
    };
  };

}
