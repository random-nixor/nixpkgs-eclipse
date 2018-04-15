#
# Scala development
#

{ instance, fetchzip }:

let
   home-page = http://scala-ide.org ;

in
rec {

  ide-scala-471 = instance.repoDir {
    name = "ide-scala-471";
    src = fetchzip {
      stripRoot = true;
      url = "http://download.scala-ide.org/sdk/lithium/e47/scala212/dev/update-site.zip" ;
      sha256 = "1gdi95m14vjiwz76z0jq3bm340lsfzfnb1gjnviisi9dp7xvk81i";
      extraPostFetch = ''
        chmod go-w $out
      '';
    };
  };

}
