#
# Editor suite for: JavaScript + Server side Java 
#

{ instance, fetchzip, fetchsite }:

let
    home-page = https://www.eclipse.org/webtools ;
    drop-site = http://download.eclipse.org/webtools/downloads/drops ; 
in 
rec {

  # need emf gmf
  ide-wtp-393 = instance.repoDir {
    name = "ide-wtp-393";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/R3.9.3/R-3.9.3-20180302093744/wtp-repo-R-3.9.3-20180302093744.zip" ;
      sha256 = "1n2ak1qyl0w7yzzlg4dag823802ja25rqx6v8znq45cq3mdzrv6n";
    };
  };

}
