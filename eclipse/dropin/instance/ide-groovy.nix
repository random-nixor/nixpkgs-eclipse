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
            sha256 = "0jwlwirx9ghz9402pykrxfk1hr4p6gjfsdz0pwqgpwk0a6gfw3jf";
            regexInclude = "(.+)201804221531(.*)[.]jar" ;
        };
    };

}
