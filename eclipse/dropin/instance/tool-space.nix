#
# Workspace tools.
#
{ instance, fetchzip, fetchsite }:

let 
in 
rec {

  tool-space-110 = instance.repoDir {
    name = "tool-space-110";
    src = fetchsite {
      url = "https://dl.bintray.com/random-eclipse/eclipse/space-master" ;
      sha256 = "0ywdlg8lx00c9bq2svj1qi7p7wa9bwvzih1rf3jjpc79i111d95q";
    };
    meta = {
        homepage = https://github.com/random-eclipse/space-master ;
        description = "TODO" ;
    };
  };

}
