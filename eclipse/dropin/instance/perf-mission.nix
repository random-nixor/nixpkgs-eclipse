#
# Java Mission Control (Oracle JMC)
#

{ instance, fetchzip, fetchsite }:

let 
    drop-site = http://download.oracle.com/technology/products/missioncontrol/updatesites ;
in 
rec {

  # complete set
  perf-mission-600 = [
    perf-mission-base-600
    perf-mission-supported-600
    perf-mission-experimental-600
  ];

  perf-mission-base-600 = instance.repoDir {
    name = "perf-mission-base-600";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/jmc-updatesite-6.0.0.zip" ;
      sha256 = "0136myg8g7jsazf8vz964dv0r1gcjjvh56n7v9si7c2w9v2zx1qr";
    };
    meta = {
        homepage = http://download.oracle.com/technology/products/missioncontrol/updatesites/base/6.0.0/eclipse/ ;
        description = "Java Mission Control for Eclipse to help develop, profile and diagnose Java HotSpot VM";
    };
  };

  perf-mission-supported-600 = instance.repoDir {
    name = "perf-mission-supported-600";
    src = fetchsite {
      url = "${drop-site}/supported/6.0.0/eclipse" ;
      
      sha256 = "1v4apvjl49v7w4fl4iyylhrbiz1ridhppyrdirilav8kazqsr4gw";
    };
    meta = {
        homepage = http://download.oracle.com/technology/products/missioncontrol/updatesites/supported/6.0.0/eclipse/ ;
        description = "The Supported Plug-ins for Java Mission Control";
    };
  };

  perf-mission-experimental-600 = instance.repoDir {
    name = "perf-mission-experimental-600";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/jmc-experimental-ide-6.0.0.zip" ;
      sha256 = "0kq7lxwmmpr0ifbinfa46r7jgixdaid44v4fd41r03nmj7k9w1jn";
    };
    meta = {
        homepage = http://download.oracle.com/technology/products/missioncontrol/updatesites/experimental/6.0.0/eclipse/ ;
        description = "The Experimental Plug-ins for Java Mission Control";
    };
  };

}
