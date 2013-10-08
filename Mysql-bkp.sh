#!/bin/bash
#
#  Backup das DATABASES
#  Envia por FTP
#  Autor : Daniel Lara Souza
#  Data 06-10-2011
#
#
data=`/bin/date +%d-%m-%Y`
 
cd /backup
 
for I in `echo "show databases;" | mysql -u root -p'12345'| grep -v Database`; do mysqldump -u root -p'12345' $I > "$I-$data.sql"; done
 
tar -cvzf backup-${data}.tar.gz *.sql
 
rm *.sql
