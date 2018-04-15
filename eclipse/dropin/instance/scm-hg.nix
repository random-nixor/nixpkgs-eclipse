
{ instance, fetchzip, fetchsite }:

let
    home-page = https://bitbucket.org/mercurialeclipse/main/wiki/Home ;
in 
rec {

  scm-hg-250 = instance.repoDir {
    name = "scm-hg-250";
    src = fetchsite {
      url = "https://bitbucket.org/mercurialeclipse/update-site/raw/default" ;
      sha256 = "1hb9gsa60an6qfrwgh3yg25xa4jvicf97sjndblwjfils6gnrini";
      regexInclude = "mercurialeclipse_2.5.0(.+)jar|com.vectrace.MercurialEclipse_2.5.0(.+)jar";
    };
  };

}
