@echo off

set sqlIp=127.0.0.1
set username=root 
set password=
set database=community_restore
set dbBackupfolder=community_portal-backup

set databaseSql=community_portal-05-03-2024-21-36-50-81.sql

if [%password%]==[] (mysql -h %sqlIp% -u %username% %database% < %cd%\%dbBackupfolder%\%databaseSql%) else (mysql -h %sqlIp% -u %username% -p %password% %database% < %cd%\%dbBackupfolder%\%databaseSql%)

if %ERRORLEVEL% NEQ 0 ( echo Database restore failed ) else ( echo Database restore successfully )