#!/bin/bash
CURL='/usr/bin/curl'
url1="http://intelligence.htb/documents/"
for mon in {01..12}
do
	for dt in {01..31}
	do
		url2="2020-$mon-$dt-upload.pdf"
		url3="$url1$url2"
		res=$($CURL -o /dev/null -s -w "%{http_code}\n" $url3)
		if [ $res == 200 ];
		then
		echo $url2
		($CURL $url3 -o $url2)
		fi
	done
done
