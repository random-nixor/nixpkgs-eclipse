#
# EGit team provider
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/egit;
    mirror-site = http://ftp.acc.umu.se/mirror/eclipse.org/egit;
    meta = {
        homepage = http://www.eclipse.org/egit ;
        description = "EGit is an Eclipse Team provider for the Git version control system." ;
    };
in 
rec {

  scm-git-4110 = instance.repoDir {
    inherit meta;
    name = "scm-git-4110";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/updates-4.11/org.eclipse.egit.repository-4.11.0.201803080745-r.zip" ;
      sha256 = "1n32mlcgvpd189wszq4dd0hgpdmrzphpmz2c2cp6hzn0zcpi7k6c";
    };
  };

  scm-git-53 = instance.repoDir {
    inherit meta;
    name = "scm-git-53";
    src = fetchzip {
      stripRoot = false;
      url = "${mirror-site}/updates-5.3/org.eclipse.egit.repository-5.3.0.201903130848-r.zip" ;
      sha256 = "1miapsl1anbf99ycx3gn6bsx2inkvyd01ylp2y3lbgvbx7firzll";
    };
  };

}
