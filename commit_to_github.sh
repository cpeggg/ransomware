#!/bin/sh
COMMITMENT="$1"
LEN=$(echo -n "$COMMITMENT"|wc -c)
if [ "$LEN" = "0" ]
then 
	echo "\nUsage: $0 commitment\n"
	exit 1
fi
echo "git add --all"
git add --all
echo "git commit -m $COMMITMENT"
git commit -m $COMMITMENT
echo "git push -u origin master"
git push -u origin master