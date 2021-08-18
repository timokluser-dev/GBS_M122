#!/bin/bash
# Skript:	schleife1.sh 
# Aufruf:	schleife1.sh Text1 Text2 ...
#		z.B.: ./schleife1.sh Grüezi alle zusammen!
# Demonstriert die Verwendung von for 
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

[ $# -lt 1 ] && echo "Mindestens ein Argument" && exit 1
# Schleife1: Liste von Argumenten aus einer Zeichenkette $*
# werden in einem Array gespeichert
array=( $* )
for((i=0; i<$#; i++))
do
   echo "Argument $i ist ${array[$i]}"
done
# Schleife2: Countdown von 5 auf 0 mit 1s Wartezeit dazwischen
for((i=5; i>0; i--))
do
   echo $i
   sleep 1   # Eine Sekunde anhalten
done
echo "...go"
# Schleife3: Auch andere arithmetische Ausdrücke als Zähler möglich
for((i=100; i>0; ((i=i/2)) ))
do
   echo $i
done

