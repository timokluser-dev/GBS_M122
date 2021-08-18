#!/bin/bash
# Skript:	verzweigung3.sh 
# Aufruf:	verzweigung3.sh Benutzername 
#		z.B.: ./verzweigung3.sh vmuser
# Demonstriert eine Verzweigung mit if und else
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

# Benutzer in /etc/passwd suchen ...
if grep "^$1" /etc/passwd > /dev/null
then
   # grep erfolgreich
   echo "User $1 ist bekannt auf dem System"
else
   # grep erfolglos
   echo "User $1 gibt es hier nicht"
fi
