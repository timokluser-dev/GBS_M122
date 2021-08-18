#!/bin/bash
# Skript:	verzweigung5.sh 
# Aufruf:	verzweigung5.sh -t oder -h 
#		z.B.: ./verzweigung5.sh -t
# Demonstriert die case-Anweisung zum Auswerten von Optionen
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

# Das erste Argument wird ausgewertet
case "$1" in
# entweder -t, -T oder -test
   -[tT]|-test)        echo "Option \"test\" aufgerufen"  ;;
   -[hH]|-help|-hilfe) echo "Option \"hilfe\" aufgerufen" ;;
   *)                  echo "($1) Unbekannte Option aufgerufen!"
esac
