@echo off
rem genero dei "short path" in modo che eventuali spazi nei path delle cartelle non influiscano nell'esecuzione dei comandi
set sorgente=%~s1
set destinazione=%~s2
set estensione=%3

rem /P è un parametro che specifica il percorso in cui il comando forfiles viene eseguito
rem /M è il filtro usato per prendere in considerazione file con specifiche estensioni o nomi
rem /C esegue il comando presente nella stringa che lo segue
forfiles /P %sorgente% /M %estensione% /C "cmd /c mklink "%destinazione%\@file" @path"

start %destinazione%
pause