#
# PHP development
#
{ instance, fetchzip }:

let 
    drop-site = http://download.eclipse.org/tools/pdt/downloads;
    meta = {
        homepage = https://www.eclipse.org/pdt ;
        description = "PHP Development Tools (PDT)";
    };
in 
rec {

  ide-php-530 = instance.repoDir {
    inherit meta;
    name = "ide-php-530";
    src = fetchzip {
      stripRoot = false;
      url = "${drop-site}/pdt-Update-5.3.0.201803070838.zip" ;
      sha256 = "1fxvlkk6jnkjfr3vacrgp6wc3rdywyzll6bk84gf6g73c30kw3mw";
    };
  };

}
