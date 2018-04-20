#
# Provide options to customize build.
#

{ pkgs, requireFetch, oraclejdk8, oraclejdk10 }:

let
in rec
{

    # package with auto-fetch
    oraclejdk8auto = oraclejdk8.override (attrs: {
        requireFile = requireFetch;
    });
    oraclejdk10auto = oraclejdk10.override (attrs: {
        requireFile = requireFetch;
    });

    # jdk used to run eclipse
    optionEclipseJDK = oraclejdk8auto;
    
    # available jres/jdks inside eclipse
    optionJavaList = [
        oraclejdk8auto
        oraclejdk10auto
    ];
    
    optionSetFonts = true;
    
    optionUseName = true;
    optionUseSplash = true; 
    optionUseConfigPath = true;
    optionUseInstallPath = true;
    optionUseInstancePath = true;
    optionUseProvisionPath = false; # FIXME breaks fetchsite

    optionDropinsProperty = "org.eclipse.equinox.p2.reconciler.dropins.directory";

    optionArkonName = "eclipse";
    optionDropinName = "${optionArkonName}-dropin";
    optionProductName = "${optionArkonName}-product";
    optionRuntimeName = "${optionArkonName}-runtime";

    optionDropinPackage = name: "${optionDropinName}-${name}";
    optionProductPackage = name: "${optionProductName}-${name}";
    optionRuntimePackage = name: "${optionRuntimeName}-${name}";
    
    optionLauncherCfg = "eclipse/configuraion";
    optionLauncherExe = "eclipse/eclipse";
    optionLauncherIni = "eclipse/eclipse.ini";
    optionRuntimeLibCairo = "eclipse/libcairo-swt.so";

    optionArkonDir = "${optionArkonName}";
    optionDropinsDir = "${optionArkonDir}/dropins";
    optionProductDir = "${optionArkonDir}/product";
    optionRuntimeDir = "${optionArkonDir}/runtime";
    
    optionDropinFolder = name: "${optionDropinsDir}/${name}";
    optionProductFolder = name: "${optionProductDir}/${name}";
    optionRuntimeFolder = name: "${optionRuntimeDir}/${name}";
        
}
