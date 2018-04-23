#
# Scala IDE for work
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in
rec {

  scala-main-473a = instance {
    icon = "eclipse-scala-2";
    name = "scala-main-473a";
    super = product.java-main-473a;
    dropins = [
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
