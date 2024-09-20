#!/bin/bash
# MAUDAVPN
# VER 1.0.0
#
clear

search="$1"
#  comando pra buscar a palavra no direto e subpastas atual
find . -type f -exec grep -Hn "$search" {} \;
echo 