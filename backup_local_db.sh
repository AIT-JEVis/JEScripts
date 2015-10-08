#!/bin/bash

date=`date "+%Y-%m-%dT%H%M"`
BAK_SQL="/tmp/localhost_mydump_${date}.sql.gz"

echo "backup local db"
mysqldump -pjevistest -u jevis jevis | gzip -c > "$BAK_SQL"
echo "done!"

