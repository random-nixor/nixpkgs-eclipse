#
# Groovy development
#
{ instance, fetchsite }:

let 
    # NOTE: use build stamp regex selector
    meta = {
        homepage = https://github.com/groovy/groovy-eclipse ;
        description = "Eclipse Groovy Development Tools";
    };
in 
rec {

    # NOTE https://github.com/groovy/groovy-eclipse/issues/574
    ide-groovy-292 = instance.repoDir {
    inherit meta;
    name = "ide-groovy-292";
    src = fetchsite {
            url = "http://dist.springsource.org/release/GRECLIPSE/e4.7" ;
            sha256 = "10ic59s8hkb18yxkvxdj21v3x1xwcryn34mrfikf8sijnzd8z2sg";
            regexInclude = "(.+)201801041714(.*)[.]jar" ;
        };
    };

    ide-groovy-300 = instance.repoDir {
    inherit meta;
    name = "ide-groovy-300";
    src = fetchsite {
            url = "http://dist.springsource.org/snapshot/GRECLIPSE/e4.7" ;
            sha256 = "037vd08j2gzg6awcpqp0hbwj8k7dl1zklhjnvkyah219p3f0hiq3";
            regexInclude = "(.+)201805062220(.*)[.]jar" ;
        };
    };

    ide-groovy-330 = instance.repoDir {
    inherit meta;
    name = "ide-groovy-330";
    src = fetchsite {
            url = "https://dist.springsource.org/release/GRECLIPSE/e4.11" ;
            sha256 = "18nvgjziqz9ksiifd1f9qpss7gfm2gkc1zx7yd89aa85xzgk8lrl";
            regexInclude = "(.+)201903290242(.*)[.]jar" ;
        };
    };

}
