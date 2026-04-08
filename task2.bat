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

echo Список файлов размером меньше 1 Кб:

for /f "delims=" %%f in ('dir /b /s /a-d "%target%" 2^>nul') do (
    if %%~zf LSS 1024 (
        echo %%~ff
        set /a count+=1
    )
)

echo Всего найдено: %count% файлов
endlocal