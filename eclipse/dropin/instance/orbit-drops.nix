#
# Dependency bundles provided by Orbit drops.
#
{ instance, fetchurl, fetchzip }:

let
    drops = http://download.eclipse.org/tools/orbit/downloads/drops ;
    drops2 = http://download.eclipse.org/tools/orbit/downloads/drops2 ;
    meta = {
        homepage = https://www.eclipse.org/orbit ;
        description = "Orbit will provide a repository of bundled versions of third party libraries";
    };
in 
rec {

  orbit-antlr-runtime-300 = instance.repoJars {
    name = "orbit-antlr-runtime-300";
    plugins = [
        (fetchurl{
          url = "${drops}/R20150519210750/repository/plugins/org.antlr.runtime_3.0.0.v200803061811.jar" ;
          sha256 = "1vv7arqsb2mxxhfnfgwq82nnd2ycxbnz7zvgnhzhxm18r09cqphp";
        })
    ];
  };

  orbit-google-inject-300 = instance.repoJars {
    name = "orbit-google-inject-300";
    plugins = [
        (fetchurl{
          url = "${drops}/R20170303204511/repository/plugins/com.google.inject_3.0.0.v201605172100.jar" ;
          sha256 = "0fy6khxqhy0r5wc4i2akrzqwns8f8c3i1njzb7c4630q6f4sw8qj";
        })
    ];
  };

  orbit-objectweb-asm-520 = instance.repoJars {
    name = "orbit-objectweb-asm-520";
    plugins = [
        (fetchurl{
          url = "${drops2}/R20180330011457/repository/plugins/org.objectweb.asm_5.2.0.v20180228-1718.jar" ;
          sha256 = "0qm6cxg6k0bc3430a70g46i9a8rlc6wwngrwrxbsdclbiqlgdb8f";
        })
    ];
  };

}
