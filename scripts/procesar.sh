#Se deberán recortar las imágenes a una resolución de 512*512 con alguna utilidad como imagemagick. 
#Solamente deben procesarse aquellas imágenes que tengan nombres de personas válidos. 
#Entiéndase por nombres de personas válidos a cualquier combinación de palabras
#que empiecen con un letra mayúscula y sigan por minúsculas.

DATASETS=./datasets

convert $DATASETS/Victor_Alfredo.jpg -gravity center -resize 512x512+0+0 -extent 512x512 $DATASETS/Victor_Alfredo_512.jpg

