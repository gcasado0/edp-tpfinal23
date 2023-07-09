#!/bin/bash

opciones=("salir" "generar" "descomprimir" "procesar" "comprimir")


PS3='Elija> '


select opcion in "${opciones[@]}";

do

	case $opcion in

		"salir")
		    echo "Elegiste salir"
		    echo "Hasta luego"
		    break;;

		"generar")
		    echo "Elegiste generar un lote de 5 imágenes"
		    bash scripts/generar.sh 5
			;;

		"descomprimir")
		    echo "Elegiste descomprimir un lote de imágenes"
		    bash scripts/descomprimir.sh ./datasets/generar/imagenes.tar.gz ./datasets/generar/imagenes.sha256
			;;

		"procesar")
		    echo "Elegiste procesar un lote de imágenes"      
		    bash scripts/procesar.sh ./datasets/descomprimir
			;;

		"comprimir")
		    echo "Elegiste comprimir un lote de imágenes"       
		    bash scripts/comprimir.sh ./datasets/descomprimir
			;;

		*) 
		    echo "Opción inválida, vuelve a intentarlo.."
	      	continue
			;;

	esac

done

exit 0





