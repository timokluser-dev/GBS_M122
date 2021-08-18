#!/bin/bash
# Skript:	verzweigung7.sh 
# Aufruf:	verzweigung7.sh 
# Demonstriert Dateioperatoren und die logische UND-Verknüpfung
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

# FALSCH wäre das: file = "verzweigung7.txt"
file="verzweigung7.txt"
touch $file
# Eine Datei anlegen
# Ist die Daten vorhanden und ist sie beschreibbar? 
if [ -f $file ] && [ -w $file ]

then
   echo "Datei $file ist eine reguläre Datei und beschreibbar"
fi

rm -f $file


