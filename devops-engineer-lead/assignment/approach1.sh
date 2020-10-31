#!/bin/bash

file_name=`find /home/ubuntu/audios/*.log -type f -mmin +1 |awk -F'/' '{print $NF}'`

for i in $file_name;
do
	cd /home/ubuntu/audios/
	created=`ls -lrt $i | awk '{print $6,$7,$8}'`
	createdISO=`date -d "$created" --iso-8601=seconds `

	currentISO=`date --iso-8601=seconds`
	i_date=`echo "$createdISO"  |awk -F'T' '{print $1}'`

	echo "$i $createdISO $currentISO" >> deleted-files-$i_date.log
done;
