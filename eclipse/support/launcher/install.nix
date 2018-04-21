#
# Produce eclipse installation
#
{ stdenvNoCC
, fetchurl
, buildEnv
, eclipse
, launcher
}:

with launcher;
with eclipse.option;
with stdenvNoCC.lib;

let
in
rec {

    # provide companion jdks/jres at fixed public paths
    makeEclipseJava = { javaList ? optionJavaList, javaBase ? optionEclipseJava }:
    let
        rootFun = javaPack: makeJavaRooter { inherit javaPack javaBase; };
        rootList = map rootFun javaList;
        result = buildEnv {
            name = "eclipse-java";
            paths = rootList;
        };
    in 
    result // {
    };

    # relocate java package to new root
    makeJavaRooter = { javaPack, javaBase }:
    let
        name = javaPack.name;
        sors = javaPack.home;
        base = "${javaBase}/${name}";
        result = stdenvNoCC.mkDerivation {
            name = "rooter-${name}";
            phases = [ "buildPhase" ];
            buildPhase = ''
               root="$out/${base}"
               mkdir -p $(dirname "$root")
               ln -s "${sors}" "$root"
            '';
        };
    in 
    result // {
    };

    # relocate source path no new base in target
    makeFolderRooter = { sors, name, base, path }:
    let
        result = stdenvNoCC.mkDerivation {
            inherit base;
            name = "rooter-${name}";
            root = dirNameOf path;
            phases = [ "buildPhase" ];
            buildPhase = ''
               rootDir="$out/$base/$root"
               mkdir -p "$rootDir"
               ln -s "${sors}/${path}" "$rootDir"
            '';
        };    
    in
    result // {
        base = with result; "${out}/${base}";
        path = with result; "${out}/${base}/${path}";
    };
    
    # assemble eclipse configuration folder
    makeConfigFolder = { sors, name, base, path ? optionLauncherCfg, javaList ? optionJavaList }:
    let
        root = "${base}/${path}";
        settings = makeDotSettings { inherit name root javaList; };
        result = buildEnv {
            name = "config-${name}";
            paths = flatten [ sors settings ];
        };
    in
    result // {
        base = with result; "${out}/${base}";
        path = with result; "${out}/${base}/${path}";
    };

    # assemble eclipse dropins folder
    makeDropinsFolder = { dropins, name }:
    let
        dropinsList = flatten(dropins);
        dropinsDeps = concatMap (x: x.deps) dropinsList;
        dropinsDepsList = flatten(dropinsDeps);
        installDropins = unique (dropinsList ++ dropinsDepsList);
        installDropinsPaths = filter (x: x ? isEclipseDropin) (installDropins);
        result = buildEnv {
            name = "dropins-${name}";
            paths = installDropinsPaths;
            postBuild = ''
                mkdir -p $out/${optionDropinsDir}
            '';
        };
    in
    result // {
    };

    # download and adapt eclipse package
    makePackageInstall = { package, name }:
    let
    
        source = fetchurl {
            inherit (package) url sha1 sha256 sha512;
        };
    
        result = stdenvNoCC.mkDerivation {
            src = source;
            name = "install-${name}";
            phases = [ "unpackPhase" "buildPhase" ];
            buildPhase = ''
              
                baseDir="$out"
                executable="$baseDir/${optionLauncherExe}"
                libraryCairo=$baseDir/${optionLauncherLibCairo}
              
                mkdir -p $baseDir
                tar xfz $src -C $baseDir
            
                interpreter=$(echo ${stdenvNoCC.glibc.out}/lib/ld-linux*.so.2)
                
                if [[ -x $executable ]] ; then
                    patchelf --set-interpreter $interpreter $executable
                else
                    echo "Missing executable: $executable"
                    exit 1
                fi
            
                if [[ -f $libraryCairo ]]; then
                    patchelf --set-rpath ${wrapperCairoLibs} $libraryCairo
                else
                    echo "Missing libraryCairo: $libraryCairo"
                fi
                
            '';
        };
        
    in
    result // {
    };

}
