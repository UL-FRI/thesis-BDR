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
if NOT exist overleaf\* {
  mkdir overleaf/
} else {
  rm -f overleaf/%p%.zip
}

zip -r overleaf/%p%.zip ./README.md
zip -r overleaf/%p%.zip ./fonts/*
zip -r overleaf/%p%.zip ./mt-*.cfg
zip -r overleaf/%p%.zip ./cc/*
zip -r overleaf/%p%.zip ./FRIteza.bst
zip -r overleaf/%p%.zip ./FRIteza.cls
zip -r overleaf/%p%.zip ./bk9.clo

cd %1
zip -r ../overleaf/%p%.zip ./* -x ./int/* -x ./out/* -x ./.*
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

