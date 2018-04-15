
{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/papyrus ;
    drop-site = http://download.eclipse.org/modeling/mdt/papyrus/downloads/drops ;
in 
rec {

  model-papyrus-330 = instance.repoDir {
    name = "model-papyrus-330";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/3.3.0/R201803070505/Papyrus-Update-3.3.0.zip" ;
      sha256 = "0dqj7mrn6ahyha8gx2yhwxha85dwy0yzylbp9bjfdx85vnxwx18s";
    };
  };

}
