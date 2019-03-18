@echo off

:: check arguments
set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% LSS 1 (
  :: build no param
  latexmk -synctex=1 -file-line-error
  exit /b %errorlevel%
)
if %argC% GTR 1 goto usage

SET s=%1
SET j=thesis-%s%
SET c=\newcommand{\stage}{%s%}

:: check stage
goto :switch-case-%s% 2>nul || (
  echo.
  echo Usage: build [^<stage^>]
  echo.
  echo       ^<stage^>        Build pdf in stage:
  echo                      pre-alpha, alpha, beta, gamma, gold, press.
  echo.
)
:switch-case-pre-alpha
:switch-case-alpha
:switch-case-beta
:switch-case-gama
:switch-case-gold
:switch-case-press

:: build
latexmk -synctex=1 -file-line-error -pretex="%c%" -jobname="%j%"
exit /b %errorlevel%

:usage-arg
echo Argument missing, specify stage: pre-alpha, alpha, beta, gamma, gold, press
:usage
echo.
echo Usage: build [^<stage^>]
echo.
echo       ^<stage^>        Build pdf in stage:
echo                      pre-alpha, alpha, beta, gamma, gold, press.
echo.
exit /b 1

