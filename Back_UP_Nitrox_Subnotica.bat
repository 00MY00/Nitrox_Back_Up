@echo off
rem #########################
rem # Crée par Kuroakashiro #
rem #########################

title Subnotica Back UP creation
set back=%~dp0
chcp 65001
mode con cols=80 lines=25
prompt --^> 
rem ----------------------------------------------------------
date /t>dat.txt
time /t>tim.txt
rem ----------------------------------------------------------
Setlocal EnableDelayedExpansion
for /F %%i IN (%back%dat.txt) DO (
	set t=%%i
	set t=!t!
	set t=!t: =-!
	set t=!t::=-!
	echo !t!>dat.txt
)
rem ----------------------------------------------------------
Setlocal EnableDelayedExpansion
for /F %%i IN (%back%tim.txt) DO (
	set t=%%i
	set t=!t!
	set t=!t: =-!
	set t=!t::=-!
	echo !t!>tim.txt
)

set /p tim=<tim.txt
set /p dat=<dat.txt
rem ----------------------------------------------------------
if exist "%back%dat.txt" del "%back%dat.txt"
if exist "%back%tim.txt" del "%back%tim.txt"
rem ----------------------------------------------------------
:start
if not exist "%back%Backup_location.txt" goto ou
set /p rep=<Backup_location.txt
rem ----------------------------------------------------------
if not exist "%rep%Kuro_BackupNitrox" mkdir "%rep%Kuro_BackupNitrox"
if %errorlevel% == 0 echo [[40;32mOK[40;00m] repertoir 'Kuro_BackupNitrox' crée
rem ----------------------------------------------------------
if not exist "%rep%Kuro_BackupNitrox\%dat%" mkdir "%rep%Kuro_BackupNitrox\%dat%"
if %errorlevel% == 0 echo [[40;32mOK[40;00m] repertoir '%dat%' crée
rem ----------------------------------------------------------
if not exist "%rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%" mkdir "%rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%"
if %errorlevel% == 0 echo [[40;32mOK[40;00m] repertoir 'Back_UP_Subnotica_%tim%' crée
rem ----------------------------------------------------------
if not exist "%rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%\world" mkdir "%rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%\world"
if %errorlevel% == 0 echo [[40;32mOK[40;00m] repertoir 'world' crée
rem ----------------------------------------------------------
xcopy /y "%back%world\*.*" "%rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%\world"
if %errorlevel% == 0 echo [[40;32mOK[40;00m] Copy réusit
rem ----------------------------------------------------------
xcopy /y "%back%server.cfg" "%rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%"
if %errorlevel% == 0 echo [[40;32mOK[40;00m] Copy réusit
rem ----------------------------------------------------------
explorer %rep%Kuro_BackupNitrox\%dat%\Back_UP_Subnotica_%tim%\
echo.[40;30m
timeout /t 5

exit
rem End
:ou
echo. 
echo. 
echo quelle est l'endroi ou les backup s'enregistreron ?
echo EXEMPLE : c:\user\
echo.
echo.
set user=0
set /p user=

if %user% == 0 goto ou
if not exist "%user%" goto ou
if exist "%user%" echo %user%> "Backup_location.txt"
goto start



