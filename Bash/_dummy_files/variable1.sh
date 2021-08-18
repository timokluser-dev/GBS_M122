#!/bin/bash
# Programm:	variable1.sh 
# Aufruf:	variable1.sh 
# Demoprogramm fuer das Erstellen von Shell-Skripten
# Autor:	D. Buclin
# Version:	1.1
# Datum:	22.5.2018

# Zuweisung von Shell-Variablen
a="Gruezi "        # die Variable, die einen neuen Wert erhält, wird ohne $ geschrieben
b="miteinander"
zaehler=10

echo $a
echo $b
echo $a $b
echo ${a}
echo ${b}

echo $zaehler + 2

