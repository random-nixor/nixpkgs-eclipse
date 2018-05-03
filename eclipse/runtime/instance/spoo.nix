#
# Spoofax IDE 
#
{ instance }:

let
    drop-site = http://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/org.metaborg.spoofax.eclipse.dist ;
    meta = {
        homepage = http://www.metaborg.org/en/latest/ ;
        description = "Spoofax Language Workbench";
    };
in
rec {

  spoo-241 = instance {
    inherit meta;
    name = "spoo-241";
    layout.root = "spoofax";
    packages =  {
        i686-linux = {
            url = "${drop-site}/2.4.1/org.metaborg.spoofax.eclipse.dist-2.4.1-linux-x86.tar.gz";
            sha512 = "0a5a7995d71a840aaef6c9fac848ed45fabf7313e5c26dd8b9f16bf97e6cdc865e1e102005a4b217de0f667bcdedcb798c9007c1063ceb36de01425b27e72395";
        };
        x86_64-linux = {
            url = "${drop-site}/2.4.1/org.metaborg.spoofax.eclipse.dist-2.4.1-linux-x64.tar.gz";
            sha512 = "2w7k9y8p8wnrm0304zlj1dg8vhk6yjgw3j8wdzf4zjbbkny0wjph6d083whp7ayv1gf1w0ms9yvcm6863w01pjkcr3zg27zil72xwjx";
        };
    };
  };

}
