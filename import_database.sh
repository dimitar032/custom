#! /bin/bash

echo Enter database name:
read i_database_name

mysql -u USERNAME -pPASSWORD <<EOF
DROP DATABASE IF EXISTS ${i_database_name};

CREATE DATABASE ${i_database_name}
 CHARACTER SET "utf8"
 COLLATE "utf8_general_ci"
EOF

echo Created new database: "${i_database_name}"
echo Begin importing...
mysql -u USERNAME -pPASSWORD ${i_database_name} < /home/mitaka/Desktop/${i_database_name}.sql
echo Done!


