#!/bin/bash

DESTINO_IMAGENES=./datasets/imagenes
mkdir -p $DESTINO_IMAGENES



if [$# -ne 2];
	then
		echo "Cantidad de archivos como argumentos incorrectos"
		exit 1
fi

ARCHIVO_IMAGENES=./datasets/imagenes.tar
ARCHIVO_CHECKSUM=./datasets/imagenes.tar.sha256

CHECKSUM_ORIGEN=$(cat $ARCHIVO_CHECKSUM)
CHECKSUM_ESPERADA=$(sha256sum $ARCHIVO_IMAGENES | awk '{print $1}')
	
if [[ "$CHECKSUM_ESPERADA" == "$CHECKSUM_ORIGEN" ]];

	then
		echo "Las sumas de chequeo coinciden"
		tar -xf $ARCHIVO_IMAGENES -C $DESTINO_IMAGENES
	else
		echo "Hay error en la descarga"

fi

