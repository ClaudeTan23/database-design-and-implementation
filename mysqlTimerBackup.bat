@echo off

:repeat
set /A duration=(60 * 60) * 6

setlocal 
set sqlIp=127.0.0.1
set username=root 
set password=
set database=community_portal
set folder=%database%-backup
set logFolder=%database%-log

set time=%TIME%
set currentTime=%time:.=-%
set currentTime=%currentTime::=-%

set dateTime=%DATE:/=-%-%currentTime::=-%
set currentDateTime=%dateTime:~4%

if not exist %cd%\%folder% mkdir %folder%

if not exist %cd%\%logFolder% mkdir %logFolder%

if [%password%]==[] (mysqldump --routines --events -h %sqlIp% -u %username% %database% > %cd%\%folder%\%database%-%currentDateTime%.sql) else (mysqldump --routines --events -h %sqlIp% -u %username% -p %password% %database% > %cd%\%folder%\%database%-%currentDateTime%.sql)

if %ERRORLEVEL% NEQ 0 ( echo Database backup failed %DATE% %TIME% >> %logFolder%\%database%-log.txt) else ( echo Database %cd%\%database%-%currentDateTime%.sql have been successfully backup %DATE% %TIME% >> %logFolder%\%database%-log.txt) 

endlocal

timeout /t %duration% /nobreak
goto repeat

