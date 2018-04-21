#
# Produce product form runtime and dropins 
#
{ stdenvNoCC
, eclipse
, buildEnv
}:

with stdenvNoCC.lib;
with eclipse.option;
with eclipse.launcher;

# instance function
{ name # unique product name
, meta ? {} # product origin descriptor 
, runtime ? null # base binary of a product
, dropins ? [] # product dependencies
, execArgs ? [] # eclipse command line options 
, javaArgs ? [] # java-vm command line options 
, javaList ? [] # available public jdks/jres
, super ? { # product type inheritance
        runtime = abort "Missing 'super.runtime'";
		dropins = [];
		execArgs = []; 
		javaArgs = []; 
		javaList = optionJavaList;
    }
}:

let

    # inheritance marker    
    mark = [ "# ${name}" ];

    # inheritance composition
    this = {
	    base = optionProductFolder name;
	    name = optionProductPackage name;
        runtime = if runtime != null then runtime else super.runtime; 
	    dropins = super.dropins ++ dropins;
        javaList = super.javaList ++ javaList;
	    execArgs = super.execArgs ++ mark ++ execArgs;
	    javaArgs = super.javaArgs ++ mark ++ javaArgs;
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

    productInstall = this.runtime.result.install;
    
    productRooter = makeFolderRooter {
        inherit (this) name base;
        sors = productInstall;
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
  
    productWrapper = makeLauncherWrapper {
        inherit (this) name base;
        sors = productRooter;
        eclipseIni = productEclipseIni;
    };
    
    productEclipseJava = makeEclipseJava {
        javaList = this.javaList;
    };
    
    productResult = buildEnv {
        inherit (this) name;
        paths = [
            productRooter 
            dropinsRooter 
            productConfig
            productEclipseIni
            productWrapper 
        ];
    };
  
in
rec {

    inherit meta;
    
    inherit (this) name base runtime dropins execArgs javaArgs javaList;
    
    java = productEclipseJava;
    
    exec = productWrapper.link;
    
    result = productResult;

}
