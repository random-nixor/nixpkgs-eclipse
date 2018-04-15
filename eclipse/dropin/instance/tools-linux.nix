#
# Linux C/C++ development support
#
{ instance, fetchsite }:

let
    meta = {
        homepage = https://www.eclipse.org/linuxtools ;
        description = "Linux Tools project aims to bring a full-featured C and C++ IDE to Linux developers" ;
    };
in
rec {

  tools-linux-621 = instance.repoDir {
    inherit meta;
    name = "tools-linux-621";
    src = fetchsite {
      url = "http://download.eclipse.org/linuxtools/update-6.2.1" ;
      sha256 = "1ixq7sf12xwhp4wg3hclhxjdybd07vlmnqgvskan8aznwz5pfbx8";
    };
  };

}
