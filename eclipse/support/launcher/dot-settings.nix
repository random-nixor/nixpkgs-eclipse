#
# Provide dot settings maker
#
{ lib
, runCommand 
}:

with lib;
with builtins;

let

    escapePrefChar = text: replaceStrings ["\n" "="] ["\\n" "\\="] text;

    pluginPrefsDir = root: "${root}/.settings" ;
    pluginPrefsFile = root: pluginId: "${pluginPrefsDir root}/${pluginId}.prefs" ;

    jdtStdTypeId = "org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType";

    jdtVmReference = meta: "57,${jdtStdTypeId}13,${meta.id}";

    jdtVmEntry = meta: ''
    <vm id="${meta.id}" name="${meta.name}" path="${meta.path}" />
    '';

    jdtVmStdList = metaList: ''
    <vmType id="${jdtStdTypeId}">${concatStringsSep "" (map jdtVmEntry metaList)}</vmType>
    '';
    
    jdtVmSettings = metaList: ''
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <vmSettings defaultVM="${jdtVmReference (head metaList)}" defaultVMConnector="">
    ${jdtVmStdList metaList}
    </vmSettings>
    '';

    launchingPlugin = "org.eclipse.jdt.launching";
    
    launchingVmKey = "${launchingPlugin}.PREF_VM_XML" ;
    launchingVmValue = metaList: escapePrefChar (jdtVmSettings metaList);
    launchingVmSettings = metaList: "${launchingVmKey}=${launchingVmValue metaList}";
    
    launchingText = name: metaList: ''
    #
    # ${name}
    #
    eclipse.preferences.version=1
    ${launchingVmSettings metaList}
    '';
    
    makeJavaMeta = java: { id=java.name; name=java.name; path=java.home; };
    
    makeMetaList = javaList: map makeJavaMeta javaList;

    makeAnyPrefs = { root, pluginId, prefsText }:
    let 
        prefsDir = pluginPrefsDir root; 
        prefsFile = pluginPrefsFile root pluginId;
    in runCommand "eclipse-${pluginId}.prefs" {
    }
    ''
        mkdir -p $out/${prefsDir}
        echo "${prefsText}" > $out/${prefsFile}
    '';

    # FIXME: launching uses only "instance" prefs 
    makeLaunchingPrefs = { name, root, javaList }:
    let 
        metaList = makeMetaList javaList;
    in makeAnyPrefs {
        inherit root;
        pluginId = launchingPlugin;
        prefsText = launchingText name metaList;
    };
   
in
rec 
{

    # generate dot settings preference files
    makeDotSettings = { name, root, javaList }: [
        ( makeLaunchingPrefs { inherit name root javaList; } )
    ];

}
