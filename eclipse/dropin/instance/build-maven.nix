#
# Maven build integration
#
{ instance, fetchurl, fetchsite, dropin }:

with dropin;

let
    orbit-drops = http://download.eclipse.org/tools/orbit/downloads/drops ;
    connect-drops = http://repo1.maven.org/maven2/.m2e/connectors ; 
    meta = {
        homepage = http://www.eclipse.org/m2e ;
        description = "M2Eclipse provides tight integration for Apache Maven into the IDE" ;
    };

in
rec {

#   <requires>
#      <import plugin="org.eclipse.emf.ecore"/>
#      <import plugin="org.eclipse.emf.ecore.xmi"/>
#      <import plugin="org.eclipse.emf.edit"/>
#      <import plugin="org.eclipse.emf.ecore.edit"/>
#      <import plugin="org.eclipse.wst.common.emf"/>
#      <import plugin="org.eclipse.wst.sse.core"/>
#      <import plugin="org.eclipse.wst.xml.core"/>
#      <import plugin="org.eclipse.jem.util"/>
#      <import plugin="org.eclipse.platform"/>
#      <import feature="org.eclipse.rcp" version="3.6.0" match="greaterOrEqual"/>
#      <import feature="org.eclipse.jdt" version="3.6.0" match="greaterOrEqual"/>
#   </requires>

  build-maven-total-183 = [
    build-maven-183
    build-maven-log-172
    build-maven-tycho-090
    build-maven-bldhlp-0150
    build-maven-mvnarc-0172
    build-maven-mvndep-004
#    build-maven-scala-051
    build-maven-egit-0150
    build-maven-subver-0130
    # build-maven-takariteam-???
  ];

  build-maven-total-190 = [
    build-maven-190
    build-maven-log-172
    build-maven-tycho-090
    build-maven-bldhlp-0150
    build-maven-mvnarc-0172
    build-maven-mvndep-004
#    build-maven-scala-051
    build-maven-egit-0150
    build-maven-subver-0130
    build-maven-takariteam-010
  ];

  build-maven-deps = [ 
    build-maven-log-172 # for maven console 
    ide-wtp-393 # FIXME reduce
    model-emfxsd-2130 # FIXME reduce 
  ];

  # release
  build-maven-183 = instance.repoDir {
    inherit meta;
    name = "build-maven-183";
    src = fetchsite {
      url = "http://download.eclipse.org/technology/m2e/releases/1.8/1.8.3.20180227-2137" ;
      sha256 = "0ddpsggsff6hvgx838zgr2ln55yj0hmlwv4mh9xadl4x6vp9kqr4";
    };
    deps = build-maven-deps; 
  };

  # milestone
  build-maven-190 = instance.repoDir {
    inherit meta;
    name = "build-maven-190";
    src = fetchsite {
      url = "http://download.eclipse.org/technology/m2e/milestones/1.9/1.9.0.20180313-2237" ;
      sha256 = "1mrxf765vvcwpd9q1mbrfjivh7kw1x8zil0y1v392zb8s2fii39i";
    };
    deps = build-maven-deps; 
  };
  
  build-maven-log-172 = instance.repoJars {
    meta = {
        description = "M2E Maven Console for Eclipse dependencies" ;
    };
    name = "build-maven-log-172";
    features = [
    ];
    plugins = [
        (fetchurl{
          url = "${orbit-drops}/R20170303204511/repository/plugins/org.slf4j.api_1.7.2.v20121108-1250.jar" ;
          sha256 = "1njsiqi22kgf39xg2z0c8bvk1zwg4jwdbshys0qhyiim3ywdrgck";
        })
        (fetchurl{
          url = "${orbit-drops}/R20170303204511/repository/plugins/ch.qos.logback.core_1.0.7.v20121108-1250.jar" ;
          sha256 = "0az6pyw62glbz149and7b6imzy0sw6gcp1c24dqz006xmf59if0j";
        })
        (fetchurl{
          url = "${orbit-drops}/R20170303204511/repository/plugins/ch.qos.logback.classic_1.0.7.v20121108-1250.jar" ;
          sha256 = "0vgim9q6qb8hx82dk3aa0ck7zgra0dhfwdxslilpzy6lig1aywxr";
        })
        (fetchurl{
          url = "${orbit-drops}/R20170303204511/repository/plugins/ch.qos.logback.slf4j_1.0.7.v201505121915.jar" ;
          sha256 = "0zq4ll4sxbjh2blw99p5yzsp6apkyfc5kc1ysgfxiw682ghql19q";
        })
    ];
  };
  
  build-maven-egit-0150 = instance.repoDir {
    name = "build-maven-egit-0150";
    src = fetchsite {
      url = "${connect-drops}/m2eclipse-egit/0.15.0/N/0.15.0.201610271525" ;
      sha256 = "18d5afmm94jnrypgph23cxwqly9z12jm3kx4xs4mpxyvxzmacwph";
    };
    meta = {
        homepage = https://github.com/tesla/m2eclipse-egit ;
        description = "M2E SCM Handler for EGit" ;
    };
  };
  
  build-maven-subver-0130 = instance.repoDir {
    name = "build-maven-subver-0130";
    src = fetchsite {
      url = "${connect-drops}/m2eclipse-subversive/0.13.0/N/0.13.0.201302121311" ;
      sha256 = "124fqgyz4053hppv4hs2x16a4dgd5qk8jxkwsi2gja1h1645hznn";
    };
    meta = {
        homepage = https://github.com/alblue/m2eclipse-subversive ;
        description = "M2E SCM Handler for Subversive" ;
    };
  };
  
  build-maven-tycho-090 = instance.repoDir {
    name = "build-maven-tycho-090";
    src = fetchsite {
      url = "${connect-drops}/m2eclipse-tycho/0.9.0/N/0.9.0.201609252021" ;
      sha256 = "18npvrzfilkfay5a3l5cq1jyr948jdfc3bmk177qfbl6ngrwsg57";
    };
    meta = {
        homepage = https://github.com/tesla/m2eclipse-tycho ;
        description = "M2E Tycho Project Configurators" ;
    };
  };
  
  build-maven-bldhlp-0150 = instance.repoDir {
    name = "build-maven-bldhlp-0150";
    src = fetchsite {
      url = "${connect-drops}/m2eclipse-buildhelper/0.15.0/N/0.15.0.201405280027" ;
      sha256 = "1pcjidsmgirfxh2skb1inl81hl7lw8p2l4py6skjhwsyb8swz49j";
    };
    meta = {
        homepage = https://github.com/tesla/m2eclipse-buildhelper ;
        description = "M2E connector for build-helper-maven-plugin" ;
    };
  };
  
  build-maven-mvnarc-0172 = instance.repoDir {
    name = "build-maven-mvnarc-0172";
    src = fetchsite {
      url = "${connect-drops}/m2eclipse-mavenarchiver/0.17.2/N/0.17.2.201609252051" ;
      sha256 = "02gd62gl5xa7qdlg23rfyraycm1nppjgc9bbs7r2jk9nv9s8wdrb";
    };
    meta = {
        homepage = https://github.com/tesla/m2eclipse-mavenarchiver ;
        description = "M2E Maven Archiver Connector" ;
    };
  };
  
  build-maven-takariteam-010 = instance.repoDir {
    name = "build-maven-takariteam-010";
    src = fetchsite {
      url = "${connect-drops}/takari-team/0.1.0/N/0.1.0.201710190128" ;
      sha256 = "06w8pi0arjizsxvzsb6jlijqx5946nvsl41ajm7avb8nwsi4dg1w";
    };
    meta = {
        homepage = http://takari.io/book/30-team-maven.html ;
        description = "Takari Extensions for Apache Maven" ;
    };
  };
  
  build-maven-mvndep-004 = instance.repoDir {
    name = "build-maven-mvndep-004";
    src = fetchsite {
      url = "http://ianbrandt.github.io/m2e-maven-dependency-plugin" ;
      sha256 = "11pmqiwc3agm9p86kvb3w1d1z4h6ra5w4kpivzhfagy8x137i8i5";
      regexInclude = "com.ianbrandt.(.+)0.0.4(.+)jar";
    };
    meta = {
        homepage = https://github.com/ianbrandt/m2e-maven-dependency-plugin ;
        description = "M2E connector for the Maven Dependency Plugin" ;
    };
  };
  
  build-maven-scala-051 = instance.repoDir {
    name = "build-maven-scala-051";
    src = fetchsite {
      url = "http://alchim31.free.fr/m2e-scala/update-site/m2eclipse-scala" ;
      sha256 = "1p6rxpb4l9mq9xpv3il7ac5hmqdn8l5pfp2arh13c7sxsyipm9v6";
      regexInclude = "org.maven(.+).scala(.+)0.5.1(.+)jar";
    };
    meta = {
        homepage = https://github.com/sonatype/m2eclipse-scala ;
        description = "M2E Scala intergation" ;
    };
  };
  
}
