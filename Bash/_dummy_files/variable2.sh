#!/bin/bash
# Programm:	variable2.sh
# Aufruf:	variable2.sh
# Demoprogramm fuer das Erstellen von Shell-Skripten
# Autor:	D. Buclin
# Version:	1.1
# Datum: 	22.5.2018

echo

x=10                       # ohne $ 
echo `expr $x + 1`
echo `expr $x - 1`
echo `expr $x \* 2`
echo `expr $x / 2`
echo

x=20
echo $(expr $x + 1)
echo $(expr $x - 1)
echo $(expr $x \* 2)
echo $(expr $x / 2)
echo

y=30
echo $((y + 1))
echo $((y - 1))
echo $((y * 2))
echo $((y / 2))
echo

y=40
echo $[y + 1]
echo $[y - 1]
echo $[y * 2]
echo $[y / 2]
echo

