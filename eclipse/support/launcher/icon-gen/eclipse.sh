#! /usr/bin/env bash

cd $(dirname $0)

rsvg-convert \
   --format png \
   --width 256 \
   eclipse.svg --output eclipse.png

   
gpicview eclipse.png
