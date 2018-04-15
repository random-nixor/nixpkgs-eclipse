
{ instance, fetchzip }:

let 
    home-page = http://www.eclipse.org/egit ;
    drop-site = http://download.eclipse.org/egit;
in 
rec {

  scm-git-4110 = instance.repoDir {
    name = "scm-git-4110";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/updates-4.11/org.eclipse.egit.repository-4.11.0.201803080745-r.zip" ;
      sha256 = "1n32mlcgvpd189wszq4dd0hgpdmrzphpmz2c2cp6hzn0zcpi7k6c";
    };
  };

}
