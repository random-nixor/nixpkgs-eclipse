#! /usr/bin/env bash

#
# Eclipse overlay setup.
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
#

set -e -u -x

base=$(cd ${BASH_SOURCE%/*} && pwd)

overlays=$HOME/.config/nixpkgs/overlays

source="$base/overlay.nix"

target="$overlays/nixpkgs-eclipse.nix"

mkdir -p "$overlays"

ln -f -s "$source" "$target"
