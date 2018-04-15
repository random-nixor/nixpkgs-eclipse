#
# Xtext IDE
#

{ instance }:

let
    drop-site = http://download.eclipse.org/technology/epp/downloads/release ;
in
rec {

  java-dsl-473a = instance {
    name = "java-dsl-473a";
    meta = {
        description = "Eclipse IDE for Java and DSL Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-dsl-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "90251a659f5b60b0af7e374954345aa222511cc4eb3702f9b534c8cb2ca6f848a3cf5644e01f1e05d114d9719bce356461aba6d6fe1b3f7f31ebed2f94852f5e";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-dsl-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "1pk681b9jk1pfmaz9wf3rf3fm0xx1cqnxrrvmhmp0ifgpffsk3yii3k07xscw5ry8xnq475snjlm4rpbi0ry4qsvapxxwh4ib2279qi";
        };
    };
  };

}
