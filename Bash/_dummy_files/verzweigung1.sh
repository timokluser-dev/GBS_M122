#!/bin/bash
# Skript:	verzweigung1.sh 
# Aufruf:	verzweigung1.sh Benutzername 
#		z.B.: ./verzweigung1.sh vmuser
# Demonstriert eine Verzweigung mit if
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

# Benutzer in /etc/passwd suchen ...
# mit 1> wird die Ausgabe der gefundenen Zeile durch grep unterdrückt
if grep "^$1" /etc/passwd 1> /dev/null 
then
   # Ja, grep war erfolgreich
   echo "User $1 ist bekannt auf dem System"
   exit 0;  # Erfolgreich beenden ...
fi
# Angegebener User scheint hier nicht vorhanden zu sein ...
echo "User $1 gibt es hier nicht"

