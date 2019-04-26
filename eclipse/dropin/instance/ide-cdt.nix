#
# C/C++ development
#
{ instance, fetchzip, fetchurl }:

let 
    drop-site = http://ftp.osuosl.org/pub/eclipse/tools/cdt/releases ;
    site1903 = http://download.eclipse.org/releases/2019-03/201903201000 ;
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
    deps = ide-cdt-deps;
  };
  
  ide-cdt-deps = [
    ide-cdt-launchbar
  ];
  
  ide-cdt-launchbar = instance.repoJars {
    meta = {
        description = "CDT / dependencies" ;
    };
    name = "ide-cdt-launchbar";
    features = [
    ];
    plugins = [
        (fetchurl{
          url = "${site1903}/plugins/org.eclipse.launchbar.core_2.2.3.201902041137.jar" ;
          sha256 = "1m2dbvw9a05cbs5ihx2n1la389x9hpsx4g60a1r99a13g56imv2d";
        })
        (fetchurl{
          url = "${site1903}/plugins/org.eclipse.launchbar.remote.core_1.0.2.201902041137.jar" ;
          sha256 = "074hbngk0c8znn2kkcjpk3xkij4j3j0sp2r1slahyaw1ppk068ky";
        })
        (fetchurl{
          url = "${site1903}/plugins/org.eclipse.launchbar.remote.ui_1.0.1.201902041137.jar" ;
          sha256 = "0vcv3f96cq0i6wfhbz1cab6kla9if0ajd1nay433b9j6d81ww2bc";
        })
        (fetchurl{
          url = "${site1903}/plugins/org.eclipse.launchbar.ui.controls_1.0.2.201902041137.jar" ;
          sha256 = "18k53nm3xjyb78hmsx14y65wg8757y8n5v7srasfml5j5i4g8si4";
        })
        (fetchurl{
          url = "${site1903}/plugins/org.eclipse.launchbar.ui_2.2.3.201902041137.jar" ;
          sha256 = "0az68sfladb3nz7bnrmwd30f2hkqn1c92s37iynzllkc35yrq9xy";
        })
    ];
  };
  

}
