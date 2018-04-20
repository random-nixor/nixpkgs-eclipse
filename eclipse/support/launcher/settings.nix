#
# Provide dot settings maker
#
{ lib, runCommand }:

with lib;
with builtins;

let

    escapePrefChar = text: replaceStrings ["\n" "="] ["\\n" "\\="] text;

    pluginPrefsDir = root: "${root}/configuration/.settings" ;
    pluginPrefsFile = root: pluginId: "${pluginPrefsDir root}/${pluginId}.prefs" ;

    jdtStdTypeId = "org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType";

    jdtVmReference = java: "57,${jdtStdTypeId}13,${java.id}";

    jdtVmEntry = java: ''
    <vm id="${java.id}" name="${java.name}" path="${java.path}" />
    '';

    jdtVmStdList = javaList: ''
    <vmType id="${jdtStdTypeId}">${concatStringsSep "" (map jdtVmEntry javaList)}</vmType>
    '';
    
    jdtVmSettings = javaList: ''
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <vmSettings defaultVM="${jdtVmReference (head javaList)}" defaultVMConnector="">
    ${jdtVmStdList javaList}
    </vmSettings>
    '';

    launchingPlugin = "org.eclipse.jdt.launching";
    
    launchingVmKey = "${launchingPlugin}.PREF_VM_XML" ;
    launchingVmValue = javaList: escapePrefChar (jdtVmSettings javaList);
    launchingVmSettings = javaList: "${launchingVmKey}=${launchingVmValue javaList}";
    
    launchingText = javaList: ''
    eclipse.preferences.version=1
    ${launchingVmSettings javaList}
    '';
    
    makeJava = pack: { id=pack.name; name=pack.name; path=pack.out; };
    
    makeJavaList = packList: map makeJava packList;

    # FIXME: launching uses only "instance" prefs 
    makeLaunchingPrefs = root: packList: 
    let 
        prefsDir = pluginPrefsDir root; 
        prefsFile = pluginPrefsFile root launchingPlugin;
        javaList = makeJavaList packList;
        prefsText = launchingText javaList;
    in runCommand "makeLaunchingPrefs" {
    }
    ''
        mkdir -p $out/${prefsDir}
        echo "${prefsText}" > $out/${prefsFile}
    '';
   
in
rec 
{

    result = root: packList: [
        (makeLaunchingPrefs root packList)
    ];

}
