#!/bin/bash
# Skript:	verzweigung4.sh 
# Aufruf:	verzweigung4.sh Benutzername 
#		z.B.: ./verzweigung4.sh 
# Demonstriert die case-Anweisung
# Autor:	J. Wolf
# Version:	1.1
# Datum: 	22.5.2018

# %a gibt die länderspezifische Abkürzung des Wochentages wieder (z.B. Son)
tag=`date +%a`
case "$tag" in
# mit | werden 2 alternative Vergleichsmuster geprüft 
  Mon|Don)   echo "Mo+Do : Backup Datenbank machen" ;;
  Die|Fre)   echo "Di+Fr : Backup Rechner Saurus"   ;;
  Mit|Sam)   echo "Mi : Backup Rechner Home"     ;;
  Son)   echo "So : Sämtliche Backups auf NAS sichern" ;;
esac

