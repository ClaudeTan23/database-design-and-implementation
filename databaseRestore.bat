@echo off

set sqlIp=127.0.0.1
set username=root 
set password=
set database=freelancer_portal

set databaseSql=freelancer_portal.sql

if [%password%]==[] (mysql -h %sqlIp% -u %username% %database% < %cd%\%databaseSql%) else (mysql -h %sqlIp% -u %username% -p %password% %database% < %cd%\%databaseSql%)

if %ERRORLEVEL% NEQ 0 ( echo Database restore failed ) else ( echo Database restore successfully )


SET /p key=Type any key to exit...