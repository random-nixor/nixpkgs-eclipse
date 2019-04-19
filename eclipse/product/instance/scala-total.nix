#
#
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in
rec {

  scala-total-473a = instance {
    icon = "eclipse-3";
    name = "scala-total-473a";
    super = product.scala-main-473a;
    dropins = [
        ide-cdt-943
        ide-mcu-451
        ide-pydev-632
    ];
    execArgs = [
#        "-debug"
#        "-consoleLog"
    ];
    javaArgs = [
#        "-Xms6g"
#        "-Xmx6g"
    ];
  };
  
  scala-total-411 = instance {
    icon = "eclipse-3";
    name = "scala-total-411";
    super = product.scala-main-411;
    dropins = [
        ide-cdt-970
        ide-mcu-451
        ide-pydev-720
    ];
    execArgs = [
    ];
    javaArgs = [
    ];
  };
  
}
