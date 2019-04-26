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

#nix-env -f default.nix -i -A eclipse.dropin.ide-pde-411

#nix-env -f default.nix -i -A eclipse.dropin.ide-cdt-970

#nix-env -f default.nix -i -A eclipse.dropin.tool-oomph-190

nix-env -f default.nix -i -A eclipse.dropin.arkon-1903

#nix-env -f default.nix -i -A eclipse.dropin.tool-bnd-420

#nix-env -f default.nix -i -A eclipse.dropin.tool-moreunit-320

# fetchzip
#nix-env -f default.nix -i -A eclipse.dropin.ide-dltk-581
#nix-env -f default.nix -i -A eclipse.dropin.ide-dltk-590

#nix-env -f default.nix -i -A eclipse.dropin.ide-groovy-330

#nix-env -f default.nix -i -A eclipse.dropin.base-equinox-411

#nix-env -f default.nix -i -A eclipse.dropin.ide-xmind-87

#nix-env -f default.nix -i -A eclipse.dropin.scm-git-53

#nix-env -f default.nix -i -A eclipse.dropin.edit-json-boothen-112

#nix-env -f default.nix -i -A eclipse.dropin.build-maven-total-1110

# jars list
#nix-env -f default.nix -i -A eclipse.dropin.build-maven-log-172

#nix-env -f default.nix -i -A eclipse.dropin.ide-scala-471

# ssl
#nix-env -f default.nix -i -A eclipse.dropin.ide-pydev-632

# non-ssl fetchsite
#nix-env -f default.nix -i -A eclipse.dropin.build-gradle-xxx

#nix-env -f default.nix -i -A eclipse.dropin.ide-mcu-451

#nix-env -f default.nix -i -A eclipse.dropin.ide-pydev-720

#nix-env -f default.nix -i -A eclipse.dropin.ide-spoofax-241

# dependency report
# nix-store -q --tree store path or .drv file
# nix-store -q --tree /nix/store/fkx936vzpk4b23cc74n4ir4gfydbhl23-eclipse-platform-473a/

# pretty print
#nix show-derivation /nix/store/i8078h4nppjk86fld5pbyqxhhjbhbmii-eclipse-product-java.drv
