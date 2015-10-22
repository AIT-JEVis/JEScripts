#!/bin/bash
set -e

date=`date "+%Y-%m-%dT%H%M"`
TMP_SQL="/tmp/openjevis_mydump_${date}.sql.gz"
BAK_SQL="/tmp/localhost_mydump_${date}.sql.gz"

echo "backup local db"
mysqldump -pjevistest -u jevis jevis | gzip -c > "$BAK_SQL"
echo "clone db from openjevis.org"
mysqldump -pjevistest -h openjevis.org -P 13306 -u jevis jevis | gzip > "$TMP_SQL"
echo "drop old schema 'jevis' and create new"
mysql -pAIT_mysql -u root < create_schema_jevis.sql
echo "import clone"
gunzip < "$TMP_SQL" | mysql -pjevistest -u jevis jevis
echo "owerwrite password of 'Sys Admin'"
echo 'INSERT INTO sample (object,attribute,timestamp,value,insertts,note) VALUES (16,"Password",now(), "1000:849f6ec5bb324d34100ba4ed90dc8a816082552af804cb46:c18a479d53aba226b55234bafa5fb025746a130530ce22c7", now(),"Password manual override for Sys Admin");' | mysql -pjevistest -u jevis jevis
echo "done!"

