#
# M2T template language 
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/modeling/m2t/xpand/downloads/drops ;
    meta = {
        homepage = http://www.eclipse.org/modeling/m2t/?project=xpand ;
        description = "Model To Text (M2T) statically-typed template language" ;
    };
in 
rec {

  model-xpand-220 = instance.repoDir {
    inherit meta;
    name = "model-xpand-220";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/2.2.0/R201605260315/m2t-xpand-Update-2.2.0.zip" ;
      sha256 = "18sgygwvkvkl9sw2r2kh93z0rhq5a8hvz4l7bj5pf4b37d0m2s3z";
    };
  };

}
