#
# TODO
#
{ instance, fetchzip, fetchsite }:

let 
    meta = {
        homepage = https://github.com/JPMoresmau/eclipsefp ;
        description = "EclipseFP is a set of plugins for Eclipse that add support for the Haskell programming language";
    };
in 
rec {

  ide-haskell-264 = instance.repoDir {
    inherit meta;
    name = "ide-haskell-264";
    src = fetchsite {
      url = "http://eclipsefp.sourceforge.net/updates" ;
      sha256 = "1jldjbziwsvdgac2jyc4bnpqganj0hznzqdcgmqr0dyp2ls0kf4f";
      # regexInclude = "" ; # FIXME filter
    };
  };

}
