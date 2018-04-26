#
# Java IDE for work
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  java-dsl-473a = instance {
    icon = "eclipse-java-dsl-1";
    name = "java-dsl-473a";
    super = product.java-main-473a;
    dropins = [
    
        ide-xtext-2130
        
        ide-pde-473a
    
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
