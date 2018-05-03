#
# Produce runtime from external repository
#
{ stdenvNoCC
, eclipse
, buildEnv
}:

with eclipse.option;
with eclipse.launcher;

# instance function
{ name # unique runtime name 
, java ? oraclejdk8auto # eclipse host jdk
, meta ? {} # runtime origin descriptor 
, layout ? {}  # distro root dir layout
, packages ? {} # mapping: system -> download
}:

let

    this = {
        inherit meta java;
        layout = optionLauncherLayout // layout;
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
        layout = this.layout;
    };

    runtimeRooter = makeFolderRooter {
        inherit (this) name base;
        sors = runtimeInstall;
        path = this.layout.root;
    };

    runtimeEclipseIni = makeEclipseIni {
        inherit (this) name base java layout;
        sors = runtimeRooter;
    };

    runtimeWrapper = makeLauncherWrapper {
        inherit (this) name base java layout;
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
    
in runtimeResult // this // {
    exec = runtimeWrapper.link;
}
