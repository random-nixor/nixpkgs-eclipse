#
# Scala IDE from scratch
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in
rec {

  scala-473a = instance {
    icon = "eclipse-scala-1";
    name = "scala-473a";
    super = product.java-473a;
    dropins = [
        ide-pde-473a
        ide-scala-471
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
#        "-Xms2g"
#        "-Xmx2g"
#        "-Dosgi.framework.extensions=org.eclipse.equinox.weaving.hook"
    ];
  };
  
  scala-411 = instance {
    icon = "eclipse-scala-1";
    name = "scala-411";
    super = product.java-411;
    dropins = [
        ide-pde-411
        ide-scala-471
    ];
    execArgs = [
#        "-clean"
    ];
    javaArgs = [
#        "-Xms2g"
#        "-Xmx2g"
#        "-Dosgi.framework.extensions=org.eclipse.equinox.weaving.hook"
    ];
  };
  
}
