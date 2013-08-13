#!/bin/sh

# Extract functions from CFEngine stdlib documentation. Should be run
# inside CFEngine source code directory:
#
# cd cfengine-3.4.2
# ~/path/to/tools/extract_cf3Stdlib.sh

stdlib_files="$1"
cat $stdlib_files | awk '/^(bundle|body)/ {gsub(/\(.+/, "", $3);printf " %s", $3}' |\
sort|awk '{count=split($0, tab); asort(tab);for (i=0;i<=count;i++) { if (i % 6 ==0) printf "MARK";printf "%s ", tab[i]}} END{ print "contained"}'|\
sed 's/MARK/contained\nsyn keyword cf3Stdlib\t/g'|tail -n +2
