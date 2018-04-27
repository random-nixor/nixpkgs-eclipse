#! /usr/bin/env bash

set -e

source ${BASH_SOURCE%/*}/any.sh

nix_verify eclipse.runtime.javascript-473a
