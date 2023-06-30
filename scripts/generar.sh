
#!/bin/bash
CANTIDAD=$1
URL_IMAGENES=https://thispersondoesnotexist.com/
URL_NOMBRES=https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
#URL_NOMBRES=https://source.unsplash.com/random/900%C3%97700/?person -L
FILE_NOMBRES=dict.csv
DATASETS=./datasets

[ $# -eq 0 ] && echo "Debe ingresar la cantidad de imagenes a descargar" && exit 1

if [ ! -e $DATASETS/$FILE_NOMBRES ]
then
	curl $URL_NOMBRES -o $DATASETS/$FILE_NOMBRES
fi

for ((i=1; i<=$CANTIDAD; i++))
do
    NUMERO=$((RANDOM%10000+1))	
	NOMBRE=$(awk 'BEGIN { FS = ","} { print $1 | "sort" }' $DATASETS/$FILE_NOMBRES  | tail -$NUMERO | head -1 | tr " " "_")
	ARCHIVO="$NOMBRE.jpg"

	curl $URL_IMAGENES -o $DATASETS/$ARCHIVO
	sleep 3 
done
if [ $CANTIDAD -gt 0 ]
then
	tar -zcvf $DATASETS/imagenes.tar $DATASETS/*.jpg	
	sha256sum $DATASETS/imagenes.tar > $DATASETS/imagenes.tar.sha256
	#rm $DATASETS/*.jpg
fi
