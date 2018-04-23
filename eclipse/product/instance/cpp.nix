#
# Java IDE from scratch
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  cpp-473a = instance {
    icon = "eclipse-cpp-1";
    name = "cpp-473a";
    super = product.base-473a;
    dropins = [
    
        base-equinox-473a
        
        ide-cdt-943
        
        scm-git-4110
        scm-svn-405
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
        "-Xms1g"
        "-Xmx1g"
#        "-Dosgi.checkConfiguration=true"
    ];
  };
  
}
