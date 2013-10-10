#!/bin/sh

# Loic Pefferkorn <loic-cfengine@loicp.eu>

# Extract functions from CFEngine stdlib documentation. Should be run
# inside CFEngine masterfiles repository:
#
# git clone https://github.com/cfengine/masterfiles.git
# cd masterfiles
# ~/path/to/tools/extract_cf3Stdlib.sh

find . -path "./lib*"  -type f -name '*.cf' | xargs cat | grep -E '^(bundle|body)'| sort | uniq\
|awk '{gsub(/\(.+/, "", $3);printf " %s", $3}'\
|awk '{count=split($0, tab); asort(tab);for (i=0;i<=count;i++) { if (i % 6 ==0) printf "MARK";printf "%s ", tab[i]}} END{ print "contained"}'\
|sed 's/MARK/contained\nsyn keyword cf3Stdlib\t/g'|tail -n +2
