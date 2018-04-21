#
# Xmind organizer
#
{ instance, fetchzip }:

let 
    meta = {
        homepage = https://github.com/xmindltd/xmind ;
        description = "XMind is an open source project that contributes to building a cutting-edge brainstorming/mind-mapping";
    };
in 
rec {

  ide-xmind-87 = instance.repoDir {
    inherit meta;
    name = "ide-xmind-87";
    src = fetchzip {
      stripRoot = false;
      url = "http://www.xmind.net/xmind/downloads/xmind-8-update7-linux.zip" ;
      sha256 = "0dfibcwm05wrxf8avz7yrw5959gxrhp0v221f9g6jkin483caxz7";
    };
  };

}
