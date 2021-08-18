#!/bin/bash
# Skript:	ifohneelif.sh 
# Aufruf:	ifohneelif.sh <zahl> 
#		z.B.: ./ifohneelif.sh 9
# Demonstriert eine Verzweigung ohne elif
# Autor:	D. Jenny
# Version:	1
# Datum: 	28.9.2020 

if [ $1 -gt 10 ]
then
   echo "Die Zahl $1 ist > 10."
else

   if [ $1 -eq 10 ]
   then
      echo "Die Zahl $1 = 10."
   else
      echo "Die Zahl $1 ist > 10."
   fi

fi

