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
        "-Xms2g"
        "-Xmx2g"
#        "-Dosgi.framework.extensions=org.eclipse.equinox.weaving.hook"
    ];
  };
  
}
