#
# Scala IDE for work
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    super-473a = product.java-main-473a;
in
rec {

  scala-main-473a = instance {
    name = "scala-main-473a";
    runtime = super-473a.runtime;
    dropins = super-473a.dropins ++ [
        ide-pde-473a
        ide-scala-471
    ];
    execArgs = [
#        "-debug"
#        "-consoleLog"
    ];
    javaArgs = [
        "-Xms4g"
        "-Xmx4g"
#        "-Dosgi.framework.extensions=org.eclipse.equinox.weaving.hook"
    ];
  };
  
}
