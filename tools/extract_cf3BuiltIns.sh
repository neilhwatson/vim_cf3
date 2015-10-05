#!/bin/sh

# Loic Pefferkorn <loic-cfengine@loicp.eu>

# Extract functions from CFEngine documentation. Should be run
# inside CFEngine/documentation repository, in reference/functions directory:
#
# git clone https://github.com/cfengine/documentation.git
# cd documentation/reference/functions
# ~/path/to/tools/extract_cf3BuiltIns.sh

#find $1 -type f -name '*.markdown' -printf "%f "|\
#sed  -e 's/.markdown//g'|\
#awk '{count=split($0, tab); asort(tab);for (i=0;i<=count;i++) { if (i % 6 == 0) printf "MARK";printf "%s ", tab[i]}} END{print "contained"}'|\
#sed 's/MARK/contained\nsyn keyword cf3BuiltIns\t/g'|tail -n +2

find . -type f -name '*.markdown' -exec basename {} .markdown \; |\
gsed -re 's/^(.*)intrealstring(.*)/\1int\2\n\1real\2\n\1string\2/' | sort | xargs |\
awk '{count=split($0,tab); for(i=0;i<count;i++) { if(i%6==0) printf "MARK"; printf "%s ",tab[i]}} END{print "contained"}' |\
gsed 's/MARK\s*/contained\nsyn keyword cf3BuiltIns\t/g' | tail -n +2
