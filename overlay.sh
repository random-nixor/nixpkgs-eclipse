#! /usr/bin/env bash

#
# Eclipse overlay setup.
# https://nixos.org/nixpkgs/manual/#chap-overlays
# https://blog.flyingcircus.io/2017/11/07/nixos-the-dos-and-donts-of-nixpkgs-overlays/
#

set -e -u -x

base=$(cd ${BASH_SOURCE%/*} && pwd)

namespace="nixpkgs-eclipse"

overlays_config="$HOME/.config/nixpkgs/overlays"

overlays_eclipse="$overlays_config/$namespace"

eclipse_source="$base/overlay.nix"

eclipse_target="$overlays_config/$namespace.nix"

mkdir -p "$overlays_config" "$overlays_eclipse"

ln -f -s "$eclipse_source" "$eclipse_target"
