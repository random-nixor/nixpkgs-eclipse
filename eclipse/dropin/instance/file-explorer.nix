#
# File manager integrations
#

{ instance, fetchsite }:

let 
in 
rec {

  file-explorer-basti-161 = instance.repoDir {
    name = "file-explorer-basti-161";
    src = fetchsite {
      url = "http://basti1302.github.com/startexplorer/update" ;
      sha256 = "1m9l382m801vfyxczy2gyzn0rm5hd0rw6sgfxb4jjkf7crw98jkx";
      regexInclude = "de.bastiankrol.(.+)_1.6.1(.+)jar";
    };
    meta = {
       homepage = http://basti1302.github.io/startexplorer ;
       descriptions = "This plug-in offers tight integration of system file manager" ;
    };
  };

}
