#
# PHP IDE 
#

{ instance }:

let
    drop-site = http://download.eclipse.org/technology/epp/downloads/release ;
in
rec {

  php-473a = instance {
    name = "php-473a";
    meta = {
        description = "Eclipse IDE for PHP Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-php-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "ba5a7995d71a840aaef6c9fac848ed45fabf7313e5c26dd8b9f16bf97e6cdc865e1e102005a4b217de0f667bcdedcb798c9007c1063ceb36de01425b27e72395";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-php-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "7b1abd9d47c5c12f94203127ceeb0fa068cc99b6cb9df7b5dfe5ea96ec8d8e4fb26c73e2e2698408ecc707c5b24f585d51854f64bd88a1fc2f4eb6512e1a7739";
        };
    };
  };

}
