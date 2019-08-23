#!/bin/bash    
#Function export user privileges    
  
pwd='root!@#'
sock='/data/mysql_3306/mysql.sock'
expgrants()  
{  
  mysql -B -u'root' -p${pwd} -N -S ${sock} $@ -e "SELECT CONCAT(  'SHOW GRANTS FOR ''', user, '''@''', host, ''';' ) AS query FROM mysql.user where user not in ('','root')" | \
  mysql -u'root' -p${pwd} -S ${sock} $@ | \
  sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/-- \1 /;/--/{x;p;x;}'  
}

expgrants > ./grants.sql
