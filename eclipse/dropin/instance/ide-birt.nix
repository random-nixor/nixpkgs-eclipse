#
# Eclipse reporting IDE 
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/birt/downloads/drops;
    meta = {
        homepage = https://www.eclipse.org/birt ;
        description = "BIRT technology platform to create data visualizations and reports";
    };
in 
rec {

  ide-birt-470 = instance.repoDir {
    inherit meta;
    name = "ide-birt-470";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/R-R1-4.7.0-201706222054/birt-report-framework-4.7.0-20170622.zip" ;
      sha256 = "0ahhvwj4lm9qmmahlnivklspw0ha874fcylgkrhxxm3d66rb98lq";
    };
  };

}
