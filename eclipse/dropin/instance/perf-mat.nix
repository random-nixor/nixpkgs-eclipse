#
# Memory Analyzer (MAT)
#
{ instance, fetchzip, dropin }:

with dropin;

let 
    meta = {
        homepage = https://www.eclipse.org/mat ;
        description = "Eclipse Memory Analyzer is a fast and feature-rich Java heap analyzer" ;
    };
in 
rec {

  perf-mat-170 = instance.repoDir {
    inherit meta;
    name = "perf-mat-170";
    src = fetchzip {
      stripRoot = false;
      url = "http://download.eclipse.org/mat/1.7/MemoryAnalyzer-1.7.0.201706130745.zip" ;
      sha256 = "067v8adlf3qznvlzkm62q79j37y7vmw32l2kk47wh8bi684pjs3h";
    };
    deps = [
        ide-birt-470
    ];
  };

}
