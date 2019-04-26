#
# C/C++ development
#
{ instance, fetchzip, fetchsite }:

let 
    meta = {
        homepage = https://gnu-mcu-eclipse.github.io ;
        description = "A family of Eclipse CDT extensions and tools for GNU ARM & RISC-V development";
    };
in 
rec {

  ide-mcu-451 = instance.repoDir {
    inherit meta;
    name = "ide-mcu-451";
    src = fetchsite {
      url = "https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates" ;
      sha256 = "0kvqgd7nkw9g1dxyc0h4szvjbbw4v3hwgv8ajvcg7g41pri5hm4x";
    };
  };

}
