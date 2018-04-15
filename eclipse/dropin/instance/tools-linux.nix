
{ instance, fetchsite }:

let
      home-page = https://www.eclipse.org/linuxtools ;
in
rec {

  tools-linux-621 = instance.repoDir {
    name = "tools-linux-621";
    src = fetchsite {
      url = "http://download.eclipse.org/linuxtools/update-6.2.1" ;
      sha256 = "1ixq7sf12xwhp4wg3hclhxjdybd07vlmnqgvskan8aznwz5pfbx8";
    };
  };

}
