#! /bin/bash
V_DATABASE_USER_NAME=_NAME;
V_DATABASE_USER_PASSWORD=_PASS;
V_FILE_DIRECTORY=/home/_USER/Desktop/;
V_DATABASE_NAME=$1;

#echo -n "Enter database name: " 

echo -n "This operation will DROP database "\""${V_DATABASE_NAME}"\"" are you sure? say "\""yes"\"": " 
read i_agreement 

if [ "$i_agreement" == "yes" ]
then
	echo "Dropping database..."
	mysql -u ${V_DATABASE_USER_NAME} -p${V_DATABASE_USER_PASSWORD} <<-EOF
	DROP DATABASE IF EXISTS ${V_DATABASE_NAME};
	EOF
	echo "Dropped database."

	mysql -u ${V_DATABASE_USER_NAME} -p${V_DATABASE_USER_PASSWORD} <<-EOF
	CREATE DATABASE ${V_DATABASE_NAME}
	CHARACTER SET "utf8"
	COLLATE "utf8_general_ci"
	EOF
	echo "Created database."

	echo "Begin importing..."
	mysql -u ${V_DATABASE_USER_NAME} -p${V_DATABASE_USER_PASSWORD} ${V_DATABASE_NAME} < ${V_FILE_DIRECTORY}${V_DATABASE_NAME}.sql
	echo "Done." 
fi
