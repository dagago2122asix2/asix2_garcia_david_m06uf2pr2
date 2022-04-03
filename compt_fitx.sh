#!/bin/bash
#David Garcia

local ficher

echo "Introducir directorio origen: "
read dir1

for fitxer in $1/*
do
	if [[ -s $fitxer ]] && [[ -x $fitxer ]]
	then
		tar -cvf $dir1.tar $dir1
	fi
done
#tar -cvf $dir1.tar $dir1

echo "Introduce el destino del archivo: "
read dir2

cp -rf $dir1.tar $dir2

exit 1
