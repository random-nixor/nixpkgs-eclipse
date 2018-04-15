#
# Editors for YAML
#
{ instance, fetchsite }:

let 
in 
rec {

  edit-yaml-oyse-1020 = instance.repoDir {
    name = "edit-yaml-oyse-1020";
    src = fetchsite {
      url = "http://dadacoalition.org/yedit" ;
      sha256 = "1kwbnkcqlbbmwpc9f1sxsx0av666bpc63m5d2g3z10hq8g60igrv";
      regexInclude = "org.dadacoalition.(.+)_1.0.20.201509041456-RELEASE.jar";
    };
    meta = {
       homepage = https://github.com/oyse/yedit ;
       descriptions = "YEdit is a YAML editor for Eclipse" ;
    };
  };

}
