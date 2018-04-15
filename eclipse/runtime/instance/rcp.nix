#
# Rich Client IDE
#

{ instance }:

let
    drop-site = http://download.eclipse.org/technology/epp/downloads/release ;

in
rec {

  rcp-473a = instance {
    name = "rcp-473a";
    meta = {
        description = "Eclipse for RCP and RAP Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-rcp-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "f4cd50c443c907090d2cea5940d0e8ad1d161ed03adb42753fed04e86da133a6a64c3d5c90c10ec7f13c486a49f6a2f9f13bd75c5c2c1aa32cc5b6d6ad7d09d4";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-rcp-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "cc5a96873b53251ce2f39c990d4bac5a56b449fb20f8c1a208290f2347f9ba52efbb4cfe0f26748f0bc85745c55989a30ab9482c08defdb1f0b61dc4c78e552c";
        };
    };
  };

}
