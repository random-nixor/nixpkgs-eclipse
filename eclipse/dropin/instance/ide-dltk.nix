#
# Editor suite for: Ruby Tcl Python JavaScript Shell
#

{ instance, fetchzip, dropin }:

with dropin;

let 
    home-page = https://projects.eclipse.org/projects/technology.dltk ;
    drop-site = http://download.eclipse.org/technology/dltk/downloads/drops ;
    drop-581 = "${drop-site}/R5.8/R-5.8.1-201708260401" ;
    drop-582 = "${drop-site}/R5.8/R-5.8.2.201709190955" ;
in
rec {

    ide-dltk-deps = [ 
      tools-linux-621 # FIXME reduce 
    ];
    
    ### 581

    # all
    ide-dltk-581 = instance.repoDir {
        name = "ide-dltk-581";
        src = fetchzip {
            stripRoot = false;
            url = "${drop-581}/dltk-R-5.8.1-201708260401.zip" ;
            sha256 = "1n8dpjw8v6yrgawsbmq1i233m7698nhj996375jd8f8aw4ay17fq";
        };
        deps = ide-dltk-deps;
    };

    ide-dltk-sdk-581 = instance.repoDir {
        name = "ide-dltk-sdk-581";
        src = fetchzip {
            stripRoot = false;
            url = "${drop-581}/dltk-sdk-R-5.8.1-201708260401.zip" ;
            sha256 = "08b1wqsvc6j2wk9vz5mfm0ycwpr5glbisp69qr5gmq3hnnl5bn1v";
        };
    };

    # w/o any editor
    ide-dltk-core-581 = instance.repoDir {
        name = "ide-dltk-core-581";
        src = fetchzip {
            stripRoot = false;
            url = "${drop-581}/dltk-core-R-5.8.1-201708260401.zip" ;
            sha256 = "1s83nfy64l6pvjizcs5jrppcb022wk98i51m31y82xkmjjcpmbpp";
        };
    };

    # only shell editor
    ide-dltk-sh-581 = instance.repoDir {
        name = "ide-dltk-sh-581";
        src = fetchzip {
            stripRoot = false;
            url = "${drop-581}/dltk-sh-R-5.8.1-201708260401.zip" ;
            sha256 = "15dd0pkf1sl6p1pyd27qhfbvp01ckas5rf1arr30q4csj16sd51q";
        };
        deps = ide-dltk-deps;
    };
    
    ### 582
    
#    ide-dltk-582 = instance.repoDir {
#        name = "ide-dltk-582";
#        src = fetchzip {
#            stripRoot = false;
#            url = "${drop-582}/dltk-R-5.8.2-201709190955.zip" ;
#            sha256 = "0n8dpjw8v6yrgawsbmq1i233m7698nhj996375jd8f8aw4ay17fq";
#        };
#        deps = ide-dltk-deps;
#    };

}
