<#
docker run `
-d `
--name postgres-campuscloud `
-p 54320:5432 `
-e POSTGRES_PASSWORD=CambiarContrasena`
-v campuscloud-postgres-data:/var/lib/postgres/data `
--restart always `
postgres:16-bookworm
#>

docker run `
--env-file "$PSScriptRoot\.env" `
--network campus-network `
-d `
--name postgres-campuscloud `
-p 54320:5432 `
-v campuscloud-postgres-data:/var/lib/postgres/data `
--restart always `
postgres:16-bookworm