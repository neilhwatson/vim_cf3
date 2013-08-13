#!/bin/sh

# Extract functions from Evolve Thinking's free promise libary. Should be run
# inside masterfiles:
#
# ~/path/to/tools/extract_cf3evolve_freelib.sh

efl=$1 
awk '/^(bundle|body)/ {gsub(/\(.*/, "", $3);printf " %s", $3}' $efl  |\
sort|awk '{count=split($0, tab); asort(tab);for (i=0;i<=count;i++) { if (i % 6 ==0) printf "MARK";printf "%s ", tab[i]}} END{ print "contained"}'|\
sed 's/MARK/contained\nsyn keyword cf3Evolve_freelib\t/g'|tail -n +2
