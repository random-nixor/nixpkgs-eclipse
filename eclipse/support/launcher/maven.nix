#
# Provide maven config maker
#
{ stdenvNoCC
, pkgs
, lib
, eclipse
, runCommand 
, launcher
}:

with lib;
with builtins;
with eclipse.option;

let

    # map java version to 
    # - osgi executon environment
    # - maven compiler version
    javaContext = {
        "8"  = { env="JavaSE-1.8"; ver="1.8"; };
        "9"  = { env="JavaSE-9";   ver="1.9"; };
        "10" = { env="JavaSE-10";  ver="10";  };
    };

    mavenToolchain = meta:  ''
    <toolchain>
        <type>jdk</type>
        <provides>
            <id>${meta.id}</id>
            <name>${meta.name}</name>
            <vendor>${meta.vendor}</vendor>
            <version>${meta.version}</version>
        </provides>
        <configuration>
            <jdkHome>${meta.home}</jdkHome>
        </configuration>
    </toolchain>
    '';

    mavenToolchainList = metaList: ''
    <?xml version='1.0' encoding='UTF-8' standalone='no'?>
    <toolchains>
    ${concatStringsSep "" (map mavenToolchain metaList)}
    </toolchains>
    '';

    makeJavaMeta = java:
    let
        vendor = launcher.javaVendor java.name;
        version = launcher.javaVersion java.name;
        context = javaContext.${version};
    in { 
        name = java.name; 
        home = java.home; 
        vendor = vendor; 
        id      = context.env; 
        version = context.ver; 
    };
    
    makeMetaList = javaList: map makeJavaMeta javaList;

    makeToolchains = {  javaList, base, path, file ? "toolchains.xml" }:
    let 
        inherit base path file;
        metaList = makeMetaList javaList;
        metaText = (mavenToolchainList metaList);
        toolchains = runCommand "maven-toolchains" {} ''
            baseDir="$out/${base}/${path}"
            toolFile=$baseDir/${file}
            mkdir -p $baseDir 
            echo "${metaText}" > $toolFile 
        '';
    in toolchains // {
        base = with toolchains; "${out}/${base}";
        path = with toolchains; "${out}/${base}${path}";
        file = with toolchains; "${out}/${base}/${path}/${file}"; 
    };
    
    homeDir = builtins.getEnv "HOME";
    
    mavenUserHome = "${homeDir}/.m2";
    
    makeMavenLinks = { base, path }:
    let
        mavenLinks = runCommand "maven-links" {} ''
            baseDir="$out/${base}/${path}"
            mkdir -p $baseDir 
#            ln -s ${mavenUserHome}/repository $baseDir/repository
#            ln -s ${mavenUserHome}/settings.xml $baseDir/settings.xml
        '';
    in mavenLinks;

in {

    # generate maven configuraton folder
    makeMavenConfig = {  javaList, base, path ? optionEclipseMaven } :
    let
        mavenLinks = makeMavenLinks { inherit base path; };
        toolchains = makeToolchains { inherit javaList base path; };
        mavenConfig = pkgs.buildEnv {
            name = "maven-config";
            paths = [ mavenLinks toolchains ];
            postBuild = ''
            '';
        };
    in mavenConfig // {
        folder = with mavenConfig; "${out}/${base}/${path}";
        options = "--toolchains ${toolchains.file}";
    };
    
}
