#
# Product super type: bare minimum
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in 
rec {

  base-473a = instance {
    name = "base-473a";
    runtime = runtime.base-473a;
    dropins = [
    ];
    execArgs = [
    ];
    javaArgs = [
#        "-Djava.net.useSystemProxies=true"
    ];
  };
  
}
