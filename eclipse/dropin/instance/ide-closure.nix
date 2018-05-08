#
# Clojure development
#
{ instance, fetchsite }:

let 
    # NOTE: use build stamp regex selector
    meta = {
        homepage = https://github.com/ccw-ide/ccw ;
        description = "Counterclockwise is an Eclipse plugin helping developers write Clojure code";
    };
in 
rec {

    ide-clojure-0351 = instance.repoDir {
    inherit meta;
    name = "ide-clojure-0351";
    src = fetchsite {
            url = "http://updatesite.ccw-ide.org/branch/master/master-0.35.1.STABLE001" ;
            sha256 = "1hv6a6r28i1z58bygyhclj9gw7sspv6lplylzir3scfnnyv85sc9";
#            regexInclude = "(.+)201801041714(.*)[.]jar" ;
        };
    };

}
