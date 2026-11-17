# Notas · Proxy inverso con Nginx (práctica temporal)

Práctica de la rama `feature-redesdocker`. **Enrutamiento por ruta (path-based)**.
Es temporal: pensada para una presentación y luego se deshace.

## ¿Qué es un proxy inverso?

Un servidor que recibe **todas** las peticiones HTTP en un único punto de entrada
y las **reenvía** al contenedor correcto según la ruta (o el dominio). Beneficios:

- un solo puerto expuesto (aquí, `8080`);
- los puertos internos de las apps quedan ocultos;
- URLs limpias y punto único para logs / TLS.

## Las 2 aplicaciones

Dos páginas estáticas temáticas de CampusCloud, servidas cada una por un
`nginx:alpine`:

| App | Contenedor | Página | Tema |
|---|---|---|---|
| App 1 | `app1` | 🎓 Portal de Estudiantes | azul |
| App 2 | `app2` | 👩‍🏫 Portal de Docentes | verde |

## Topología

```
navegador ─:8080─► [ nginx-proxy ] ─┬─► app1 (🎓 Portal de Estudiantes)
                                    └─► app2 (👩‍🏫 Portal de Docentes)
```

Solo `nginx-proxy` publica puerto al host. `app1` y `app2` viven únicamente en la
red interna `campuscloud_proxy_net`; solo se llega a ellas a través del proxy.

## Archivos

| Archivo | Rol |
|---|---|
| `campus-cloud-proyect/docker-composev6.yml` | Orquesta nginx + app1 + app2 |
| `docker/nginx/conf.d/default.conf` | Config del proxy (bloques `location`) |
| `docker/nginx/apps/app1/index.html` | Página del Portal de Estudiantes |
| `docker/nginx/apps/app2/index.html` | Página del Portal de Docentes |

## Cómo levantarlo

> Requiere **Docker Desktop corriendo**.

Desde la carpeta `campus-cloud-proyect/`:

```powershell
docker compose -f docker-composev6.yml up -d
```

Luego, en el navegador:

- http://localhost:8080/        → portada con enlaces
- http://localhost:8080/app1/   → 🎓 Portal de Estudiantes (app1)
- http://localhost:8080/app2/   → 👩‍🏫 Portal de Docentes (app2)

Ver logs del proxy:

```powershell
docker compose -f docker-composev6.yml logs -f nginx-proxy
```

## Comprobar que las apps NO son accesibles por fuera

Como no publican puertos, esto **no** debe responder desde el host:

```powershell
curl http://localhost:8081   # no hay nada publicado: falla (correcto)
```

Solo el proxy en `8080` da acceso. Esa es la gracia del proxy inverso.

## Cómo deshacer la práctica

```powershell
docker compose -f docker-composev6.yml down
```

Eso borra contenedores y la red `campuscloud_proxy_net` (no es externa).
Para eliminarla del repo: borrar `docker-composev6.yml` y la carpeta `docker/nginx/`.

## Detalle clave de la config

En `default.conf`, cada `location` quita su prefijo antes de reenviar, para que
la app reciba la petición en su raíz `/`:

```
navegador pide:  /app1/        ->  app1 recibe:  /
navegador pide:  /app1/foo     ->  app1 recibe:  /foo
```
