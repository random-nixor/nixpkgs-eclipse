#
# C/C++ development
#
{ instance, fetchzip }:

let 
    drop-site = http://ftp.osuosl.org/pub/eclipse/tools/cdt/releases ;
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
      url = "${drop-site}/9.4/cdt-9.4.3/cdt-9.4.3.zip" ;
      sha256 = "17f2qrynrfm7ajjp2281myrn9y5af9p8khvyinxmcq66s0rw2pja";
    };
  };

  ide-cdt-970 = instance.repoDir {
    inherit meta;
    name = "ide-cdt-970";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/9.7/cdt-9.7.0/cdt-9.7.0.zip" ;
      sha256 = "19qv793p99158sc5r1b4fi7gqgmj20i50yp9ycr2gnygwpnvy7b5";
    };
  };

}
