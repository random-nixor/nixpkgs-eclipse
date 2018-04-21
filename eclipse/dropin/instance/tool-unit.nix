#
# Unit testing tools.
#
{ instance, fetchzip }:

let 
    moreunit-drop-site = https://github.com/MoreUnit/MoreUnit-Eclipse/releases/download ;
in 
rec {

  tool-moreunit-311 = instance.repoDir {
    name = "tool-moreunit-311";
    src = fetchzip {
      stripRoot = true;
      url = "${moreunit-drop-site}/v3.1.1/org.moreunit-3.1.1.zip" ;
      sha256 = "13aq81jnligkvm548irpia4ck2ir1wmq50vaql70nmzrbkskp28m";
    };
    meta = {
        homepage = https://github.com/MoreUnit/MoreUnit-Eclipse ;
        description = "MoreUnit is an Eclipse plugin that should assist you in writing more unit tests" ;
    };
  };

}
