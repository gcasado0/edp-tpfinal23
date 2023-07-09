#!/bin/bash

CANTIDAD=$1
URL_IMAGENES=https://thispersondoesnotexist.com/
URL_NOMBRES=https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
FILE_NOMBRES=dict.csv
DATASETS=./datasets
SALIDA=$DATASETS/generar


[ $# -eq 0 ] && echo "Debe ingresar la cantidad de imagenes a descargar" && exit 1

if [ -e $SALIDA ]
then #Limpieza de directorio de trabajo
	rm -f $SALIDA/*.jpg
	rm -f $SALIDA/imagenes.tar.gz
	rm -f $SALIDA/imagenes.sha256
else #Creo el directorio
	mkdir -p $SALIDA
fi

if [ ! -e $SALIDA/$FILE_NOMBRES ]
then
	curl $URL_NOMBRES -o $SALIDA/$FILE_NOMBRES
fi

TAMANIO_NOMBRES=$(cat $SALIDA/$FILE_NOMBRES | wc -l)

for ((i=1; i<=$CANTIDAD; i++))
do
    NUMERO=$((RANDOM%$TAMANIO_NOMBRES+1))	
	NOMBRE=$(awk 'BEGIN { FS = ","} { print $1 }' $SALIDA/$FILE_NOMBRES  | tail -$NUMERO | head -1 | tr " " "_")
	ARCHIVO="$NOMBRE.jpg"

	curl $URL_IMAGENES -o $SALIDA/$ARCHIVO
	sleep 3 
done
if [ $CANTIDAD -gt 0 ]
then
	cd $SALIDA #Me muevo al directorio para no guardar la estructura de directorios en el tar.gz
	tar -zcvf ./imagenes.tar.gz *.jpg
	sha256sum ./imagenes.tar.gz | awk '{ print $1 }' > ./imagenes.sha256
	#rm $DATASETS/*.jpg
fi
