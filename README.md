## Farmomatic

* Para instalar la aplicación, es necesario instalar [Docker](https://docs.docker.com/install/) y [Docker compose](https://docs.docker.com/compose/install/) en la PC donde se vaya a probar el sistema.

* Una vez instalado las dependencias previas, se hace un clone de este repositorio y se ejecuta los comandos de Docker, se configura el archivo `.env`:

    * `git clone https://github.com/cristianbarbaro/farmomatic.git && cd farmomatic`
    * `cp .env-example .env` (se debe configurar las variables dentro del archivo `.env`)
    * `docker-compose build`
    * `docker-compose up -d`

* Una vez levantado el servicio es necesario iniciar la base de datos para que podamos utilizar el sistema. Para ello, debemos acceder al contenedor que corre nuestra aplicación y ejecutar el comando allí:
    * `docker exec -it farmomatic_web_1 bash`
    * `rails db:reset`

* Ahora se puede acceder al servicio mediante la url http://localhost:3000.

