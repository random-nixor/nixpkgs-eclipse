#
# Editors for markdown
#

{ instance, fetchsite }:

let 
in 
rec {

  edit-md-certiv-100 = instance.repoDir {
    name = "edit-md-certiv-100";
    src = fetchsite {
      url = "http://www.certiv.net/updates" ;
      sha256 = "07a934lrvw5bk8whx53lvcyrp5gylhsq78vvzr1n6mkg67xrr680";
      regexInclude = 
      "net.certiv.tools(.+)1.0.7(.+)jar|net.certiv.fluentmark(.+)1.0.0(.+)jar|net.certiv.spellchecker(.+)3.3.1(.+)jar" ;
    };
    meta = {
        homepage = http://www.certiv.net ;
        description = "Markdown Editor" ;
    };
  };

}
