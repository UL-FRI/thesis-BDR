@echo off

if [%~1]==[] (
	echo Argument is missing, specify directory to pack
	echo. 
	echo Usage: pack-overleaf ^<directory^>
	echo.
	echo       ^<directory^>                         Pack directory for overleaf. All necessary files will be included.
	echo.
	exit /b 1 
)
if not exist %1 goto error

rm -f overleaf.zip

zip -r overleaf.zip ./README.md
zip -r overleaf.zip ./fonts/*
zip -r overleaf.zip ./mt-*.cfg
zip -r overleaf.zip ./cc/*
zip -r overleaf.zip ./FRIteza.bst
zip -r overleaf.zip ./FRIteza.cls
zip -r overleaf.zip ./bk9.clo

cd %1
zip -r ../overleaf.zip ./* -x ./int/* -x ./out/* -x ./.*
cd ..
exit /b

:error
echo No directory named '%1' exists 
exit /b 2