#
# Produce product form runtime and dropins 
#
{ stdenvNoCC
, lib
, eclipse
, buildEnv
}:

with eclipse.option;
with eclipse.launcher;

# instance function
{ name # unique product name
, meta ? {} # product origin descriptor 
, icon ? null # desktop icon template
, runtime ? null # base binary of a product
, dropins ? [] # product dependencies
, execArgs ? [] # eclipse command line options 
, javaArgs ? [] # java-vm command line options 
, javaList ? [] # available public jdks/jres
, scriptList ? [] # pass to wrapper
, enviroList ? [] # pass to wrapper
, prefixList ? [] # pass to wrapper
, optionList ? [] # pass to wrapper
, super ? { # product type inheritance
        icon = abort "Missing 'super.icon'";
        runtime = abort "Missing 'super.runtime'";
        dropins = [];
        execArgs = []; 
        javaArgs = []; 
        javaList = optionJavaList;
        scriptList = [];
        enviroList = [];
        prefixList = [];
        optionList = [];
    }
}:

let

    # inheritance origin    
    mark = [ "# ${name}" ];

    # inheritance composition
    this = {
        meta = meta;
        base = optionProductFolder name;
        name = optionProductPackage name;
        icon = if icon != null then icon else super.icon;
        runtime = if runtime != null then runtime else super.runtime; 
        dropins = super.dropins ++ dropins;
        javaList = super.javaList ++ javaList;
        execArgs = super.execArgs ++ mark ++ execArgs;
        javaArgs = super.javaArgs ++ mark ++ javaArgs;
        scriptList = super.scriptList ++ scriptList;
        enviroList = super.enviroList ++ enviroList;
        prefixList = super.prefixList ++ prefixList;
        optionList = super.optionList ++ optionList;
    };

    dropinsInstall = makeDropinsFolder {
        inherit (this) name;
        dropins = this.dropins;
    };
    
    dropinsRooter = makeFolderRooter {
        inherit (this) name base;
        sors = dropinsInstall;
        path = optionDropinsDir;
    };

    productRooter = makeFolderRooter {
        inherit (this) name base;
        sors = this.runtime.install;
        path = "eclipse"; # XXX
    };

    productConfig = makeConfigFolder {
        inherit (this) name base;
        sors = productRooter;
        javaList = this.javaList;
    };

    configEntry = "-D${optionConfigProperty}=${productConfig.path}";
    dropinsEntry = "-D${optionDropinsProperty}=${dropinsRooter.path}";

    productEclipseIni = makeEclipseIni {
        inherit (this) name base;
        sors = productRooter;
        execArgs = [ ] ++ this.execArgs;
        javaArgs = [ configEntry dropinsEntry ] ++ this.javaArgs;
    };
  
    productEclipseJava = makeEclipseJava {
        inherit (this) name base;
        javaList = this.javaList;
    };
    
     productMavenConfig = makeMavenConfig { 
        inherit (this) base;
        javaList = this.javaList;
     };
    
    productDeskItem = makeDeskItem {
        name = name;
        icon = this.icon; 
        fullName = this.name;
        exec = productWrapper.link;
    };

    productDeskLink = makeDeskLink {
        deskItem = productDeskItem;
    };

    productDeskFolder = deskFolder;

    productWrapper = makeLauncherWrapper {
        inherit (this) name base;
        inherit (this) scriptList enviroList prefixList optionList;
        sors = productRooter;
        eclipseIni = productEclipseIni;
        mavenConfig = productMavenConfig;
    };
    
    productResult = buildEnv {
        inherit (this) name;
        paths = lib.flatten [
            productRooter 
            dropinsRooter 
            productConfig
            productEclipseIni
            productEclipseJava
            productMavenConfig
            productWrapper
#            productDeskFolder
            productDeskItem
            productDeskLink
        ];
    };
  
in
productResult // this // {
#    desk = productDeskFolder;
#    java = productEclipseJava;
    exec = productWrapper.link;
}
