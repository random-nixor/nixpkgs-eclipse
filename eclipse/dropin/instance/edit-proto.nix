#
# Editors for google protobuf
#
{ instance, fetchsite, dropin }:

with dropin;

let 
in 
rec {

#   <requires>
#      <import plugin="org.antlr.runtime"/>
#      <import plugin="org.apache.commons.logging"/>
#      <import plugin="org.apache.log4j"/>
#      <import plugin="org.eclipse.core.resources"/>
#      <import plugin="org.eclipse.core.runtime" version="3.7.0" match="greaterOrEqual"/>
#      <import plugin="org.eclipse.compare.core" version="3.5.200" match="greaterOrEqual"/>
#      <import plugin="org.eclipse.core.filesystem" version="1.3.100" match="greaterOrEqual"/>
#      <import plugin="org.eclipse.ui"/>
#      <import plugin="org.eclipse.ui.console" version="3.5.100" match="greaterOrEqual"/>
#      <import plugin="org.eclipse.ui.editors" version="3.7.0" match="greaterOrEqual"/>
#      <import plugin="org.eclipse.ui.ide" version="3.7.0" match="greaterOrEqual"/>
#      <import feature="org.eclipse.xtext.runtime" version="2.9.0" match="compatible"/>
#   </requires>

#    com.google.inject_3.0.0.v201312141243.jar
#    org.apache.commons.cli_1.2.0.v201404270220.jar
#    org.eclipse.emf.mwe.core_1.3.21.201705291011.jar
#    org.eclipse.emf.mwe.utils_1.3.21.201705291011.jar
#    org.eclipse.emf.mwe2.lib_2.9.1.201705291011.jar
#    org.eclipse.emf.mwe2.runtime_2.9.1.201705291011.jar
#    org.eclipse.xpand_2.2.0.v201605260315.jar
#    org.eclipse.xtend.typesystem.emf_2.2.0.v201605260315.jar
#    org.eclipse.xtend_2.2.0.v201605260315.jar
#    org.objectweb.asm_5.2.0.v20170126-0011.jar

  edit-proto-google-232 = instance.repoDir {
    name = "edit-proto-google-232";
    src = fetchsite {
      url = "http://google.github.io/protobuf-dt/updates/latest" ;
      sha256 = "0y2b85gkclfnsy596gzpmddp8s4g13k3vq7xx5rwip2384v6lkc9";
      regexInclude = "com.google.eclipse.protobuf(.+)2.3.2(.+)jar";
    };
    deps = [
        ide-xtext-2130
#        model-mwe-291
#        model-xpand-220
    ];
    meta = {
        homepage = https://github.com/google/protobuf-dt ;
        descriptions = "IDE integration to Eclipse users when working on protobuf files" ;
    };
  };

}
