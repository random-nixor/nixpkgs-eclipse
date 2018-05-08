#! /usr/bin/env bash

#
# Overlay module setup.
# https://nixos.org/nixpkgs/manual/#chap-overlays
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
#

set -e -u -x

base=$(cd "${BASH_SOURCE%/*}" && pwd)

module="nixpkgs-eclipse"

configDir="$HOME/.config/nixpkgs/overlays"

moduleDir="$configDir/$module"

moduleSource="$base/overlay.nix"

moduleTarget="$configDir/$module.nix"

mkdir -p "$configDir" "$moduleDir"

ln -f -s "$moduleSource" "$moduleTarget"
