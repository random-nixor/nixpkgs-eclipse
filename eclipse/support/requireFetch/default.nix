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

# requireFetch function
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

        "10jr4z0bw9wcws5xgc4qkw101cadfx5bkyvcnc4l3v5axwvjipdn" =
        "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz" ;
    
        "1975s6cn2lxb8jmxp236afvq6hhxqrx5jix8aqm46f5gwr2xd3mf" = 
        "http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz";
        
    };
    
    fileURL = fileMapper.${hash};
    
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
