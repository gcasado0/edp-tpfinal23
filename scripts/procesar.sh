#!/bin/bash
#Se deberán recortar las imágenes a una resolución de 512*512 con alguna utilidad como imagemagick. 
#Solamente deben procesarse aquellas imágenes que tengan nombres de personas válidos. 
#Entiéndase por nombres de personas válidos a cualquier combinación de palabras
#que empiecen con un letra mayúscula y sigan por minúsculas.

#sudo apt install imagemagick


DATASETS=$1
FILTER="^[[:upper:]][[:lower:]]+(_[[:upper:]][[:lower:]]+)?"

for FILE in $DATASETS/*.jpg
do

  ARCHIVO=$(basename $FILE)
  if [[ $ARCHIVO =~ $FILTER ]]
  then

    echo Procesando.. $FILE
    convert $FILE -gravity center -resize 512x512+0+0 -extent 512x512 $FILE
    
  fi

done