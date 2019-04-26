# Platform Runtime Binary
# These drops contain only the Eclipse Platform with user documentation 
# and no source and no programmer documentation. 
# The Java development tools and Plug-in Development Environment are NOT included. 
{ instance }:

let
    drop-site = http://download.eclipse.org/eclipse/downloads ;
in
rec {

  base-473a = instance {
    name = "base-473a";
    meta = {
        description = "Eclipse Platform";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/drops4/R-4.7.3a-201803300640/eclipse-platform-4.7.3a-linux-gtk.tar.gz";
            sha512 = "c633da467774e4ab40f8d51d07b8e7d8403f26f23365c3c3ceeaeec1039b8c23c7508cee1f786bf52db64c7b84e0f91cb31a2848a74ac8271f8504934407bd5c";
        };
        x86_64-linux = {
            url = "${drop-site}/drops4/R-4.7.3a-201803300640/eclipse-platform-4.7.3a-linux-gtk-x86_64.tar.gz";
            sha512 = "caf86cd6efaf66258c75434f1adf552587a7395d57dba4cfd20f86196308cf942866d931f4b352f9d39a6fbf14444fcd2167e6bfd146a28c96c229bb9988156a";
        };
    };
  };
  
  base-411 = instance {
    name = "base-411";
    meta = {
        description = "Eclipse Platform";
    };
    packages =  {
        x86_64-linux = {
            url = "${drop-site}/drops4/R-4.11-201903070500/eclipse-platform-4.11-linux-gtk-x86_64.tar.gz";
            sha512 = "23abhlv6wrvkja9myacjgqxq5bal947934gqp26pyndp6r6xk6gisshjkiabjqzybdparca9zp6dnsvxkc9kh4j4816flpyyrdz1qk4";
        };
    };
  };
  
}
