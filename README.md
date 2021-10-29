# Alkemy Ruby Challenge - Alejo Yanczuk
## Este es el repositorio para el challenge de Ruby de Alkemy
### -Actualmente-
#### Falta finalizar los tests unitarios y crear un mailer que funcione
### -Completado-
#### Todas las consignas excepto las mencionadas en -Actualmente-
### -Planeado-
#### Añadir views para visualizar de manera intuitiva los personajes, producciones y estudios. Desplegar en Heroku.

## Versión de ruby y ruby on rails
### ruby '3.0.2'
### rails '6.1.4

## Gemas utilizadas
#### "has_scope" para los filtros
#### "bcrypt" para el password_digest
#### "rspec_rails" para test unitarios
#### "factory_bot_rails" para crear instancias de tests en la DB
#### "pg" base de datos PostgreSQL

## Autenticación
Antes de poder utilizar los endpoints (excepto los que solo muestran la lista de elementos o un elemento en específico) es necesario autenticarse en la ruta
### - api/v1/auth -
pasando como parámetros el **nombre de usuario** y su **contraseña**. Este devolverá un **token** que luego podrá ser utililado en el header **Authorization**, 
escrito de la siguiente manera: 
### Bearer token
reemplazando la palabra "token" por el token obtenido previamente

![POSTMAN ejemplo de autenticación](https://i.postimg.cc/xTGbVh9K/Auth-session.png)

## Rutas
### Personajes
#### GET api/v1/characters ##### para devolver todos los personajes
#### GET api/v1/characters/:id ##### para devolver un personaje en especifico
#### POST api/v1/characters ##### para crear un personaje con los parametros correctos (nombre, edad, peso, historia, imagen, producciones y estudios asociados)
#### PATCH api/v1/characters/:id ##### para actualizar un personaje
#### DELETE api/v1/characters ##### para eliminar un personaje

![POSTMAN colecciones para rutas de personaje](https://i.postimg.cc/fbCKWkZf/Screenshot-from-2021-10-29-15-04-19.png)
![POSTMAN colecciones para rutas de personaje](https://i.postimg.cc/pTdBmxLb/Screenshot-from-2021-10-29-15-04-32.png)
![POSTMAN colecciones para rutas de personaje](https://i.postimg.cc/3RbFp6ky/Screenshot-from-2021-10-29-15-05-56.png)

### Producciones
#### GET api/v1/productions ##### para devolver todas las producciones
#### GET api/v1/productions/:id ##### para devolver una produccion en especifico
#### POST api/v1/productions ##### para crear una produccion con los parametros correctos (titulo, imagen,fecha de estreno, puntuacion, tipo de produccion, personajes, generos y estudios asociados)
#### PATCH api/v1/productions/:id ##### para actualizar una produccion
#### DELETE api/v1/productions ##### para eliminar una produccion

![POSTMAN colecciones para rutas de producciones](https://i.postimg.cc/RVGKny2v/Screenshot-from-2021-10-29-15-07-47.png)
![POSTMAN colecciones para rutas de producciones](https://i.postimg.cc/dVxC5dqX/Screenshot-from-2021-10-29-15-08-03.png)
![POSTMAN colecciones para rutas de producciones](https://i.postimg.cc/JznJ3KWZ/Screenshot-from-2021-10-29-15-08-23.png)
![POSTMAN colecciones para rutas de producciones](https://i.postimg.cc/RVGKny2v/Screenshot-from-2021-10-29-15-07-47.png)

### Generos
#### GET api/v1/genres ##### para devolver todos los generos
#### GET api/v1/genres/:id ##### para devolver un genero en especifico
#### POST api/v1/genres ##### para crear un genero con los parametros correctos (nombre, imagen)
#### PATCH api/v1/genres/:id ##### para actualizar un genero
#### DELETE api/v1/genres ##### para eliminar un genero

![POSTMAN colecciones para rutas de generos ](https://i.postimg.cc/9f9D1ngR/Screenshot-from-2021-10-29-15-06-35.png)
![POSTMAN colecciones para rutas de generos ](https://i.postimg.cc/RFzNYL2P/Screenshot-from-2021-10-29-15-06-39.png)
![POSTMAN colecciones para rutas de generos ](https://i.postimg.cc/V6BdPb8z/Screenshot-from-2021-10-29-15-06-51.png)

### Estudios
#### GET api/v1/studios ##### para devolver todos los estudios
#### GET api/v1/studios/:id ##### para devolver un estudio en especifico
#### POST api/v1/studios ##### para crear un estudio con los parametros correctos (nombre, imagen)
#### PATCH api/v1/studios/:id ##### para actualizar un estudio
#### DELETE api/v1/studios ##### para eliminar un estudio

![POSTMAN colecciones para rutas de estudios (subiendo archivos a imgur)]()
