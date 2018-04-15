#
# Mirror eclipse update site.
# https://wiki.eclipse.org/Equinox_p2_Repository_Mirroring
#

{ stdenvNoCC, eclipse }:

{ url
, name ? "source"
, meta ? {}
, passthru ? {}
, verbose ? false # FIXME make impure
  # drop https_proxy to avoid java trust store setup
, impureEnvVars ? [ "http_proxy" "ftp_proxy" "no_proxy" ]
, showBuildStats ? true
, preferLocalBuild ? true
, sha1 ? ""
, sha256 ? ""
, sha512 ? ""
, outputHash ? ""
, outputHashAlgo ? ""
# keep files via positive regex
, regexInclude ? ".+"
# drop files via negative regex
, regexExclude ? "artifacts[.](.+)|content[.](.+)|p2.index|site[.](.+)"
#
, execArgs ? [
    #
]
, javaArgs ? [
    # inherit proxy environment vars
    "-Djava.net.useSystemProxies=true"
]
}:

let

  runtime = eclipse.runtime.base-473a;

#  runtimeBase = "${runtime.out}/${runtime.base}";
#  executable = "${runtimeBase}/${optionRuntimeExe}";
  executable = "${runtime.out}/${runtime.link}" ;

  application = "org.eclipse.equinox.p2.artifact.repository.mirrorApplication";
  configuration = "$TMPDIR/eclipse/configuration";
  source = url;
  destination = "$TMPDIR/site";
  
  verboseOpts = if verbose 
  then [
    "-verbose"
    "-debug"
    "-consoleLog"
  ] else [] ;
  
  execArgsList = [
    "-nosplash"
    "-configuration" configuration
    "-application" application
    "-source" source
    "-destination" destination
    "-raw"
  ] ++ execArgs ++ verboseOpts;
  
  javaArgsList = [ "-vmargs" ] ++ javaArgs;
  
  arguments = [ executable ] ++ execArgsList ++ javaArgsList;
  
  command = builtins.concatStringsSep " " arguments ;
  
  hashConf =
    if (outputHash != "" && outputHashAlgo != "") then { inherit outputHashAlgo outputHash; }
    else if sha512 != "" then { outputHashAlgo = "sha512"; outputHash = sha512; }
    else if sha256 != "" then { outputHashAlgo = "sha256"; outputHash = sha256; }
    else if sha1   != "" then { outputHashAlgo = "sha1";   outputHash = sha1; }
    else abort "fetchsite requires a hash for fixed-output derivation: ${url}" ;
    
in

stdenvNoCC.mkDerivation {

  inherit url name meta passthru impureEnvVars showBuildStats preferLocalBuild;

  inherit (hashConf) outputHashAlgo outputHash;

  outputHashMode = "recursive";
  
  phases = [ "buildPhase" ];
  
  buildPhase = ''
  
    verbose=${toString verbose}
  
    echo "fetchsite sync url: '${url}'"
    mkdir -p $out ${configuration} ${destination}
    ${command}
    
    echo "fetchsite copy regexInclude: '${regexInclude}' regexExclude: '${regexExclude}'"
    cd ${destination}
    find . -type d | xargs -I % mkdir -p $out/%
    find . -type f | grep -E "${regexInclude}" | grep -v -E "${regexExclude}" | xargs -I % cp % $out/%
    
    [[ $verbose ]] && ls -Rasr $out || true
    
  '';

}
