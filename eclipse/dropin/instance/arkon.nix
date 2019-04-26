#
# Eclipse total repo 
# "eclipse"
# 41E12A08C6E0DEC98B8E09BBDB7FF0066A5070C15A849C23D4599567EC6A9D609EB5D7EDB42FE985C1DD4A86D0642702DFA90D5C36D4874A2DCB28C7ED197ADD

{ instance, fetchsite }:

let
    site1903 = http://download.eclipse.org/releases/2019-03/201903201000 ;
    meta = {
        homepage = https:// ;
        description = "Eclipse" ;
    };
in 
rec {

  arkon-1903 = instance.repoDir {
    inherit meta;
    name = "arkon-1903";
    src = fetchsite {
      url = "http://download.eclipse.org/releases/2019-03/201903201000" ;
      sha512 = "41E12A08C6E0DEC98B8E09BBDB7FF0066A5070C15A849C23D4599567EC6A9D609EB5D7EDB42FE985C1DD4A86D0642702DFA90D5C36D4874A2DCB28C7ED197ADD";
    };
  };

}
