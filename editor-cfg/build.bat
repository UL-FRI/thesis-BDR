@echo off

:: check arguments
set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% LSS 1 goto usage-arg
if %argC% GTR 3 goto usage

SET l=0
SET s=%1
SET j=thesis-%s%
SET c=\newcommand{\setstage}{%s%} \input{thesis}

:: check stage
goto :switch-case-%s% 2>nul || (
	echo.
	echo Usage: build ^<stage^> ^[-no-bib^] ^[^<rebuilds^>^]
	echo.
	echo       ^<stage^>                         Build pdf in stage: pre-alpha, alpha, beta, gamma, gold, press.
	echo       -no-bib                         Suppress rebuilding bibliography.
	echo.      ^<rebuilds^>                      Perform number of consecutive rebuilds.
	echo.
)
:switch-case-pre-alpha
:switch-case-alpha
:switch-case-beta
:switch-case-gama
:switch-case-gold
:switch-case-press

:: check -no-bib or rebuilds
if %argC% EQU 2 (
	SET "var="&for /f "delims=0123456789" %%i in ("%2") do set var=%%i
	if not defined var (
		SET l=%2
	) else (
		if not [%2]==[-no-bib] (
			goto usage
		) else (
			goto pre-pdf
		)
	)
)
:: check -no-bib and rebuilds
if %argC% EQU 3 (
	if not [%2]==[-no-bib] goto usage

	SET "var="&for /f "delims=0123456789" %%i in ("%3") do set var=%%i
	if not defined var (
		SET l=%3
	) else (
		goto usage
	)
)

:: build
:build-bib
echo Build bibliography.
xelatex -quiet -interaction=batchmode -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=%j% -no-pdf "%c%"
if not errorlevel 0 goto error
bibtex -quiet -include-directory=../ ./int/%j%

:pre-pdf
for /l %%i in (1,1,%l%) do (
	echo Build pre-pdf step %%i.
	xelatex -quiet -interaction=batchmode -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=%j% -no-pdf "%c%"
	if not errorlevel 0 goto error
)

:pdf
echo Build pdf.
xelatex -halt-on-error -synctex=1 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=%j% "%c%"
exit /b %errorlevel%

:error
xelatex -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=%j% -no-pdf "%c%"
exit /b %errorlevel%

:usage-arg
echo Argument missing, specify stage: pre-alpha, alpha, beta, gamma, gold, press
:usage
echo.
echo Usage: build ^<stage^> ^[-no-bib^] ^[^<rebuilds^>^]
echo.
echo       ^<stage^>                         Build pdf in stage: pre-alpha, alpha, beta, gamma, gold, press.
echo       -no-bib                         Suppress rebuilding bibliography.
echo.      ^<rebuilds^>                      Perform number of consecutive rebuilds.
echo.
exit /b 1

