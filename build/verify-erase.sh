#! /usr/bin/env bash

#
# remove all eclipse components
#

set -e

nix-env -q | grep eclipse | xargs -I % nix-env -e %

nix-collect-garbage -d
