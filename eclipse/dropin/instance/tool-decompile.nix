#
# Java Decompilers
#
{ instance, fetchzip }:

let 
in 
rec {

  tool-jd-100 = instance.repoDir {
    name = "tool-jd-100";
    src = fetchzip {
      stripRoot=false;
      url = "https://github.com/java-decompiler/jd-eclipse/releases/download/v1.0.0/jd-eclipse-site-1.0.0-RC2.zip" ;
      sha256 = "079bdlyny2d98w0as8bfkmyh1cr98dvp2ccg6vyi4fdl3rmpxrl3";
    };
    meta = {
        homepage = https://github.com/java-decompiler/jd-eclipse ;
        description = "JD-Eclipse, a Java decompiler plug-in for the Eclipse platform" ;
    };
  };
  
  # TODO http://www.benf.org/other/cfr/index.html

}
