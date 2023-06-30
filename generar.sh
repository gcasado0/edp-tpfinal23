
#!/bin/bash
CANTIDAD=$1

for ((i=1; i<=$CANTIDAD; i++))
do
        NUMERO=$((RANDOM%1000+1))	
	NOMBRE=$(awk 'BEGIN { FS = ","} { print $1 | "sort" }' dict.csv  | tail -$NUMERO | head -1 | tr " " "_")
	ARCHIVO="$NOMBRE.jpg"

	curl https://source.unsplash.com/random/900%C3%97700/?person -L -o $ARCHIVO
	sleep 5 
done
tar -zcvf imagenes.tar ./*.jpg
sha256sum imagenes.tar > checksum.txt
