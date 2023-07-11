# Trabajo Práctico Entorno 2023 - TUIA

## Integrantes

- Marisa Silvina Zappala

- Gustavo Alberto Casado

## Qué hace?

Este proyecto permite generar un lote de imágenes de personas y generar un archivo comprimido con ellas, procesar algunas de esas imágenes y cambiarles el tamaño a 512x512, y finalmente generar un lote final con las imágenes obtenidas junto con archivos de datos sobre las imágenes contenidas.

## Cómo se corre?

### Prerequisitos

- Tener instalado docker
- Acceso a internet

### Pasos

```
1. Crear directorio de trabajo (opcional)
(no es necesario crearlo salvo para que quede como dueño el usuario logueado en vez de root)

    mkdir datasets 

2. Para correr el proyecto:

    - Crear la imagen de docker
        
        docker build -t tp-entorno . 
    
    - Ejecutar el contenedor
        
        docker run -it -v ./datasets:/app/datasets tp-entorno

```

#### docker-compose

Bring up docker compose containers:
```
$ docker compose up
[...]
```

On a different terminal, attach the container:
```
$ docker attach gcasado0-edp-tpfinal23git-tp-entorno-1
# You are now inside the menu. Type something!
```
