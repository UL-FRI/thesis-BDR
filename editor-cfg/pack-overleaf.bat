@echo off

:: check arguments
set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% LSS 1 goto usage-arg
if %argC% GTR 1 goto usage

:: set name of package, remove trailing slash if necessary 
SET p=%1
if %p:~-1%==\ SET p=%p:~0,-1%

:: check <directory> exists
if NOT exist %p%\* { 
    echo No directory named '%p%' exists. Nothing to pack.
    echo.
    exit 2
}

:: pack
rm -f %p%.zip

zip -r %p%.zip ./README.md
zip -r %p%.zip ./fonts/*
zip -r %p%.zip ./mt-*.cfg
zip -r %p%.zip ./cc/*
zip -r %p%.zip ./FRIteza.bst
zip -r %p%.zip ./FRIteza.cls
zip -r %p%.zip ./bk9.clo

cd %1
zip -r ../%p%.zip ./* -x ./int/* -x ./out/* -x ./.*
cd ..
exit /b

:usage-arg
echo Argument is missing, specify directory to pack
:usage
echo. 
echo Usage: pack-overleaf ^<directory^>
echo.
echo       ^<directory^>    Pack directory for overleaf. 
echo                      All necessary files will be included.
echo.
exit /b 1 

