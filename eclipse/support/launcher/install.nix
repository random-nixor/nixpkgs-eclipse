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
{

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
    
    # assemble eclipse dropins folder
    makeDropinsInstall = { dropins, name }:
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
                libraryCairo=$baseDir/${optionRuntimeLibCairo}
              
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
