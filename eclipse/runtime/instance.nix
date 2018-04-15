#
# Produce runtime from external repository
#
{ stdenvNoCC
, eclipse
, fetchurl
, makeWrapper
}:

# instance function
{ name # unique runtime name 
, meta ? {} # runtime origin descriptor 
, packages ? {} # mapping: system -> download
}:

with builtins;
with eclipse.option;
with eclipse.wrapper;

let

    system = stdenvNoCC.system;

    package = if hasAttr system packages 
        then packages."${system}"
        else abort "Missing package for system: ${system}";
        
    runtimeName = optionRuntimePackage name;
        
    src = fetchurl {
        inherit (package) url sha1 sha256 sha512;
    };
    
in

stdenvNoCC.mkDerivation {

  inherit src meta;

  base = optionRuntimeFolder name; # FIXME name space

  name = runtimeName;
  
  link = "bin/${runtimeName}";
  
  buildInputs = [ makeWrapper ];

  phases = [ "unpackPhase" "buildPhase" ];

  buildPhase = ''
  
    baseDir="$out/$base"
    executable="$baseDir/${optionRuntimeExe}"
    libraryCairo=$baseDir/${optionRuntimeLibCairo}
    binaryLink="$out/$link"
  
    mkdir -p $baseDir
    tar xfz $src -C $baseDir
    
    interpreter=$(echo ${stdenvNoCC.glibc.out}/lib/ld-linux*.so.2)
    patchelf --set-interpreter $interpreter $executable
    
    [ -f $libraryCairo ] && patchelf --set-rpath ${wrapperCairoLibs} $libraryCairo

    ${wrapperCommand { name=runtimeName; exec="$executable"; link="$binaryLink"; }}
    
  '';

}
