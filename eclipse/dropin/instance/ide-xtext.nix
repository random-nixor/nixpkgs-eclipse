#
# Java DSL development
#

{ instance, fetchzip, fetchsite }:

let
    home-page = https://www.eclipse.org/Xtext ;
    drop-site = http://download.eclipse.org/modeling/tmf/xtext/downloads/drops ; 
in 
rec {

  # need emf gmf
  ide-xtext-2130 = instance.repoDir {
    name = "ide-xtext-2130";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.13.0/N201710240209/tmf-xtext-Update-N201710240209.zip" ;
      sha256 = "0qqcwxyvpasanw32nwgcvndj6bifhj6b2hfnskvix8kk2mh8pshx";
    };
  };

}
