#
# Produce product form runtime and dropins 
#
{ stdenvNoCC
, eclipse 
, buildEnv
, runCommand
, makeWrapper
}:

# instance function
{ name # unique product name
, runtime # base binary of a product
, dropins ? [] # product dependencies
, execArgs ? [] # eclipse command line options 
, javaArgs ? [] # java-vm command line options 
}:

with eclipse.option;
with eclipse.wrapper;
with stdenvNoCC.lib;

let

  productName = optionProductPackage name;

  dropinsList = flatten(dropins);
  dropinsDeps = concatMap (x: x.deps) dropinsList;
  dropinsDepsList = flatten(dropinsDeps);
  productDropins = unique (dropinsList ++ dropinsDepsList);
  productEnvPaths = filter (x: x ? isEclipseDropin) (productDropins);

  productEnv = buildEnv {
    name = "${productName}-dropins";
    paths = productEnvPaths;
  };

  dropinKey = optionDropinProperty;
  dropinValue = "${productEnv}/${optionDropinDir}";
  dropinEntry = "-D${dropinKey}=${dropinValue}";
  
  execArgsText = concatStringsSep "\n" ( execArgs );
  javaArgsText = concatStringsSep "\n" ( javaArgs ++ [dropinEntry] );

  runtimeBase = "${runtime.out}/${runtime.base}"; # FIXME move to option

in

stdenvNoCC.mkDerivation {

  inherit runtime dropins execArgs javaArgs;

  name = productName;

  buildInputs = [ makeWrapper ];

  phases = [ "buildPhase" ];

  buildPhase = ''
  
    executable="${runtimeBase}/${optionRuntimeExe}"
    binaryLink="$out/bin/${productName}"
    sourceIni="${runtimeBase}/${optionRuntimeIni}"
    targetIni="$out/etc/eclipse/${productName}.ini"

    mkdir -p $out/bin $out/etc/eclipse

    echo "${execArgsText}" > $targetIni 
    cat $sourceIni >> $targetIni
    echo "${javaArgsText}" >> $targetIni 

    ${wrapperCommand { name=productName; exec="$executable"; link="$binaryLink"; config="$targetIni"; }}

  '';
  
}
