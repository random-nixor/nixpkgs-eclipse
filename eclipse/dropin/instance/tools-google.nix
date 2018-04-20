#
#{ instance, fetchurl, fetchzip }:
#
#let
#    orbit-drops = http://download.eclipse.org/tools/orbit/downloads/drops ;
#in 
#rec {
#
#  tools-log-slf4j = instance.repoJars {
#    inherit meta;
#    name = "tools-log-slf4j";
#    features = [
#    ];
#    plugins = [
#        (fetchurl{
#          url = "${orbit-drops}/R20170303204511/repository/plugins/org.slf4j.api_1.7.2.v20121108-1250.jar" ;
#          sha256 = "1njsiqi22kgf39xg2z0c8bvk1zwg4jwdbshys0qhyiim3ywdrgck";
#        })
#    ];
#  };
#
#}
