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

  tool-oomph-190 = instance.repoDir {
    inherit meta;
    name = "tool-oomph-190";
    src = fetchsite {
      url = "http://download.eclipse.org/oomph/drops/release/1.9.0" ;
      sha256 = "086ss0xhd126xxwrs1i6siv16f2mdgjpq2x10lmhqswv84fchk1g";
    };
    deps = [
        # FIXME
    ];
  };

}
