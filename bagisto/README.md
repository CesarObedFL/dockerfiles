# ceela estilo y joyeria - ecommerce

docker-compose de la tienda [ceela-estilo-y-joyeria] que se elaboró con [bagisto] un framework laravel de ecommerce...
este repositorio docker se hizo con el propósito de desarrollar las funcionalidades y diseños especiales para esa tienda...

se hizo usando la imagen de [bagisto] oficial: [bagisto-imagen] en su última versión hasta el momento (v1.5.1)

se debe modificar la variable del environtment `USER_ID: 1003` en el archivo docker-compose.yml acorde al usuario local del sistema en ejecución


## ejecución

```
docker-compose up -d
```

[ceela-estilo-y-joyeria]:<https:ceelaestiloyjoyeria.com> 
[bagisto]: <https://devdocs.bagisto.com/1.x/introduction/>
[bagisto-imagen]: <https://hub.docker.com/r/webkul/bagisto>