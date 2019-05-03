# Creación de la imagen

[Crear](https://docs.docker.com/engine/reference/commandline/build) la imagen **plantillas-backend**:

```sh
docker build -f docker/Dockerfile -t plantillas-backend:1.4.1-stretch .
```

# Uso de la imagen

El servicio se configura mediante las variables de entorno presentadas en el archivo `docker/runtime.env.sample`

Se puede crear un archivo de configuración a la medida mediante el commando:

```sh
cp docker/runtime.env.sample docker/runtime.env
```

Editar el archivo `runtime.env` con los parametros oportunos.

La aplicacion necesita una base de datos Postgres para poder funcionar.

Puedes levantar una instancia de Postgres que cumpla con los requerimiento del servicio de plantillas-backend mediante los siguientes comandos:

```sh
docker volume create plantillas-data
docker run -d --name plantillas-db -p 5432:5432 -e POSTGRES_USER=plantillas -e POSTGRES_PASSWORD=plantillas -e POSTGRES_DB=plantillas -v plantillas-data:/var/lib/postgresql/data postgres:9.4-alpine
```

Desplegar el sistema mediante el comando:

```sh
docker run -d --name plantillas-backend -p 8000:8000 --env-file=docker/runtime.env plantillas-backend:1.4.1-stretch
```

## Configuración del sistema

Inicializar la aplicación mediante el comando:

```sh
docker exec plantillas-backend npm run setup
```

Hacer login desde el frontend de la aplicación con un usuario de LDAP designado para ser administrador del sistema de plantillas.

Asignar el rol de administrador al mismo usuario mediante el comando:

```sh
docker exec plantillas-backend npm run administrador NOMBRE-DE-USUARIO-ADMINISTRADOR
```

## Administración de la aplicación

Una vez instalada la aplicación es posible realizar las operaciones de administración mediante el frontend.

En particular será posible asignar roles a cada usuario registrado en la aplicación.

Los usuario se registran en la aplicación despues de haberse autenticado la primera vez con sus credenciales de LDAP.
