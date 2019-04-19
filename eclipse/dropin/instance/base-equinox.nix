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

  base-equinox-411 = instance.repoDir {
    inherit meta;
    name = "base-equinox-411";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/R-4.11-201903070500/equinox-SDK-4.11.zip" ;
      sha512 = "0pgp0lrmsf2h6c6rxsdm89rr97q7abcl0cc9fxqv9bp1bjiaz9jybkq8i9kgfg61rry2rsh8dg6s9gkycs3npdngj99z0i3845dhx0y";
    };
  };

}
