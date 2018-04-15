#! /usr/bin/env bash

#
# build configuratiion for travis ci
#

set -e -u

source ${BASH_SOURCE%/*}/any.sh

runtime_list=(
    base-473a
) 

product_list=(
    java-473a
)

time build_list
