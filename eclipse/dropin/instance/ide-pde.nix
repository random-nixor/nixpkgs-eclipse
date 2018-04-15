#
# Eclipse plugin development
#
{ instance, fetchzip }:

let
    drop-473a = http://download.eclipse.org/eclipse/downloads/drops4/R-4.7.3a-201803300640 ;
    meta = {
        homepage = https://www.eclipse.org/pde ;
        description = "Plug-in Development Environment (PDE) provides tools to develop Eclipse plug-ins";
    };
in
rec {

  ide-pde-473a = instance.repoDir {
    inherit meta;
    name = "ide-pde-473a";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-473a}/org.eclipse.pde-4.7.3a.zip" ;
      sha256 = "1byry2sdwbzgcic0z01f2is4w3s2hnmsk5l9jxvz310vyzravm27";
    };
  };

  ide-pde-src-473a = instance.repoDir {
    inherit meta;
    name = "ide-pde-src-473a";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-473a}/org.eclipse.pde.source-4.7.3a.zip" ;
      sha256 = "1xs54c3hrdr5sza8dlb8qwxv21az581p629dwp6xib66qa297pdk";
    };
  };

}
