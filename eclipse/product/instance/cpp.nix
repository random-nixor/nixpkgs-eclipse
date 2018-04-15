#
# Java IDE from scratch
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    super-473a = product.base-473a;
in 
rec {

  cpp-473a = instance {
    name = "cpp-473a";
    runtime = super-473a.runtime;
    dropins = super-473a.dropins ++ [
    
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
#        "-Dosgi.checkConfiguration"
    ];
  };
  
}
