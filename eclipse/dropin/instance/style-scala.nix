#
# Scalastyle - Scala style checker
#
{ instance, fetchsite }:

let
    meta = {
        homepage = http://www.scalastyle.org ;
        description = "Scalastyle examines your Scala code and indicates potential problems with it" ;
    };
in
rec {

  style-scala-100 = instance.repoDir {
    inherit meta;
    name = "style-scala-100";
    src = fetchsite {
      url = "http://www.scalastyle.org/downloads/luna-1.0.0/site" ;
      sha256 = "0msnnjhg9mkv6c79y0ckxfhbcrq46dsz60g6byra41wwz53n87l2";
      regexInclude = "org.scalastyle.(.+)_1.0.0.jar";
    };
  };

}
