#!/bin/sh

# Extract functions from CFEngine documentation. Should be run
# inside CFEngine source code directory:
#
# cd cfengine-3.4.2
# ~/path/to/tools/extract_cf3BuiltIns.sh

find $1 -type f -name '*.markdown' -printf "%f "|\
sed  -e 's/.markdown//g'|\
awk '{count=split($0, tab); asort(tab);for (i=0;i<=count;i++) { if (i % 6 == 0) printf "MARK";printf "%s ", tab[i]}} END{print "contained"}'|\
sed 's/MARK/contained\nsyn keyword cf3BuiltIns\t/g'|tail -n +2
