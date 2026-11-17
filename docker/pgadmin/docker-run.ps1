docker run -d `
--env-file "$PSScriptRoot\.env" `
--network campus-network `
--name pgadmin-campuscloud `
-p 8082:80 `
-v campuscloud_pgadmin_data:/var/lib/pgadmin `
--restart always `
dpage/pgadmin4:6.17