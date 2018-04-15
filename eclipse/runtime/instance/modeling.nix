#
# Parsley IDE
#

{ instance }:

let
    drop-site = http://download.eclipse.org/technology/epp/downloads/release ;
in
rec {

  modeling-473a = instance {
    name = "modeling-473a";
    meta = {
        description = "Eclipse IDE with Modeling Tools";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-modeling-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "114970e12151e181932a4d9e2c707b1e4df2ce211cb9ffbad8602c6a80fd01d8ef40293df16674515c79e345bf930666e750ad771e1bf22bcda895a95eb60926";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-modeling-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "c859e65bd2d824e70cec5f3b5f8617d6c59cf74ba703c3193290825577ce8d252f5530c4576df29cf1781ddc084eced762898de0ff23c0288765266dcda3696e";
        };
    };
  };

}
