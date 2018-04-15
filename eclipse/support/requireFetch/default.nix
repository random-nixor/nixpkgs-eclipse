#
# Override "requireFile" to automatically download oracle jdk.
# see nixpkgs/pkgs/build-support/trivial-builders.nix
# see nixpkgs/pkgs/development/compilers/oraclejdk/jdk10-linux.nix
#
{ stdenvNoCC
, curl
, oracleHeader ? "Cookie: oraclelicense=accept-securebackup-cookie"
, impureEnvVars ? stdenvNoCC.lib.fetchers.proxyImpureEnvVars 
}:

# requireFile function
{ name ? null
, sha256 ? null
, sha1 ? null
, url ? null
, ...
} :

let
    
    hash =
        if sha256 != null then sha256 else
        if sha1 != null then sha1 else
        abort "Missing expected hash parameter" 
    ;
    
    hashAlgo = 
        if sha256 != null then "sha256" else
        if sha1 != null then "sha1" else
        abort "Missing expected hash parameter" 
    ;
    
    fileMapper = { # known downloads: sha -> url
    
        "0338m0x5lka0xjsbcll70r1i308bjw3m42cm9dx9zmfk70kplj5c" = 
        "http://download.oracle.com/otn-pub/java/jdk/10+46/76eac37278c24557a3c4199677f19b62/jdk-10_linux-x64_bin.tar.gz";
        
        "07h2wah80qr78y0f821z12lbdmsv90xbckdn3glnj2riwfh5dg3d" =
        "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz" ;
        
    };
    
    fileURL = fileMapper."${hash}";
    
    fileName = if name == null then baseNameOf fileURL else name;

	fileFetch = stdenvNoCC.mkDerivation {
	   inherit impureEnvVars;
	   name = fileName;
	   outputHash = hash;
	   outputHashAlgo = hashAlgo;
	   preferLocalBuild = true;
	   buildInputs = [ curl ];
	   phases = [ "buildPhase" ];
	   buildPhase = ''
	       curl \
	           --location \
	           --insecure \
	           --header "${oracleHeader}" \
	           --url ${fileURL} \
	           --output $out \
	   '';
	};
	
	result = fileFetch.out;
	
in

result
