#!/bin/bash
TIMESTAMP=date +%F
find /home/ubuntu/audios/ -name 'audio*' -mmin +1 -exec bash -c ' echo "{} - " date -r {} rm -rf {} ' \; | xargs > deleted-files-$TIMESTAMP.log
