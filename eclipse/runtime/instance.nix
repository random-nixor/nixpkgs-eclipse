#
# Produce runtime from external repository
#
{ stdenvNoCC
, eclipse
, buildEnv
}:

# instance function
{ name # unique runtime name 
, meta ? {} # runtime origin descriptor 
, packages ? {} # mapping: system -> download
}:

with eclipse.option;
with eclipse.launcher;

let

    this = {
        meta = meta;
        base = optionRuntimeFolder name;
        name = optionRuntimePackage name;
    };

    system = stdenvNoCC.system;

    package = if builtins.hasAttr system packages 
        then packages."${system}"
        else abort "Missing package for system: ${system}"
    ;
    
    packageName = baseNameOf package.url;
        
    runtimeInstall = makePackageInstall {
        package = package;
        name = packageName;
    };

    runtimeRooter = makeFolderRooter {
        inherit (this) name base;
        sors = runtimeInstall;
        path = "eclipse";
    };

    runtimeEclipseIni = makeEclipseIni {
        inherit (this) name base;
        sors = runtimeRooter;
    };

    runtimeWrapper = makeLauncherWrapper {
        inherit (this) name base;
        sors = runtimeRooter;
        eclipseIni = runtimeEclipseIni;
    };

    runtimeResult = buildEnv {
        inherit (this) name;
        paths = [
            runtimeRooter 
            runtimeEclipseIni 
            runtimeWrapper
        ];
        passthru = {
            install = runtimeInstall;
        };
    };
    
in
runtimeResult // this // {
    exec = runtimeWrapper.link;
}
