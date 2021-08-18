#!/bin/bash
# Programm:	13C.sh
# Aufruf:	13C.sh 
# Demoprogramm fuer das Erstellen von Shell-Skripten
# Autor:	D. Buclin
# Version:	1.1
# Datum: 	22.5.2006

# Variante 1: Mit "echo" und "read"
echo "Bitte eine Zahl eingeben:"
read Antwort                              # ohne $ 

echo $Antwort

# Variante 2: Nur mit "read"
read -p "Erste Zahl eingeben: " zahl1
read -p "Zweite Zahl eingeben: " zahl2

echo $((zahl1 * zahl2))

