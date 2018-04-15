#
# TODO
#

{ instance, fetchzip, fetchsite }:

let 
    home-page = https://github.com/JPMoresmau/eclipsefp ;
in 
rec {

  ide-haskell-264 = instance.repoDir {
    name = "ide-haskell-264";
    src = fetchsite {
      url = "http://eclipsefp.sourceforge.net/updates" ;
      sha256 = "1jldjbziwsvdgac2jyc4bnpqganj0hznzqdcgmqr0dyp2ls0kf4f";
      # regexInclude = "" ; # FIXME filter
    };
  };

}
