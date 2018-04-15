#
# PHP development
#

{ instance, fetchzip }:

let 
    home-page = https://www.eclipse.org/pdt ;
    drop-site = http://download.eclipse.org/tools/pdt/downloads;
    
in 
rec {

  ide-php-530 = instance.repoDir {
    name = "ide-php-530";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/pdt-Update-5.3.0.201803070838.zip" ;
      sha256 = "1fxvlkk6jnkjfr3vacrgp6wc3rdywyzll6bk84gf6g73c30kw3mw";
    };
  };

}
