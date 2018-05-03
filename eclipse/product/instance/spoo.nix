#
# Spoofax IDE from distro.
#
{ pkgs, instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  spoo-241 = instance {
    icon = "eclipse-java-1";
    name = "spoo-241";
    java = option.oraclejdk8auto;
    runtime = runtime.spoo-241;
    dropins = [
    
#        base-equinox-473a
        
#        build-gradle-221
#        build-maven-total-190
        
        ide-java-473a

        edit-json-boothen-110
        edit-md-certiv-100
        edit-yaml-oyse-1020
    
        file-explorer-basti-161

        ide-pde-473a
        ide-dltk-581
        tool-bnd-350
        
        scm-git-4110
        scm-svn-405
        
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
#        "-Xms2g"
#        "-Xmx2g"
#        "-Dosgi.checkConfiguration=true"
#        "-javaagent:${pkgs.lombok}/share/java/lombok.jar"
    ];
#    scriptList = [
#    ];
  };
  
}
