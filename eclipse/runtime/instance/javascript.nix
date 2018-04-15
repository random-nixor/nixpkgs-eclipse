#
# JavaScript IDE
#

{ instance }:

let
    drop-site = http://download.eclipse.org/technology/epp/downloads/release ;
in
rec {

  javascript-473a = instance {
    name = "javascript-473a";
    meta = {
        description = "Eclipse IDE for JavaScript Developers";
    };
    packages =  {
        i686-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-javascript-oxygen-3a-linux-gtk.tar.gz";
            sha512 = "1247730f9b561916e9eba8070928bf2de84a969e7d32835cd57d3a9bf51bfe9d360e9f0d07fe264390e6cf40d8070b484c11c3ec3bd586ed0beb6ac67ac61071";
        };
        x86_64-linux = {
            url = "${drop-site}/oxygen/3a/eclipse-javascript-oxygen-3a-linux-gtk-x86_64.tar.gz";
            sha512 = "57ded613c42391bda64d809e4ba47c6cb6e1b47957f51a9b64a1576c00c977064d79f1d7f08cda2ebac9d195bf6302f3c8048f8afb46b8567c4d28dcc1eed204";
        };
    };
  };

}
