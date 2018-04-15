#
# C/C++ development
#

{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/cdt ;
    drop-943 = http://download.eclipse.org/tools/cdt/releases/9.4/cdt-9.4.3;
in 
rec {

  ide-cdt-943 = instance.repoDir {
    name = "ide-cdt-943";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-943}/cdt-9.4.3.zip" ;
      sha256 = "17f2qrynrfm7ajjp2281myrn9y5af9p8khvyinxmcq66s0rw2pja";
    };
  };

}
