#!/bin/bash
echo "INFO: -----> Start to come up the SQL Server."
/opt/mssql/bin/sqlservr & /usr/src/app/import-data.sh
