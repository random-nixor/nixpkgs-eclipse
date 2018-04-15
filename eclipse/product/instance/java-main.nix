#
# Java IDE for work
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    super-473a = product.java-473a;
in 
rec {

  java-main-473a = instance {
    name = "java-main-473a";
    runtime = super-473a.runtime;
    dropins = super-473a.dropins ++ [
    
        file-explorer-basti-161

        ide-dltk-581
        ide-groovy-292

        tools-bnd-350
        
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
