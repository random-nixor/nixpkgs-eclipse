#
# Java IDE
#
{ instance }:

let
    drop-site = http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release;

in
rec {

  java-473a = instance {
    name = "java-473a";
    meta = {
        description = "Eclipse IDE for Java Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-java-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "aec907057873671809dccad5d520fdcc3a5685a8607a57f413972bbd68f95614a2ea3787005b3d05162440690dab44a755fdcdd02b027a4d9d36b3f499e34a10";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-java-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "6333edb4556667d9606fc045032bafd8c54c21c056e03fd7e9fdb942d8da5cd183976ddbaff2383b5fe6d0da4f34a1caf5bfb9343f14e9069049c5b680895a21";
        };
    };
  };

  java-411 = instance {
    name = "java-411";
    meta = {
        description = "Eclipse IDE for Java Developers";
    };
    packages =  {
        x86_64-linux = {
            url = "${drop-site}/2019-03/R/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz";
            sha512 = "162fy84sdjyc8qz0zak8qydh362nzjyhbg49jyjkska9n730mqn212b77fpfmzcjs5v3lljvp4kh06s8yrlmdwkyqfwkd64y3yjaawv";
        };
    };
  };

}
