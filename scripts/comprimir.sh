#!/bin/bash

#Finalmente, luego de procesadas las imágenes, se debe:
#– generar un archivo con la lista de nombres de todas las imágenes.
#– generar un archivo con la lista de nombres válidos.
#– generar un archivo con el total de personas cuyo nombre finaliza con
#la letra a.
#– por último, generar un archivo comprimido que incluya los archivos
#generados en los items anteriores y todas las imágenes. El archivo
#comprimido debe poder accederse desde fuera del contenedor.

ORIGEN=./datasets/descomprimir
SALIDA=./datasets/comprimir
mkdir -p $SALIDA

FILTER="^[[:upper:]][[:lower:]]+(_[[:upper:]][[:lower:]]+)?"

ARCHIVO1=$ORIGEN/listado_completo.txt
ARCHIVO2=$ORIGEN/listado_nombres_validos.txt
ARCHIVO3=$ORIGEN/total_personas_letra_a.txt


#Creo los archivos de salida
> $ARCHIVO1
> $ARCHIVO2

for FILE in $ORIGEN/*.jpg
do
  echo $FILE
  NOMBRE=$(basename $FILE)
  echo $NOMBRE >> $ARCHIVO1

  if [[ $NOMBRE =~ $FILTER ]]
  then
    echo $NOMBRE >> $ARCHIVO2
  fi
done

#genero el tercer archivo
ls -1 $ORIGEN | grep ".*a\.jpg$" | wc -l > $ARCHIVO3

#genero un archivo comprimido
tar -C $ORIGEN -zcvf $SALIDA/dataset.tar.gz .
sha256sum $SALIDA/dataset.tar.gz | awk '{ print $1 }' > $SALIDA/dataset.sha256