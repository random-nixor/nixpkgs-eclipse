#
# Scala development
#
{ instance, fetchurl, fetchzip }:

let
    meta = {
        homepage = http://scala-ide.org ;
        description = "Scala IDE for development Scala/Java applications";
    };
    scalor-drops = http://repo1.maven.org/maven2/com/carrotgarden/maven/scalor-maven-plugin_2.12 ;
    scalor-meta = {
        homepage = https://github.com/random-maven/scalor-maven-plugin ;
        description = "Build integrator for Java, Scala, Scala.macro, Scala.js, Scala.native, Eclipse and Maven";
    };
in
rec {

  ide-scala-471 = instance.repoDir {
    inherit meta;
    name = "ide-scala-471";
    src = fetchzip {
      stripRoot = true;
      url = "http://download.scala-ide.org/sdk/lithium/e47/scala212/dev/update-site.zip" ;
      sha256 = "1gdi95m14vjiwz76z0jq3bm340lsfzfnb1gjnviisi9dp7xvk81i";
      # https://github.com/NixOS/nixpkgs/issues/38649
      extraPostFetch = ''
        chmod go-w $out
      '';
    };
  };
  
  scalor-maven-141 = instance.repoJars {
    meta = scalor-meta;
    name = "scalor-maven-141";
    plugins = [
        (fetchurl{
          url = "${scalor-drops}/1.4.1.20180403213227/scalor-maven-plugin_2.12-1.4.1.20180403213227.jar" ;
          sha256 = "1lm42dqc3dh50aw41pxmmf1a1l7qclzrbbgllw71m3pw3qxqpdad";
        })
    ];
  };

  scalor-maven-142 = instance.repoJars {
    meta = scalor-meta;
    name = "scalor-maven-142";
    plugins = [
        (fetchurl{
          url = "${scalor-drops}/1.4.2.20180508161326/scalor-maven-plugin_2.12-1.4.2.20180508161326.jar" ;
          sha256 = "18zwcbj8dgpk23acj7384a8yrvbcd6q1slalqa7fdnwy17fqw7m5";
        })
    ];
  };

}
