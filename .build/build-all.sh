#! /usr/bin/env bash

#
# build popular configurations
#

set -e -u

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
    java-dsl-473a
    scala-473a
    scala-main-473a
    xmind-87
#    total-473a
)

time build_list
