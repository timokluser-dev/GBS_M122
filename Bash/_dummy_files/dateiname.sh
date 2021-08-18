#!/bin/bash
# Skript:	dateiname.sh 
# Aufruf:	dateiname.sh dateiname samt Pfad
#		z.B.: ./dateiname.sh /home/vmadmin/.bash_logout 
# Beschreibung: Teilt Dateiname inkl. Pfad --> in Pfad und Dateinamen (ohne Pfad) auf 
# Autor:	D. Buclin
# Version:	1.1
# Datum: 	22.5.2018


echo "Sie haben: \"$1\" eingegeben."
echo "Der Dateiname ist: " $(basename $1)
echo "Der Pfad heisst: " $(dirname $1)

