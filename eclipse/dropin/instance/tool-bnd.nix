#
# Bndtools for OSGi 
#
{ instance, fetchsite }:

let 
    meta = {
        homepage = http://bndtools.org ;
        description = "The easy, powerful and productive way to develop with OSGi" ;
    };
in 
rec {

  tool-bnd-350 = instance.repoDir {
    inherit meta;
    name = "tool-bnd-350";
    src = fetchsite {
      url = "https://dl.bintray.com/bndtools/bndtools/3.5.0" ;
      sha256 = "1wzm7i7i7m5xx3xmyph0vjzw4nmx2ma3pcg4d1dsxjfamn5nhm3b";
    };
  };

}
