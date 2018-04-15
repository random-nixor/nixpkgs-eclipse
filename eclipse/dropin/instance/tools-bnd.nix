
{ instance, fetchsite }:

let 
    homepage = http://bndtools.org ;
in 
rec {

  tools-bnd-350 = instance.repoDir {
    name = "tools-bnd-350";
    src = fetchsite {
      url = "https://dl.bintray.com/bndtools/bndtools/3.5.0" ;
      sha256 = "1wzm7i7i7m5xx3xmyph0vjzw4nmx2ma3pcg4d1dsxjfamn5nhm3b";
    };
  };

}
