#! /usr/bin/env bash
# ffbookmarks_find_links_by_timestamp.sh
# 20231006
# diplay lines from bookmarks.html file by timestamp


usage() {
cat << EOF
	Usage:
	$0 <file name> <timestamp (YYYYmmdd)>

EOF
exit 1
}

curdt=$(date +"%Y%m%d")

if [ $# -ne 2 ]; then
	usage
	exit
else
	fname=$1
	tmpstmp=$2
fi

if [ ! -f $fname ]; then
	echo "No such file: $fname"
	exit
fi

grep ${tmpstmp} ${fname} | sed 's/.*\(http.*:.\+\)" ADD.*>\(.*\)<\/A>/\1 [\2]/'

