#Primera Capa: Dependencias
#Imagen heredada de Docker Hub
FROM node:latest
#Comando que indica la carpeta de origen y la crea si es necesario, además es la dirección por defecto 
WORKDIR /src
#Copia el archivo seleccionado y lo guarda en la carpeta indicada "./" carpeta mencionada en el Workdir
COPY package.json ./
#Esto es necesario para que se incluyan las depedencias que tenemos anteriormente definidas en package.json
#RUN ejecuta comando
RUN npm install

#Segunda Capa: Inyección de archivos
#Copia la carpeta en el contexto que se esta ejecutando. "." Carpeta root, "." Workdir
COPY . . 
#Exponer un puerto (indicativo a los programadores)
EXPOSE 3000
#Define un comando por defecto para la imagen, se ejecuta como arreglo, se deben separar por comas 
#Sino se envían argumentos se ejecuta por defecto
CMD ["node","main.js"]

#Comandos

#Para crear la imagen se usa el comando
#-t indica el tag de la imagen o namespace para agrupar, si es remoto debe llamarse igual
#name nombre de la imagen
#. (/src) contexto de los archivos que se van a inyectar (un punto indica el mismo nivel del dockerfile, carpeta donde estas parado)
#docker build -t tag/name .

#Para ver las imágenes
#docker images

#Para ejecutar la imagen y hacer forwarded (reenvío) de puertos
#docker run -p 3000:3000
#arquitectura actual: 
#Sistema Operativo escucha peticiones en el puerto 3000, 
#esas peticiones se mueven a través del port forwarded creadas en Vagrant,
#Luego esa petición que llega a la máquina virtual se mueve dentro del contenedor.
#La página se ejecuta en el contenedor
