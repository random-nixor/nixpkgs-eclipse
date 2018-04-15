#! /usr/bin/env bash

#
# build popular configurations
#

set -e

source ${BASH_SOURCE%/*}/any.sh

runtime_list=(
    base-473a
    core-473a
    cpp-473a
    java-473a
    java-dsl-473a
    java-ee-473a
    modeling-473a
    php-473a
    rcp-473a
) 

product_list=(
    base-473a
    core-473a
    cpp-473a
    java-473a
    java-main-473a
    scala-473a
    scala-main-473a
    total-473a
)

build_rutimime() {
    for name in "${runtime_list[@]}" ; do
        nix_install "eclipse.runtime.$name"
    done
}

build_product() {
    for name in "${product_list[@]}" ; do
        nix_install "eclipse.product.$name"
    done
}

build_all() {
    build_rutimime
    build_product
}

time build_all
