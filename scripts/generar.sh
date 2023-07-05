#!/bin/bash

CANTIDAD=$1
URL_IMAGENES=https://thispersondoesnotexist.com/
URL_NOMBRES=https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
FILE_NOMBRES=dict.csv
DATASETS=./datasets

[ $# -eq 0 ] && echo "Debe ingresar la cantidad de imagenes a descargar" && exit 1

if [ ! -e $DATASETS ]
then
	mkdir $DATASETS
fi

if [ ! -e $DATASETS/$FILE_NOMBRES ]
then
	curl $URL_NOMBRES -o $DATASETS/$FILE_NOMBRES
fi

TAMANIO_NOMBRES=$(cat $DATASETS/$FILE_NOMBRES | wc -l)

for ((i=1; i<=$CANTIDAD; i++))
do
    NUMERO=$((RANDOM%$TAMANIO_NOMBRES+1))	
	NOMBRE=$(awk 'BEGIN { FS = ","} { print $1 }' $DATASETS/$FILE_NOMBRES  | tail -$NUMERO | head -1 | tr " " "_")
	ARCHIVO="$NOMBRE.jpg"

	curl $URL_IMAGENES -o $DATASETS/$ARCHIVO
	sleep 3 
done
if [ $CANTIDAD -gt 0 ]
then
	tar -zcvf $DATASETS/imagenes.tar.gz $DATASETS/*.jpg	
	sha256sum $DATASETS/imagenes.tar.gz | awk '{ print $1 }' > $DATASETS/imagenes.tar.gz.sha256
	#rm $DATASETS/*.jpg
fi
