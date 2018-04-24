self: super:

with self.eclipse;

{

    eclipse-base = product.instance { 
       name = "base"; 
       super = product.base-473a; 
       dropins = [
            dropin.base-equinox-473a 
       ];
       execArgs = [
            "-clean" 
            "-data" "/home/work/space/base" 
       ];
       javaArgs = [
            "-Xms1G" "-Xmx1G" 
            "-Xverify:none" "-XX:-OmitStackTraceInFastThrow" 
            "-Djava.net.useSystemProxies=true"
       ];
    };

}
