#
# Xmind organizer
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  xmind-87 = instance {
    icon = "eclipse-xmind-1";
    name = "xmind-87";
    super = product.base-473a;
    dropins = [
    
        base-equinox-473a
        
        ide-xmind-87
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
#        "-Xms1g"
#        "-Xmx1g"
#        "-Dosgi.checkConfiguration=true"
    ];
  };
  
}
