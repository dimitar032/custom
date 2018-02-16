#! /bin/bash
V_DATABASE_USER_NAME=admin;
V_DATABASE_USER_PASSWORD=secret;
V_FILE_DIRECTORY=/home/mitaka/Desktop/;

echo -n "Enter database name: "
read i_database_name

echo -n "This operation will DROP database "\""${i_database_name}"\"" are you sure? say "\""yes"\"": " 
read i_agreement 

if [ "$i_agreement" != "yes" ]
then
	exit
fi

echo "Dropping database..."
mysql -u ${V_DATABASE_USER_NAME} -p${V_DATABASE_USER_PASSWORD} <<EOF
DROP DATABASE IF EXISTS ${i_database_name};
EOF
echo "Dropped database."

mysql -u ${V_DATABASE_USER_NAME} -p${V_DATABASE_USER_PASSWORD} <<EOF
CREATE DATABASE ${i_database_name}
CHARACTER SET "utf8"
COLLATE "utf8_general_ci"
EOF
echo "Created database."

echo "Begin importing..."
mysql -u ${V_DATABASE_USER_NAME} -p${V_DATABASE_USER_PASSWORD} ${i_database_name} < ${V_FILE_DIRECTORY}${i_database_name}.sql
echo "Done."
