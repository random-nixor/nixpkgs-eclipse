#
# Produce product form runtime and dropins 
#
{ stdenvNoCC
, eclipse
, buildEnv
#, makeWrapper
}:

# instance function
{ name # unique product name
, runtime # base binary of a product
, dropins ? [] # product dependencies
, execArgs ? [] # eclipse command line options 
, javaArgs ? [] # java-vm command line options 
}:

with stdenvNoCC.lib;

with eclipse.option;
with eclipse.launcher;

let

    productBase = optionProductFolder name;
    productName = optionProductPackage name;
    
    dropinsInstall = makeDropinsInstall {
        dropins = dropins;
        name = productName;
    };
    
    dropinsRooter = makeFolderRooter {
        sors = dropinsInstall;
        name = productName;
        base = productBase;
        path = optionDropinsDir;
    };
    
    runtimeInstall = runtime.result.install;

    productRooter = makeFolderRooter {
        sors = runtimeInstall;
        name = productName;
        base = productBase;
        path = "eclipse";
    };

    dropinsEntry = "-D${optionDropinsProperty}=${dropinsRooter.path}";
  
    productEclipseIni = makeEclipseIni {
       sors = productRooter;
       name = productName;
       base = productBase;
       execArgs = execArgs;
       javaArgs = javaArgs ++ [ dropinsEntry ];
    };
  
    productWrapper = makeLauncherWrapper {
       sors = productRooter;
       name = productName;
       base = productBase;
       eclipini = productEclipseIni;
    };
    
    productResult = buildEnv {
       name = productName;
       paths = [ productRooter dropinsRooter productEclipseIni productWrapper];
    };
  
in
rec {

    inherit meta;
    inherit runtime dropins execArgs javaArgs;
    
    base = productBase;
    name = productName;
    
    exec = productWrapper.link;
    
    result = productResult;

}
