#
# Provide maven config maker
#
{ stdenvNoCC
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

    makeToolchainsXml = {  javaList, base, path, file ? "toolchains.xml" }:
    let 
        inherit base path file;
        metaList = makeMetaList javaList;
        metaText = (mavenToolchainList metaList);
        result = runCommand "maven-toolchains.xml" {} ''
            baseDir="$out/${base}/${path}"
            toolFile=$baseDir/${file}
            mkdir -p $baseDir 
            echo "${metaText}" > $toolFile 
        '';
    in result // {
        base = with result; "${out}/${base}";
        path = with result; "${out}/${base}${path}";
        file = with result;  "${out}/${base}/${path}/${file}"; 
    };

in {

    # generate maven configuraton files
    makeMavenConfig = {  javaList, base, path ? optionEclipseMaven } :
    let
        toolchains = makeToolchainsXml  { inherit javaList base path; };
    in { 
        inherit toolchains;
        options = "--toolchains ${toolchains.file}";
        pathList = [
            toolchains
        ];
    };
    
}
