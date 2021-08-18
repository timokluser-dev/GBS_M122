#!/bin/bash
# Skript:	ifmitelif.sh 
# Aufruf:	ifmitelif.sh <zahl> 
#		z.B.: ./ifmitelif.sh 9
# Demonstriert eine Verzweigung mit elif
# Autor:	D. Jenny
# Version:	1
# Datum: 	28.9.2020 

if [ $1 -gt 10 ]
then
   echo "Die Zahl $1 ist > 10."

   elif [ $1 -eq 10 ] 
   then
      echo "Die Zahl $1 = 10."
   else 
      echo "Die Zahl $1 ist < 10."

fi
# Details siehe man bash | Suchen nach elif 

