#!/bin/bash
V_DATABASE_NAME=DATABASE;
V_DATABASE_USER_NAME=admin;
V_TIMESTAMP=$(date +%Y_%m_%d_%H%M%S)
V_FILENAME="${V_TIMESTAMP}-${V_DATABASE_NAME}.sql"

echo -n "Enter a password for db.user "\""${V_DATABASE_USER_NAME}"\"": "
read -s i_password
echo 

echo -n "Do you want data from tables "specific_table1" and "spacific_table_2" ? say "\""yes"\"": " 
read i_agreement

if [ "$i_agreement" = "yes" ]
then
	echo "Exporting "\""${V_DATABASE_NAME}"\"" with specific tables data..."
	mysqldump -u ${V_DATABASE_USER_NAME} -p${i_password} ${V_DATABASE_NAME} --routines > /full-path/to/${V_FILENAME}
else
	echo "Exporting "\""${V_DATABASE_NAME}"\"" without specific tables data..."

	#add tables structure + data
	mysqldump -u ${V_DATABASE_USER_NAME} -p${i_password} ${V_DATABASE_NAME} \
	--routines \
	--ignore-table=${V_DATABASE_NAME}.specific_table_1 \
	--ignore-table=${V_DATABASE_NAME}.specific_table_2 \
	> ${V_FILENAME}	&& \

	#get only the structure of ignored tables..
	mysqldump -u ${V_DATABASE_USER_NAME} -p${i_password} ${V_DATABASE_NAME} \
	 specific_table_1 \
	 specific_table_2 \
	--no-data >> /full-path/to/${V_FILENAME}
fi
echo "Done."
