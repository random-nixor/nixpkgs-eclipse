#! /usr/bin/env bash

#
# build functions
#

set -e -u

nix_install() {
    local path=$1
    echo "installing $path"
    nix-env -f $root/default.nix -i -A $path --show-trace
}

eclipse_config() {
    echo \
    -debug $base/eclipse-debug.ini \
    -pluginCustomization $base/eclipse-plugin.ini \
    -consoleLog
} 

nix_startup () {
    local path=$1
    local name=${path//./-}
    echo "launching $name"
    $name $(eclipse_config)
}

nix_verify() {
    local path=$1
    time nix_install $path
    nix_startup $path
}

has_proxy() { 
    local "$@"
    netcat -w 1 -z "$host" "$port"
}

proxy_setup() {
    echo "providing proxy"
    if has_proxy host="proxy" port="3128" ; then 
       export http_proxy="http://proxy:3128"
    else
       echo "# no http_proxy"
    fi
    if has_proxy host="proxy" port="3130" ; then 
       export https_proxy="http://proxy:3130"
    else
       echo "# no https_proxy"
    fi
}

build_runtime() {
    for name in "${runtime_list[@]}" ; do
        nix_install "eclipse.runtime.$name"
    done
}

build_product() {
    for name in "${product_list[@]}" ; do
        nix_install "eclipse.product.$name"
    done
}

build_list() {
    build_runtime
    build_product
}

base=$(cd ${BASH_SOURCE%/*} && pwd)
root=$(cd $base/.. && pwd)
