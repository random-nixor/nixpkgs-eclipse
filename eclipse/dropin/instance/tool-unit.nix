#
# Unit testing tools.
#
{ instance, fetchzip }:

let 
    moreunit-drop-site = https://github.com/MoreUnit/MoreUnit-Eclipse/releases/download ;
    moreunit-homepage = https://github.com/MoreUnit/MoreUnit-Eclipse ;
    moreunit-description = "MoreUnit is an Eclipse plugin that should assist you in writing more unit tests" ;
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
        homepage = "${moreunit-homepage}" ;
        description = "${moreunit-description}" ;
    };
  };

  tool-moreunit-320 = instance.repoDir {
    name = "tool-moreunit-320";
    src = fetchzip {
      stripRoot = false;
      url = "${moreunit-drop-site}/v3.2.0/org.moreunit.updatesite-3.2.0.zip" ;
      sha256 = "07qqbzwhg9gz3mif96hgvrnf18i14z4mjjsyi6z0igh15qh4xnw5";
    };
    meta = {
        homepage = "${moreunit-homepage}" ;
        description = "${moreunit-description}" ;
    };
  };

}
