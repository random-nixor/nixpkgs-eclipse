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
    
        file-explorer-basti-161

        ide-dltk-581
        
# FIXME https://github.com/groovy/groovy-eclipse/issues/574
#        ide-groovy-292

        tool-bnd-350
        tool-jd-100
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
        "-Xms2g"
        "-Xmx2g"
#        "-Dosgi.checkConfiguration=true"
    ];
  };
  
}
