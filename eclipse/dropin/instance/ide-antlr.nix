#
# Antlr IDE providers
#
{ instance, dropin, fetchurl, fetchzip, fetchsite }:

with dropin;

let 
    orbit-drops = http://download.eclipse.org/tools/orbit/downloads/drops ;
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
    deps = [
    ];
  };

  # needs gef
  ide-antlr-certiv-470 = instance.repoDir {
    name = "ide-antlr-certiv-470";
    src = fetchsite {
      url = "http://www.certiv.net/updates" ;
      sha256 = "1mqfmwqrghd4bgmxswr7vvj5i4glx2zc8nr0zc8qmv9x0dchlp3q";
      regexInclude = "(.+)20171212(.+)[.]jar"; 
    };
    meta = {
      homepage = http://www.certiv.net ;
    };
# org.apache.commons.io_2.2.0.v201405211200.jar
# org.apache.commons.lang3_3.1.0.v201403281430.jar
# org.eclipse.draw2d_3.10.100.201606061308.jar
# org.eclipse.zest.core_1.5.300.201606061308.jar
# org.eclipse.zest.layouts_1.1.300.201606061308.jar
    deps = [
        model-gef-502 # FIXME reduce
        ide-antlr-deps-000
    ];
  };
  
  ide-antlr-deps-000 = instance.repoJars {
    name = "ide-antlr-deps-000";
    meta = {
        description = "Certiv Antlr dependencies" ;
    };
    plugins = [
        (fetchurl{
          url = "${orbit-drops}/R20170303204511/repository/plugins/org.apache.commons.io_2.2.0.v201405211200.jar" ;
          sha256 = "09h5vfij726b225si429bgg0mwjk9jp2damx89m658x8xjjwm6sq";
        })
        (fetchurl{
          url = "${orbit-drops}/R20170303204511/repository/plugins/org.apache.commons.lang3_3.1.0.v201403281430.jar" ;
          sha256 = "015ar9nfzqw3ywvf9f71cd4lvk6vvh9xzlf1nb7d9n3v8x7mx38w";
        })
    ];
  };

}
