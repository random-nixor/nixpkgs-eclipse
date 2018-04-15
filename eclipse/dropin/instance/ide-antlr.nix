#
# Antlr IDE providers
#
{ instance, fetchzip, fetchsite }:

let 
in 
rec {

  # needs xtext
  ide-antlr-jknack-035 = instance.repoDir {
    name = "ide-antlr-jknack-035";
    src = fetchzip {
      stripRoot = false;
      url = "https://dl.bintray.com/jknack/antlr4ide/0.3.5/antlr4ide-plugin-0.3.5.zip" ;
      sha256 = "07nkb9n21jf9b15rqqz1438624msihksanyf5j9k47v7mglidd42";
    };
    meta = {
      homepage = https://github.com/jknack/antlr4ide ;
    };
  };

  # TODO needs ???
  ide-antlr-certiv = instance.repoDir {
    name = "ide-antlr-certiv";
    src = fetchsite {
      url = "http://www.certiv.net/updates" ;
      sha256 = "1a3aab24szyjnw774mnypvkc3f38sj76zhclcw1y5rv8zlnri018";
      # regexInclude = ""; 
    };
    meta = {
      homepage = http://www.certiv.net ;
    };
  };

}
