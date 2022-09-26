#!/bin/bash

nombre=$1

read -p "Indique un usuario: " nombre

if [ -z "$nombre" ]
then
        echo "Debe especificar un usuario"
        exit 1
fi

if id "$nombre" >/dev/null 2>&1; 
then
	user=$(grep $nombre /etc/passwd | cut -d ':' -f 1)
        id1=$(grep $nombre /etc/passwd | cut -d ':' -f 3)
        id2=$(grep $nombre /etc/passwd | cut -d ':' -f 4)
        home=$(grep $nombre /etc/passwd | cut -d ':' -f 6)
        shell=$(grep $nombre /etc/passwd | cut -d ':' -f 7)

        echo "Nombre: $user"
        echo "UID: $id1"
        echo "GID: $id2"
        echo "Home: $home"
        echo "Shell: $shell"

else
	echo "El usuario $nombre no existe"
        exit 1


fi
