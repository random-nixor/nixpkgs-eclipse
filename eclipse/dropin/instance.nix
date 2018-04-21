#
# Produce dropin from external repository
#

# instance function
{ stdenvNoCC
, eclipse
, unzip
, verbose ? false # FIXME make impure
}:

with eclipse.option;

let
    copyOpts = if verbose then "-v" else "";
    unzipOpts = if verbose then "" else "-q";

in
rec {

    # base repo type
    repoAny = { name, deps ? [], buildInputs ? [], passthru ? {}, ... } @ attrs:
    
        stdenvNoCC.mkDerivation (attrs // {
        
          inherit deps;
        
          name = optionDropinPackage name;
          
          buildInputs = buildInputs ++ [ unzip ];
          
          passthru = {
            isEclipseDropin = true;
          } // passthru;
          
        });
    
    # produce dropin from exploded update site directory
    repoDir = { name, src, ... } @ attrs: repoAny (attrs // {

      phases = [ "unpackPhase" "installPhase" ];
    
      installPhase = ''
      
        dropinOut="$out/${optionDropinFolder name}"
        featuresOut=$dropinOut/features
        pluginsOut=$dropinOut/plugins
        mkdir -p $featuresOut $pluginsOut 
        
        base=$(pwd)

        bundleRegex="Eclipse-BundleShape:\\s*dir"
        
        cd $base/features
        for feature in *.jar; do
            featureName=''${feature%.jar}
            featureUnzip=$featuresOut/$featureName
            mkdir -p $featureUnzip
            unzip ${unzipOpts} $feature -d $featureUnzip
        done
        for feature in */; do
            cp ${copyOpts} -r $feature $featuresOut
        done
        
        cd $base/plugins
        for plugin in *.jar ; do
          manifest=$(unzip -q -p $plugin META-INF/MANIFEST.MF)
          if [[ $manifest =~ $bundleRegex ]] ; then
            pluginName=''${plugin%.jar}
            pluginUnzip=$pluginsOut/$pluginName
            mkdir $pluginUnzip
            unzip ${unzipOpts} $plugin -d $pluginUnzip
          else
            cp ${copyOpts} $plugin $pluginsOut
          fi
        done
        for plugin in */; do
            cp ${copyOpts} -r $plugin $pluginsOut
        done
        
      '';
    });

    # produce dropin from explicitly provided jars
    repoJars = { name, features ? [], plugins ? [], ... } @ attrs: repoAny (attrs // {
        
      phases = [ "installPhase" ];

      installPhase = ''
      
        dropinOut="$out/${optionDropinFolder name}"
        featuresOut=$dropinOut/features
        pluginsOut=$dropinOut/plugins
        mkdir -p $featuresOut $pluginsOut 

        for feature in ${toString features}; do
           featureUnzip=$featuresOut/$(stripHash $feature)
           mkdir -p $featureUnzip
           unzip ${unzipOpts} $feature -d $featureUnzip
        done

        for plugin in ${toString plugins}; do
            pluginCopy=$pluginsOut/$(stripHash $plugin)
            cp ${copyOpts} $plugin $pluginCopy
        done
        
      '';
      
    });

}
