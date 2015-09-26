#!/bin/bash
. funcs

docker run -it --rm -e "srv=$(dip srv-1)" gliderlabs/consul sh
