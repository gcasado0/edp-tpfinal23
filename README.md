# Trabajo Práctico Entorno 2023 - TUIA

## Integrantes

Marisa Silvina Zappala
Gustavo Alberto Casado

## Qué hace?

Este proyecto permite generar un lote de imágenes de personas y generar un archivo comprimido con ellas, procesar algunas de esas imágenes y cambiarles el tamaño a 512x512, y finalmente generar un lote final con las imágenes obtenidas junto con archivos de datos sobre las imágenes contenidas.

## Cómo se corre?

```
1- Crear directorio de trabajo (opcional)
(no es necesario crearlo salvo para que quede como dueño el usuario logueado en vez de root)

    mkdir datasets 

2- Dos opciones para correr el proyecto:

A- La primera:
    docker build -t tp-entorno .
    docker run -it -v ./datasets:/app/datasets tp-entorno

B- La segunda:
    docker compose up
```
