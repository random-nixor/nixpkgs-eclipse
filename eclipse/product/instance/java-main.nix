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
    dropins = [
    
        edit-json-boothen-110
        edit-md-certiv-100
        edit-yaml-oyse-1020
    
        file-explorer-basti-161

        ide-dltk-581
        
# FIXME https://github.com/groovy/groovy-eclipse/issues/574
#        ide-groovy-292
        ide-groovy-300

        tool-bnd-350
        tool-jd-100
        
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
