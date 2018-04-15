#	Eclipse SDK
#	The Eclipse SDK includes the Eclipse Platform, Java development tools, 
#	and Plug-in Development Environment, including source and both user and programmer documentation. 
#	If you aren't sure which download you want... then you probably want this one. 

{ instance }:

let
    drop-site = http://download.eclipse.org/eclipse/downloads ;
    drop-473a = "${drop-site}/drops4/R-4.7.3a-201803300640" ;
in
rec {

  core-473a = instance {
    name = "core-473a";
    meta = {
        description = "Eclipse Platform SDK";
    };
    packages =  {
        i686-linux = {
            url = "${drop-473a}/eclipse-SDK-4.7.3a-linux-gtk.tar.gz";
            sha512 = "b0b936fd4142ae86ec5c30535cd5e4caf6fe313d814ae5b16f300635e4163a79b748b1eee11792a135114f2265678a74821ec80c2bfd69872769b6d0ccbcde3a";
        };
        x86_64-linux = {
            url = "${drop-473a}/eclipse-SDK-4.7.3a-linux-gtk-x86_64.tar.gz";
            sha512 = "d77e42aca16d26526cef32e363d038258bb8a4616d9dbe6e76dd3656dc2217369436390a82555bde4566bbbdb631813bbaca08602f7bb885cb30e8a26a14873f";
        };
    };
  };

}
