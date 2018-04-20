#
# Produce runtime from external repository
#
{ stdenvNoCC
, pkgs
, eclipse
, buildEnv
, makeWrapper
}:

# instance function
{ name # unique runtime name 
, meta ? {} # runtime origin descriptor 
, packages ? {} # mapping: system -> download
}:

with builtins;

with eclipse.option;
with eclipse.launcher;

let

    system = stdenvNoCC.system;

    package = if hasAttr system packages 
        then packages."${system}"
        else abort "Missing package for system: ${system}"
    ;
    
    packageName = baseNameOf package.url;
        
    runtimeBase = optionRuntimeFolder name;
    runtimeName = optionRuntimePackage name;

    runtimeInstall = makePackageInstall {
        package = package;
        name = packageName;
    };

    runtimeRooter = makeFolderRooter {
        sors = runtimeInstall;
        name = runtimeName;
        base = runtimeBase;
        path = "eclipse";
    };

    runtimeEclipseIni = makeEclipseIni {
        sors = runtimeRooter;
        name = runtimeName;
        base = runtimeBase;
    };

	runtimeWrapper = makeLauncherWrapper {
	   sors = runtimeRooter;
       name = runtimeName;
       base = runtimeBase;
       eclipini = runtimeEclipseIni;
	};

    runtimeResult = buildEnv {
        name = "result-${runtimeName}";
        paths = [ runtimeRooter runtimeEclipseIni runtimeWrapper ];
        passthru = {
            install = runtimeInstall;
        };
    };
    
in

rec {

    inherit meta;
    
    base = runtimeBase;
    name = runtimeName;
    
    exec = runtimeWrapper.link;
    
    result = runtimeResult;
    
}
