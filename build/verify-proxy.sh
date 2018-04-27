#! /usr/bin/env bash

#
#
#

set -e

source ${BASH_SOURCE%/*}/any.sh

proxy_setup

test_http="http://download.eclipse.org/technology/epp/downloads/release/oxygen/3a/eclipse-javascript-oxygen-3a-linux-gtk-x86_64.tar.gz"

test_https="https://cache.nixos.org/nar/030rlm06xvzh8gxjvzkwdhaa9cvcr7dnfihila4xspvdxzzb79br.nar.xz"

curl -v -L "$test_http" > /dev/null

curl -v -L "$test_https" > /dev/null
