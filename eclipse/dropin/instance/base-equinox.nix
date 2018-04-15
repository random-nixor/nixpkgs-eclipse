#
# Eclipse OSGI platform
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/equinox/drops ;
    meta = {
        homepage = http://www.eclipse.org/equinox ;
        description = "Equinox is an implementation of the OSGi core framework specification" ;
    };
in 
rec {

  base-equinox-473a = instance.repoDir {
    inherit meta;
    name = "base-equinox-473a";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/R-Oxygen.3a-201803300640/equinox-SDK-Oxygen.3a.zip" ;
      sha512 = "144vcc4m36h678s6hg33vrgcymndiiqj454pdhlwpmhzgq7p7kl3kcfgbrzb7fj2dmzh1zwn1rjh66z5rqgfiz5bx08fx3rnsy1lrdl";
    };
  };

}
