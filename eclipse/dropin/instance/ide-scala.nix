#
# Scala development
#
{ instance, fetchzip }:

let
    meta = {
        homepage = http://scala-ide.org ;
        description = "Scala IDE for development Scala/Java applications";
    };
in
rec {

  ide-scala-471 = instance.repoDir {
    inherit meta;
    name = "ide-scala-471";
    src = fetchzip {
      stripRoot = true;
      url = "http://download.scala-ide.org/sdk/lithium/e47/scala212/dev/update-site.zip" ;
      sha256 = "1gdi95m14vjiwz76z0jq3bm340lsfzfnb1gjnviisi9dp7xvk81i";
      # https://github.com/NixOS/nixpkgs/issues/38649
      extraPostFetch = ''
        chmod go-w $out
      '';
    };
  };

}
