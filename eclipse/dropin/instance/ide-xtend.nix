##
## Java Alt development.
##
#{ instance, fetchzip, fetchsite, dropin }:
#
#with dropin;
#
#let
#    drop-site = http://download.eclipse.org/modeling/tmf/xtext/downloads/drops ; 
#    meta = {
#        homepage = http://www.eclipse.org/xtend ;
#        description = "Xtend is a flexible and expressive dialect of Java";
#    };
#in 
#rec {
#
#  ide-xtend-000 = instance.repoDir {
#    inherit meta;
#    name = "ide-xtend-000";
#    src = fetchzip {
#      stripRoot = false;
#      url = "${drop-site}/???" ;
#      sha256 = "???";
#    };
#    deps = [
#    ]
#    ;
#  };
#
#}
