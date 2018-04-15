#
# Scala IDE from scratch
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    super-473a = product.java-473a;
in
rec {

  scala-473a = instance {
    name = "scala-473a";
    runtime = super-473a.runtime;
    dropins = super-473a.dropins ++ [
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
