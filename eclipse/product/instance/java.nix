#
# Java IDE from scratch
#
{ pkgs, instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  java-473a = instance {
    icon = "eclipse-java-1";
    name = "java-473a";
    super = product.base-473a;
    dropins = [
    
        base-equinox-473a
        
        build-gradle-221
        build-maven-190
        
        ide-java-473a
        
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
        "-javaagent:${pkgs.lombok}/share/java/lombok.jar"
    ];
  };
  
}
