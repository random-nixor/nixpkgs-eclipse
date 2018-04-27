#! /usr/bin/env bash

set -e

source ${BASH_SOURCE%/*}/any.sh

nix_verify eclipse.product.scala-main-473a
