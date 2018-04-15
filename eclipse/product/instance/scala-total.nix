#
#
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    super-473a = product.scala-main-473a;
in
rec {

  scala-total = instance {
    name = "scala-total";
    runtime = super-473a.runtime;
    dropins = super-473a.dropins ++ [
    
    ];
    execArgs = [
#        "-debug"
#        "-consoleLog"
    ];
    javaArgs = [
        "-Xms6g"
        "-Xmx6g"
    ];
  };
  
}
