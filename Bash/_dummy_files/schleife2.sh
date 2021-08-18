#!/bin/bash
# Skript:	schleife2.sh 
# Aufruf:	schleife2.sh <Datei1> <Datei2> ... <DateiN>
# Demonstriert die Verwendung von for mit Argumenten
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

for datei in "$@"
do
   [ -f $datei ] && echo "$datei: Reguläre Datei"
   [ -d $datei ] && echo "$datei: Verzeichnis"
   [ ! -e $datei ] && echo "$datei: existiert nicht"
done
