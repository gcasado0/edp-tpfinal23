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
		      echo "Elegiste generar un archivo"
	     	      echo "Recuerda ingresar cant de imagenes"	      
		      bash generar.sh;;

		"descomprimir")
		      echo "Elegiste descomprimir un archivo"	      
		      bash descomprimir.sh ./datasets/generar/imagenes.tar.gz ./datasets/generar/imagenes.sha256;;

		"procesar")
		      echo "Elegiste procesar un archivo"	      
		      bash procesar.sh ./datasets/descomprimir;;

		"comprimir")
		      echo "Elegiste comprimir"       
		      bash comprimir.sh ./datasets/descomprimir;;

		*) 
		      echo "Opcion invalida, vuelve a intentarlo"
	      	      continue;;	      

	esac

done

exit 0





