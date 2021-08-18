#!/bin/bash
# Skript:	verzweigung6.sh 
# Aufruf:	verzweigung6.sh <Argument1> <Argument2>
#		z.B.: ./verzweigung6.sh a xyz
# Überprüft die richtige Anzahl von Argumenten in der Kommandozeile
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

if [ $# -ne 2 ]
then
   echo "Hier sind 2 Argumente erforderlich"
   echo "usage: $0 arg1 arg2"
   exit 1
else
   echo "Erforderliche Anzahl Argumente erhalten"
fi
