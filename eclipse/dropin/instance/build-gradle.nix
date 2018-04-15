#
# Gradle build integration
#
{ instance, fetchzip, fetchsite }:

let 
    drop-site = http://download.eclipse.org/buildship/updates;
    meta = {
        homepage = https://projects.eclipse.org/projects/tools.buildship ;
        description = "Eclipse Buildship: Eclipse Plug-ins for Gradle" ;
    };
in 
rec {

  build-gradle-221 = instance.repoDir {
    inherit meta;
    name = "build-gradle-221";
    src = fetchsite {
      url = "${drop-site}/e47/releases/2.x/2.2.1.v20180125-1441" ;
      sha256 = "17cwyljgc0h0x1xmlqvgzi0q323aj5g9070b6q4lmjslqvkv9kry";
    };
  };

}
