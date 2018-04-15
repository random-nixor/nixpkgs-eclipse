#
# Provide options to customize build.
#

{ pkgs, requireFetch }:

let
in rec
{

    # package with auto-fetch
    oraclejdk8auto = pkgs.oraclejdk8.override (attrs: {
        requireFile = requireFetch;
    });
    oraclejdk10auto = pkgs.oraclejdk10.override (attrs: {
        requireFile = requireFetch;
    });

    optionJDK = oraclejdk10auto;
    
    optionUseTitle = true;
    optionUseSplash = true; 
    optionUseConfigPath = true;
    optionUseInstancePath = true;

    optionDropinProperty = "org.eclipse.equinox.p2.reconciler.dropins.directory";

    optionArkonName = "eclipse";
    optionDropinName = "${optionArkonName}-dropin";
    optionProductName = "${optionArkonName}-product";
    optionRuntimeName = "${optionArkonName}-runtime";

    optionDropinPackage = name: "${optionDropinName}-${name}";
    optionProductPackage = name: "${optionProductName}-${name}";
    optionRuntimePackage = name: "${optionRuntimeName}-${name}";
    
    optionRuntimeEtc = "eclipse/etc";
    optionRuntimeExe = "eclipse/eclipse";
    optionRuntimeIni = "eclipse/eclipse.ini";
    optionRuntimeLibCairo = "eclipse/libcairo-swt.so";

    optionArkonDir = "${optionArkonName}";
    optionDropinDir = "${optionArkonDir}/dropin";
    optionProductDir = "${optionArkonDir}/product";
    optionRuntimeDir = "${optionArkonDir}/runtime";
    
    optionDropinFolder = name: "${optionDropinDir}/${name}";
    optionProductFolder = name: "${optionProductDir}/${name}";
    optionRuntimeFolder = name: "${optionRuntimeDir}/${name}";
        
}
