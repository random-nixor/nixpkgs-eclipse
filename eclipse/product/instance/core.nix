#
# Product super type: with Java and more
#

{ instance, eclipse }:

with eclipse;
with dropin;

let
    # no super
in 
rec {

  core-473a = instance {
    name = "core-473a";
    runtime = runtime.core-473a;
    dropins = [
    ];
    execArgs = [
    ];
    javaArgs = [
        "-Xms1g"
        "-Xmx1g"
    ];
  };
  
}
