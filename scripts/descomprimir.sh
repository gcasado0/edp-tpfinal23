#!/bin/bash

DESTINO_IMAGENES=./datasets/descomprimir
if [ -e $DESTINO_IMAGENES ]
then #Limpieza de directorio de trabajo
  rm -f $DESTINO_IMAGENES/*
else #Creo el directorio
  mkdir -p $DESTINO_IMAGENES
fi

#Limpieza de directorio de trabajo
rm -f $DESTINO_IMAGENES/*

if [ $# -ne 2 ];
	then
		echo "Error: Se deben ingresar 2 argumentos"
		exit 1
fi

ARCHIVO_IMAGENES=$1
ARCHIVO_CHECKSUM=$2

CHECKSUM_ORIGEN=$(cat $ARCHIVO_CHECKSUM)
CHECKSUM_ESPERADA=$(sha256sum $ARCHIVO_IMAGENES | awk '{print $1}')
	
if [[ "$CHECKSUM_ESPERADA" == "$CHECKSUM_ORIGEN" ]];

	then
		echo "Las sumas de chequeo coinciden"
		tar -xf $ARCHIVO_IMAGENES -C $DESTINO_IMAGENES
	else
		echo "Error: Las sumas de chequeo no coinciden"
		exit 2
fi

