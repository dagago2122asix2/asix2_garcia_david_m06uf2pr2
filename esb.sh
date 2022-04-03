#!/bin/bash
#David Garcia
clear
echo "PROGRAMA esb.sh"
echo "#"
case $1 in 
	-e) if (( $# != 3 ))
		then
			echo "Nombre del parametro incorrecto"
			echo "La opcion -e necesita 3 parametro"
			echo "La primera opcion es -e"
			echo "La segunda opción es la extención de los ficheros a enviar a la papelera"
			echo "La tercera opcion es el directorio donde se enceuntran los ficheros que iran a la papelera"
			exit 2
		fi
		if [[ ! -d ~/trash ]]
		then
			mkdir ~/trash
		fi
		if [[ ! -d $3 ]]
		then
			echo "La carpeta no existeix"
		else
			if [[ $(ls -A $3/*.$2 2> /dev/null | wc -l) -ne 0 ]]
			then
				mv $3/*.$2 ~/trash
				echo "Ficheros enviados a la papelera"
			else
				echo "Los ficheros con la extension designada no existen"
			fi
		 fi
		 ;;	 
	-r) if (( $# != 1 )) 
		then
			echo "Parametros Incorrectos"
			echo "Opcion -r no necesita mas parametros"
			exit 1
		fi
		if [[ ! -d ~/trash ]]
		then
			echo "Papelera no existe"
		else
			if [[ $(ls -A ~/trash | wc -l) -ne 0 ]]
			then
				rm ~/trash/* 
				echo "Papelera vacia"
			else
				echo "Papelera esta vacia"  
			fi
		fi
		;;	
	*)  echo "Primer parametro incorrecto"
	    echo "Utilización: "
	    echo "-r para vaciar la papelera"
	    echo "-e para enviar ficheros a la papelera"
	    exit 3
	    ;;
esac
exit 0
