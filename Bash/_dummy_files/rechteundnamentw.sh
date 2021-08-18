#!/bin/bash
# Programm: rechteundnamen.sh
# Aufruf: quadrat.sh
# Parametereingabe bei Aufruf: Verzeichnisname
# Aufruf: ./rechteundnamen.sh <Verzeichnisname, z.B. /home/student1>
# Beschreibung: zeigt Zugriffsrechte und Dateinamen an 
# Autor: D. Jenny
# Version: 1.0
# Datum: 19.5.2018

y=$(cat telefonliste.txt | grep -c Frau) 
echo $y                                           #  5 wird angezeigt
echo $(( $y + 20 ))                               # 25 wird angezeigt

