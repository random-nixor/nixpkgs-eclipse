#
# Java IDE for work
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  java-main-473a = instance {
    icon = "eclipse-java-2";
    name = "java-main-473a";
    super = product.java-473a;
    java = option.oraclejdk8auto;
    dropins = [
    
        edit-json-boothen-110
        edit-md-certiv-100
        edit-yaml-oyse-1020
    
        file-explorer-basti-161

#        ide-dltk-581
        ide-dltk-590
        
# FIXME https://github.com/groovy/groovy-eclipse/issues/574
#        ide-groovy-292
        ide-groovy-300

        ide-pde-473a

        tool-bnd-350
        tool-jd-100
        tool-moreunit-311
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
#        "-Xms2g"
#        "-Xmx2g"
#        "-Dosgi.checkConfiguration=true"
    ];
  };

  java-main-411 = instance {
    icon = "eclipse-java-2";
    name = "java-main-411";
    super = product.java-411;
    java = option.oraclejdk8auto;
    dropins = [
    
        edit-json-boothen-112
        edit-md-certiv-100
        edit-yaml-oyse-1020
    
        file-explorer-basti-161

        ide-dltk-590
        
        ide-groovy-330

        ide-pde-411

        tool-bnd-420
        tool-jd-100
        tool-moreunit-320
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
#        "-Xms2g"
#        "-Xmx2g"
#        "-Dosgi.checkConfiguration=true"
    ];
  };
  
}
