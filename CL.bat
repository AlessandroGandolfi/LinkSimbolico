@echo off
rem genero dei "short path" in modo che eventuali spazi nei path delle cartelle non influiscano nell'esecuzione dei comandi
set sorgente=%~s1
set destinazione=%~s2
set estensione=%3

rem gestisco eventuali parametri mancanti
set utilizzo=Utilizzo: CL.bat [sorgente] [destinazione] [filtro]
set sorgMancante=Non hai inserito la sorgente.
set destMancante=Non hai inserito la destinazione.
set estMancante=Non hai inserito il filtro dei file.
set sorgInesistente=La cartella sorgente inserita non esiste.
set destInesistente=La cartella di destinazione inserita non esiste.

rem se non è stato inserito uno dei campi visualizzo la stringa di utilizzo del file
rem exit /b chiude l'esecuzione del file bat ma non chiude il prompt dei comandi
rem controllo che sia stati inserito il campo sorgente e che esista la cartella del path inserito
if "%sorgente%"=="" echo %sorgMancante% & echo %utilizzo% & pause & exit /b
if not exist %sorgente% echo %sorgInesistente% & pause & exit /b
rem controllo che sia stati inserito il campo destinazione e che esista la cartella del path inserito
if "%destinazione%"=="" echo %destMancante% & echo %utilizzo% & pause & exit /b
if not exist %destinazione% echo %destInesistente% & pause & exit /b
rem controllo che sia stati inserito il campo filtro
if "%estensione%"=="" echo %estMancante% & echo %utilizzo% & pause & exit /b

rem /p è un parametro che specifica il percorso in cui il comando forfiles viene eseguito
rem /m è il filtro usato per prendere in considerazione file con specifiche estensioni o nomi
rem /c esegue il comando presente nella stringa che lo segue
forfiles /p %sorgente% /m %estensione% /c "cmd /c mklink "%destinazione%\@file" @path"
start %destinazione%