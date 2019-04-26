#
# Java IDE complete
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  java-total-411 = instance {
    icon = "eclipse-java-2";
    name = "java-total-411";
    super = product.java-411;
    java = option.oraclejdk8auto;
    dropins = [
    
#        edit-json-boothen-112
#        edit-md-certiv-100
#        edit-yaml-oyse-1020
#    
#        file-explorer-basti-161
#
#        ide-dltk-590
#        
#        ide-groovy-330
#
#        ide-pde-411
#
#        tool-bnd-420
#        tool-jd-100
#        tool-moreunit-320

        ide-cdt-970
        
    ];
    execArgs = [
    ];
    javaArgs = [
    ];
  };
  
}
