#!/bin/bash
#David Garcia
echo "resolv.sh: copias de seguretat de resolv.conf"
echo
if (( $# == 1 ))
then
	if [[ ! -d /root/$1 ]]
	then
		echo -n "El subdirectorio no existe, Quierers crearlo (s/n)?: "
		read opc
		if [[ $opc != "s" ]] && [[ $opc != "S" ]]
		then
			echo $opc
			echo "No se ha creado el subdirectorio"
			exit 1
		else
			mkdir /root/$1
		fi
	fi
else
	echo "Falta un parametro. El parametro ha de ser un directorio en la raiz /root"
	exit 2
fi
nom_backup=/root/$1/resolv.conf.backup.$(date +"%Y%m%d%H%M")
cp /etc/resolv.conf $nom_backup 
gzip $nom_backup
exit 0
