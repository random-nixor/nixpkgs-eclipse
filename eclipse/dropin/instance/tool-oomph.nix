#
# Eclipse Oomph 
#
{ instance, fetchsite }:

let
    meta = {
        homepage = https://projects.eclipse.org/projects/tools.oomph ;
        description = "Eclipse Oomph provisioning tools" ;
    };
in 
rec {

  tool-oomph-180 = instance.repoDir {
    inherit meta;
    name = "tool-oomph-180";
    src = fetchsite {
      url = "http://download.eclipse.org/oomph/drops/release/1.8.0" ;
      sha256 = "177fnicj4nhwznkgi5900cpmrpyngzfq627fzlrbalxc6pw71w9j";
    };
    deps = [
        # FIXME
    ];
  };

}
