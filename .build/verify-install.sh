#! /usr/bin/env bash

#
# install select eclipse components
#

set -e

source ${BASH_SOURCE%/*}/any.sh

cd $root

#export NIX_DEBUG=1

#nix-env -f default.nix -i -A eclipse.runtime

#nix-env -f default.nix -i -A eclipse.dropin

# fetchzip
#nix-env -f default.nix -i -A eclipse.dropin.ide-dltk-581

#nix-env -f default.nix -i -A eclipse.dropin.base-equinox-473a

#nix-env -f default.nix -i -A eclipse.dropin.build-maven-190

nix-env -f default.nix -i -A eclipse.dropin.ide-xmind-87

# jars list
#nix-env -f default.nix -i -A eclipse.dropin.build-maven-log-172

#nix-env -f default.nix -i -A eclipse.dropin.ide-scala-471

# ssl
#nix-env -f default.nix -i -A eclipse.dropin.ide-pydev-632

# non-ssl fetchsite
#nix-env -f default.nix -i -A eclipse.dropin.build-gradle-221



# dependency report
# nix-store -q --tree store path or .drv file
# nix-store -q --tree /nix/store/fkx936vzpk4b23cc74n4ir4gfydbhl23-eclipse-platform-473a/

# pretty print
#nix show-derivation /nix/store/i8078h4nppjk86fld5pbyqxhhjbhbmii-eclipse-product-java.drv
