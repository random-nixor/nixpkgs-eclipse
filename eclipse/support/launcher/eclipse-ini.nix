#
# Produce eclipse.ini maker
# https://help.eclipse.org/oxygen/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Freference%2Fmisc%2Fruntime-options.html
#
{ stdenvNoCC
, eclipse
, launcher
}:

with launcher;
with eclipse.option;
with stdenvNoCC.lib; 

let 

    # exec
    iniName = name: [ "-name" name ];
    iniSplashPath = name: [ "-showsplash" (makeSplash name) ];
    iniConfigPath = name: [ "-configuration" "@user.home/.eclipse/${name}/configuration" ];
    iniInstancePath = name: [ "-data" "@user.home/.eclipse/${name}/instance" ];
    iniInstallPath = path: [ "-install" path ];
    
    # java
    iniProvisionPath = name: [ "-Declipse.p2.data.area=@user.home/.eclipse/${name}/provision" ];
    iniConfigCascade = [ "-Dosgi.configuration.cascaded=true" ];
    iniSharedConfigPath = path: [ "-Dosgi.sharedConfiguration.area=${path}" ];

in
rec {

    # produce eclipse.ini by merging base prototype with new arguments 
    makeEclipseIni = { sors, name, base, path ? optionLauncherIni, execArgs ? [], javaArgs ? [] }:
    let
    
        execGens = []
            ++ (if optionUseName then (iniName name) else [])
            ++ (if optionUseSplash then (iniSplashPath name) else [])
            ++ (if optionUseConfigPath then (iniConfigPath name) else [])
            ++ (if optionUseInstancePath then (iniInstancePath name) else [])
        ;
        javaGens = []
            ++ (if optionUseConfigCascade then (iniConfigCascade) else [])
#            ++ (if optionUseSharedConfig then (iniSharedConfigPath base) else [])
#            ++ (if optionUseProvisionPath then (iniProvisionPath name) else [])
        ;
    
        vmargs = "-vmargs\n";

        sourceIni="${sors.base}/${path}";
        sourceText = readFile sourceIni;
        sourceList = splitString vmargs sourceText;
        sourceExec = head sourceList;
        sourceJava = tail sourceList;

        targetExec = concatStringsSep "\n" ( execGens ++ execArgs );
        targetJava = concatStringsSep "\n" ( javaGens ++ javaArgs );
        targetList = flatten [
            "#"
            "# ${name}"
            "#"
            "\n"
            "#"
            "# original exec"
            "#"
            sourceExec
            "#"
            "# override exec"
            "#"
            targetExec
            "\n"
            vmargs 
            "#"
            "# original java"
            "#"
            sourceJava
            "#"
            "# override java"
            "#"
            targetJava
        ];
        targetText = concatStringsSep "\n" targetList;
        
        eclipseIni = stdenvNoCC.mkDerivation {
            inherit base path;
            name = "eclipse-ini-${name}";
            phases = [ "buildPhase" ];
            meta = {
                priority = 0;
            };
            buildPhase = ''
                targetDir="$out/$base"
                targetIni="$targetDir/$path"
                targetRoot=$(dirname $targetIni)
                mkdir -p "$targetRoot"
                echo "${targetText}" > "$targetIni"
            '';
        };
    in 
    eclipseIni // {
        base = with eclipseIni; "${out}/${base}";
        path = with eclipseIni; "${out}/${base}/${path}"; 
    };
         
}
