#
# Web tools IDE
#

{ instance }:

let
    drop-site = http://download.eclipse.org/technology/epp/downloads/release ;
in
rec {

  java-ee-473a = instance {
    name = "java-ee-473a";
    meta = {
        description = "Eclipse IDE for Java EE Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-jee-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "d9c0566173884ad0e3d6b52f4645010021d9a4b680cc4c5accbe4770f66fd88fc7dccdea2d7153879072f4e2da6075f1965646b025cb24549c20d15a3cf8aac1";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "55c696a9ee1a8c1085434650a1de54ab0ed91d1a00858b5a0cb804578ddf6587393dd65dcb6af37a71819affeb91e0752e23aa6c8e985ae3b621b87e3b665d29";
        };
    };
  };

}
