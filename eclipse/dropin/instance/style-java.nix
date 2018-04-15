
{ instance, fetchzip }:

let
    home-page = http://checkstyle.org/eclipse-cs ;
    drop-site = https://dl.bintray.com/eclipse-cs/eclipse-cs/update-site-archive ;

in
rec {

  style-java-880 = instance.repoDir {
    name = "style-java-880";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/net.sf.eclipsecs-updatesite_8.8.0.201802200627.zip" ;
      sha256 = "0bgwr12ja33962a3hzj7g2z68pl85d0jzsifak2aciwa7kfv3wm5";
    };
  };

}
