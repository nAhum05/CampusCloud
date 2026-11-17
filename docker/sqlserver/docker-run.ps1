docker run `
--env-file "$PSScriptRoot\.env" `
--network campus-network `
-d `
--name sqlserver-campuscloud `
-p 4540:1433 `
-v campuscloud-sql-data:/var/opt/mssql `
--restart always `
mcr.microsoft.com/mssql/server:2025-CU8-ubuntu-24.04
