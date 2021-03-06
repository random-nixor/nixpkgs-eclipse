#
# Provide options to customize build.
#
{ pkgs
, requireFetch
, oraclejdk8
, oraclejdk10
}:

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

    # jdk used to run eclipse itself
    optionEclipseJDK = oraclejdk10auto;
    
    # jres/jdks available for eclipse
    optionJavaList = [
        oraclejdk8auto
        oraclejdk10auto
    ];

    # public eclipse desktop items
    optionEclipseDesk = "eclipse/desk";
    
    # public path for companion jres/jdks 
    optionEclipseJava = "java";
    # public path for companion maven 
    optionEclipseMaven = "maven";
    
    optionSetIni = true;
    optionSetFonts = true;
    optionSetMaven = true;
    
    optionUseName = true;
    optionUseSplash = true; 
    optionUseConfigPath = true;
#    optionUseInstallPath = true;
    optionUseInstancePath = true;
    
    optionUseConfigCascade = true;
#    optionUseSharedConfig = true;
#    optionUseProvisionPath = false; # FIXME breaks fetchsite

    # http://www-01.ibm.com/support/docview.wss?uid=swg21328849
    optionDropinsProperty = "org.eclipse.equinox.p2.reconciler.dropins.directory";

    # https://help.eclipse.org/oxygen/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Freference%2Fmisc%2Fruntime-options.html
    optionConfigProperty = "osgi.sharedConfiguration.area";

    optionLauncherLayout = {
	    root = "eclipse"; # root folder inside runtime distribution
	    conf = "configuration"; # configuration folder inside root
	    init = "eclipse.ini"; # startup settings inside root
	    exec = "eclipse"; # executable inside root
	    libCairo = "libcairo-swt.so"; # library inside root
        dropins = "dropins"; 
        features = "features"; 
        plugins = "plugins"; 
    };

    optionArkonName = "eclipse";
    optionDropinName = "${optionArkonName}-dropin";
    optionProductName = "${optionArkonName}-product";
    optionRuntimeName = "${optionArkonName}-runtime";

    optionDropinPackage = name: "${optionDropinName}-${name}";
    optionProductPackage = name: "${optionProductName}-${name}";
    optionRuntimePackage = name: "${optionRuntimeName}-${name}";
    
    optionArkonDir = "${optionArkonName}";
    optionDropinsDir = "${optionArkonDir}/dropins";
    optionProductDir = "${optionArkonDir}/product";
    optionRuntimeDir = "${optionArkonDir}/runtime";
    
    optionDropinFolder = name: "${optionDropinsDir}/${name}";
    optionProductFolder = name: "${optionProductDir}/${name}";
    optionRuntimeFolder = name: "${optionRuntimeDir}/${name}";
        
}
