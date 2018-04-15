
{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/subversive ;
    drop-site = http://download.eclipse.org/technology/subversive;
in 
rec {

  scm-svn-405 = instance.repoDir {
    name = "scm-svn-405";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/4.0/builds/Subversive-4.0.5.I20170425-1700.zip" ;
      sha256 = "0778ch6ridzsic6pgdd7mn96v56h5xdcv7qincdl43w63v7b082w";
    };
  };

}
