@echo off
set sorgente=%1
set destinazione=%2
set file=%3
rem /P è un parametro che specifica il percorso in cui il comando forfiles viene eseguito
rem /M è il filtro usato per prendere in considerazione file con specifiche estensioni o nomi
rem /C esegue il comando presente nella stringa che lo segue
forfiles /P "%sorgente%" /M %file% /C "cmd /c mklink \"%destinazione%\@file\" @path"
start %destinazione%
pause