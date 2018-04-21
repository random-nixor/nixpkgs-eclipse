#
# Product "total" from scratch with all dropins.
#
{ instance, eclipse }:

with eclipse;
with dropin;

let
in
rec {

  total-473a = instance {
    name = "total-473a";
    super = product.base-473a;
    dropins = [
    
        base-equinox-473a

        build-gradle-221
    
        build-maven-total-190
        
        edit-json-boothen-110
        edit-md-certiv-100
        edit-proto-google-232
        edit-yaml-oyse-1020
        
        file-explorer-basti-161
        
        ide-antlr-jknack-035
        ide-birt-470
        ide-cdt-943
        ide-dltk-581
        ide-dltk-sdk-581
        ide-groovy-292
        ide-java-473a
        ide-java-src-473a
        ide-scala-471
        ide-statet-362
        ide-php-530
        ide-pde-473a
        ide-pde-src-473a
        ide-pydev-632
        ide-xtext-2130
        ide-wtp-393
        
        model-gef-502
        model-emfxsd-2130
        model-gmf-1120
        model-xpand-220
        model-graphiti-0140
        model-papyrus-330
        model-parsley-123
        
        perf-mat-170
        perf-mission-600
        
        scm-hg-250
        scm-git-4110
        scm-svn-405
        
        style-java-880
        style-scala-100
        
        tool-bnd-350
        tool-linux-621
        tool-moreunit-311
        
    ];
    execArgs = [
#        "-clean"
#        "-debug"
#        "-consoleLog"
    ];
    javaArgs = [
        "-Xms3g"
        "-Xmx3g"
#        "-XX:+UnlockCommercialFeatures" 
#        "-XX:+FlightRecorder"
#        "-Dosgi.checkConfiguration=true"
    ];
  };
  
}
