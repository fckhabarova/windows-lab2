@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Ошибка: Укажите имя каталога
    echo Пример: %0 C:\Test
    exit /b 1
)

set "target=%~1"

if not exist "%target%\" (
    echo Ошибка: Каталог "%target%" не найден
    exit /b 1
)

set count=0

for /f "delims=" %%d in ('dir /b /s /ad "%target%\User*" 2^>nul') do (
    set /a count+=1
)

echo Количество подкаталогов, начинающихся с "User": %count%
endlocal