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
        build-maven-total-190
        
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
#        "-javaagent:${pkgs.lombok}/share/java/lombok.jar"
    ];
  };
  
  java-411 = instance {
    icon = "eclipse-java-1";
    name = "java-411";
    runtime = runtime.java-411;
    dropins = [
    
#        base-equinox-411

#        scm-git-53
#        scm-svn-405

#        ide-java-411
        
#        build-gradle-301
#        build-maven-total-1110
#        
#        
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
        "-Xms1g"
        "-Xmx1g"
#        "-Dosgi.checkConfiguration=true"
#        "-javaagent:${pkgs.lombok}/share/java/lombok.jar"
    ];
  };
  
}
