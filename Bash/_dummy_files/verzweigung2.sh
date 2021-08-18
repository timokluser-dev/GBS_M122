#!/bin/bash
# Skript:	verzweigung2.sh 
# Aufruf:	verzweigung2.sh Benutzername 
#		z.B.: ./verzweigung2.sh vmuser
# Demonstriert eine test-Verzweigung mit if
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

# Benutzer in /etc/passwd suchen ...
grep "^$1" /etc/passwd > /dev/null
# Ist der Exit-Status in $? nicht gleich (not equal) 0 ...
if [ $? -ne 0 ]
   then
   echo "Die Ausführung von grep ist fehlgeschlagen"
   echo "Vermutlich existiert User $1 hier nicht"
   exit 1  # Erfolglos beenden
fi
# grep erfolgreich
echo "User $1 ist bekannt auf dem System"
