#!/bin/bash
# Skript:	schleife3.sh 
# Aufruf:	schleife3.sh 
#		Text1
#		ende
# Demonstriert die Verwendung einer while-Schleife mit Benutzereingabe
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

while [ "$input" != "ende" ]
do
  # eventuell Befehle zum Abarbeiten hierhin ...
  echo "Weiter mit ENTER oder aufhören mit ende"
  read input
done
echo "Das Ende ist erreicht"

