#wait for the SQL Server to come up
echo "INFO: -----> Wait for the SQL Server to come up."
sleep 30s

# フォルダ名1から順にフォルダ内のsqlを実行する
echo "INFO: -----> Run the setup script to create the DB and the schema in the DB."
folder_num=1
while [ -e ./setup-data/$folder_num ]; do
    echo "INFO: -----> Start executing *.ddl in folder ${folder_num}"
    ddlfiles="./setup-data/${folder_num}/*.ddl"
    for ddlfile in $ddlfiles; do
        echo "INFO: -----> sqlcmd executes $sqlfile"
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i $ddlfile
    done

    echo "INFO: -----> Start executing *.sql in folder ${folder_num}"
    sqlfiles="./setup-data/${folder_num}/*.sql"
    for sqlfile in $sqlfiles; do
        echo "INFO: -----> sqlcmd executes $sqlfile"
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i $sqlfile
    done

    folder_num=`expr $folder_num + 1`
done

echo "INFO: -----> Complete!."
