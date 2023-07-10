#!/bin/bash

opciones=("Generar" "Descomprimir" "Procesar" "Comprimir" "Salir")


PS3='Elija> '


select opcion in "${opciones[@]}";

do

	case $opcion in

		"Salir")
		    echo "Elegiste salir"
		    echo "Hasta luego"
		    break;;

		"Generar")
		    echo "Elegiste generar un lote de 5 imágenes"
		    bash scripts/generar.sh 5
			;;

		"Descomprimir")
		    echo "Elegiste descomprimir un lote de imágenes"
		    bash scripts/descomprimir.sh ./datasets/generar/imagenes.tar.gz ./datasets/generar/imagenes.sha256
			;;

		"Procesar")
		    echo "Elegiste procesar un lote de imágenes"      
		    bash scripts/procesar.sh ./datasets/descomprimir
			;;

		"Comprimir")
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





