
{ instance, fetchzip }:

let 
    home-page = https://github.com/MoreUnit/MoreUnit-Eclipse ;
    drop-site = https://github.com/MoreUnit/MoreUnit-Eclipse/releases/download ;
in 
rec {

  tools-moreunit-311 = instance.repoDir {
    name = "tools-moreunit-311";
    src = fetchzip {
      stripRoot = true;
      url = "${drop-site}/v3.1.1/org.moreunit-3.1.1.zip" ;
      sha256 = "13aq81jnligkvm548irpia4ck2ir1wmq50vaql70nmzrbkskp28m";
    };
  };

}
