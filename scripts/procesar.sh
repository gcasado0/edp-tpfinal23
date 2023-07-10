#!/bin/bash

#Se deberán recortar las imágenes a una resolución de 512*512 con alguna utilidad como imagemagick. 
#Solamente deben procesarse aquellas imágenes que tengan nombres de personas válidos. 
#Entiéndase por nombres de personas válidos a cualquier combinación de palabras
#que empiecen con un letra mayúscula y sigan por minúsculas.

if [ $# -ne 1 ]
	then
		echo "Error: Se debe ingresar el directorio del lote a procesar"
		exit 1
fi

DATASETS=$1
[ ! -e $DATASETS ] && echo "Error: El directorio del lote a procesar a no existe" && exit 2

FILTER="^[[:upper:]][[:lower:]]+(_[[:upper:]][[:lower:]]+)?"


CANTIDAD=0
for FILE in $DATASETS/*.jpg
do

  ARCHIVO=$(basename $FILE)
  if [[ $ARCHIVO =~ $FILTER ]]
  then

    echo Procesando.. $FILE
    convert $FILE -gravity center -resize 512x512+0+0 -extent 512x512 $FILE
    CANTIDAD=$(($CANTIDAD+1))
  fi

done

echo "Se procesaron $CANTIDAD imágenes del lote"