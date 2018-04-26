#
# Product super type: with Java and more
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  core-473a = instance {
    icon = "eclipse-2";
    name = "core-473a";
    runtime = runtime.core-473a;
    dropins = [
    ];
    execArgs = [
    ];
    javaArgs = [
#        "-Xms1g"
#        "-Xmx1g"
    ];
  };
  
}
