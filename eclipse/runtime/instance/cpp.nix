#
# C/C++ IDE
#
{ instance }:

let
    drop-site = http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release;
in
rec {

  cpp-473a = instance {
    name = "cpp-473a";
    meta = {
        description = "Eclipse IDE for C/C++ Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-cpp-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "28d6f54f973764884bb5f16ca9d5c51145c062cce61bfd9bd77c6a237ffccd430e8c1d3d19c3cb2b350c630bbf846ba2662a8b8a888da8f7953d8577fc4f6491";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-cpp-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "b00598a7c9620d585353bc148b6712e6eea35afdd4e7c6f4804901fa06b91f57972581c31e6f3b17801948a3cf6a73cc3882e29baed8b58f961ad58989a9f828";
        };
    };
  };

  cpp-411 = instance {
    name = "cpp-411";
    meta = {
        description = "Eclipse IDE for C/C++ Developers";
    };
    packages =  {
        x86_64-linux = {
            url = "${drop-site}/2019-03/R/eclipse-cpp-2019-03-R-linux-gtk-x86_64.tar.gz";
            sha512 = "13n419f9i5vfn978cb7lm0gdhs0xciljl1kjlskhkwjkz5j3hm360jraida9ww5rnraki6qmag5jxdqssh2xadjs4pyx24mvmqlg9rj";
        };
    };
  };

}
