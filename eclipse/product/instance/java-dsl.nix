#
# Java IDE for work
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    super-473a = product.java-main-473a;
in 
rec {

  java-dsl-473a = instance {
    name = "java-dsl-473a";
    runtime = super-473a.runtime;
    dropins = super-473a.dropins ++ [
    
        ide-xtext-2130
        
        ide-pde-473a
    
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
        "-Xms2g"
        "-Xmx2g"
#        "-Dosgi.checkConfiguration"
    ];
  };
  
}
