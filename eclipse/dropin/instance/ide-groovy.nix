#
# Groovy development
#


{ instance, fetchsite }:

let 
    home-page = https://github.com/groovy/groovy-eclipse ;
in 
rec {

  ide-groovy-292 = instance.repoDir {
    name = "ide-groovy-292";
    src = fetchsite {
      url = "http://dist.springsource.org/release/GRECLIPSE/e4.7" ;
      sha256 = "10ic59s8hkb18yxkvxdj21v3x1xwcryn34mrfikf8sijnzd8z2sg";
      regexInclude = "(.+)201801041714(.+)[.]jar" ;
    };
  };

}
