#
# Java development
#

{ instance, fetchzip }:

let
    home-page = https://www.eclipse.org/jdt ;
    drop-site = http://download.eclipse.org/eclipse/downloads ;
    drop-473a = "${drop-site}/drops4/R-4.7.3a-201803300640";
in
rec {

  ide-java-473a = instance.repoDir {
    name = "ide-java-473a";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-473a}/org.eclipse.jdt-4.7.3a.zip" ;
      sha256 = "10dndhqz894xf79zz07dlmkn7k33mn42nbmycr78xz6d2jy8cscx";
    };
  };

  ide-java-src-473a = instance.repoDir {
    name = "ide-java-src-473a";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-473a}/org.eclipse.jdt.source-4.7.3a.zip" ;
      sha256 = "0z0cbvq49vv96m08qz6bsbkn6100hrncwgmw5z9li3rjlcv8lf5m";
    };
  };

}
