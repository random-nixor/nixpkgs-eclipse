#
# C/C++ development
#
{ instance, fetchzip }:

let 
    drop-943 = http://download.eclipse.org/tools/cdt/releases/9.4/cdt-9.4.3;
    meta = {
        homepage = https://www.eclipse.org/cdt ;
        description = "The CDT Project provides a fully functional C and C++ Integrated Development Environment";
    };
in 
rec {

  ide-cdt-943 = instance.repoDir {
    inherit meta;
    name = "ide-cdt-943";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-943}/cdt-9.4.3.zip" ;
      sha256 = "17f2qrynrfm7ajjp2281myrn9y5af9p8khvyinxmcq66s0rw2pja";
    };
  };

}
