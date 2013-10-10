#!/bin/sh

# Extract functions from Evolve Thinking's free promise libary. Should be run
# inside masterfiles:
#
# git clone https://github.com/evolvethinking/evolve_cfengine_freelib.git
# cd evolve_cfengine_freelib
# ~/path/to/tools/extract_cf3evolve_freelib.sh

find . -type f -name 'evolve_freelib.cf' | xargs cat\
| awk '/^(bundle|body)/ {gsub(/\(.*/, "", $3);printf " %s", $3}'\
| awk '{count=split($0, tab); asort(tab);for (i=0;i<=count;i++) { if (i % 6 ==0) printf "MARK";printf "%s ", tab[i]}} END{ print "contained"}'|\
sed 's/MARK/contained\nsyn keyword cf3Evolve_freelib\t/g'|tail -n +2
