self: super:

with self.eclipse;

let
    space = "/home/work/space/scala-work";

    lib = super.lib;

    # provide clang for scala-native
    scala-build =
    let
        pack = super.llvmPackages_6;
        packStdenv = pack.libcxxStdenv;
        toolList = [
            pack.llvm
            pack.libcxxClang
        ];
        libraryList = with super; [
            re2
            zlib
            boehmgc
            libunwind
        ];
        comboList = toolList ++ libraryList;
        comboDevList = builtins.map (lib.getOutput "dev") comboList;
        toolBinPath = lib.makeBinPath toolList;
        toolDeclare = packStdenv.mkDerivation {
            name = "builder-declare";
            NIX_ENFORCE_PURITY = false;
            NIX_ENFORCE_NO_NATIVE = false;
            phases = [ "buildPhase" ];
            buildInputs = comboList;
            buildPhase = "declare -p | grep 'NIX' | grep -E -v '(buildPhase)' > $out";
        };
    in super.buildEnv {
            name = "scala-build";
            paths = comboList ++ comboDevList;
    } // {
       inherit toolDeclare toolBinPath;
    };

in {

    inherit scala-build;

    eclipse-scala = product.instance {
       name = "scala-work"; 
       super = product.scala-main-473a;
       execArgs = [
            "-configuration" "${space}/conf"
            "-data"          "${space}/data"
       ];
       javaArgs = [
            "-Xms4G" 
            "-Xmx4G" 
            "-Xverify:none" 
            "-XX:-OmitStackTraceInFastThrow" 
            "-Djava.net.useSystemProxies=true" 
            "-Dfile.encoding=UTF-8"
       ];
#       enviroList = [ "NIX_DEBUG 1" ];
        scriptList = [
            "source '${scala-build.toolDeclare}'"
        ];
        prefixList = [
            "PATH : '${scala-build.toolBinPath}'"
        ];
    };

}
