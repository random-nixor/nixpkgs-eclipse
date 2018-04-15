#
# Editor suite for: JavaScript + Server side Java 
#
{ instance, fetchzip, fetchsite }:

let
    drop-site = http://download.eclipse.org/webtools/downloads/drops ; 
    meta = {
        homepage = https://www.eclipse.org/webtools ;
        description = "Eclipse Web Tools Platform (WTP) for developing Web and Java EE applications";
    };
in 
rec {

  # FIXME need emf gmf
  ide-wtp-393 = instance.repoDir {
    inherit meta;
    name = "ide-wtp-393";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/R3.9.3/R-3.9.3-20180302093744/wtp-repo-R-3.9.3-20180302093744.zip" ;
      sha256 = "1n2ak1qyl0w7yzzlg4dag823802ja25rqx6v8znq45cq3mdzrv6n";
    };
  };

}
