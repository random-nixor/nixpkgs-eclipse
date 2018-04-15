#
# R-project development
#
{ instance, fetchzip, fetchsite }:

let 
    meta = {
        homepage = http://www.walware.de/goto/statet ;
        description = "StatET is an Eclipse based IDE for R";
    };
in 
rec {

  ide-statet-362 = instance.repoDir {
    inherit meta;
    name = "ide-statet-362";
    src = fetchzip {
      stripRoot = false;
      url = "http://download.walware.de/eclipse-4.6/statet-3.6.2.zip" ;
      sha256 = "1m04dfz08a2mr9007iyg8qvfys23alqlv6zchm2v5y2hdxf3mdqh";
    };
    deps = [
    # FIXME need deps
    ];
  };

}
