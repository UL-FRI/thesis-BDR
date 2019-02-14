#!/bin/sh

# error
function error
{
    xelatex -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=$j -no-pdf "$c"
    exit $?
}

# usage
function usage
{
    printf "\n"
    printf "Usage: build <stage> [-no-bib] [<rebuilds>]\n"
    printf "\n"
    printf "      <stage>        Build pdf in stage:\n"
    printf "                     pre-alpha, alpha, beta, gamma, gold, press.\n"
    printf "      -no-bib        Suppress rebuilding bibliography.\n"
    printf "      <rebuilds>     Perform number of consecutive rebuilds.\n"
    printf "\n"
    exit 1
}

# usage-arg
function usage_arg
{
    printf "Argument missing, specify stage: pre-alpha, alpha, beta, gamma, gold, press\n"
    usage
}

# check arguments
if [ $# -lt 1 ]; then usage_arg; fi
if [ $# -gt 3 ]; then usage; fi

# check stage
if ! [[ "$1" =~ ^(pre-alpha|alpha|beta|gamma|gold|press)$ ]]; then usage; fi

bib=1 # assume bibliography must be built
pre_pdf=0 # assume no rebuilds
pdf=1 # assume build pdf
s=$1 # stage
j="thesis-$s" # job name
c="\newcommand{\setstage}{$s} \input{thesis}" # command

# check -no-bib or rebuilds
if [ $# -eq 2 ]; then
    if ! [[ $2 =~ ^[0-9]+$ ]]; then 
        if ! [ "$2" = "-no-bib" ]; then usage; else bib=0; fi;
    else
        pre_pdf=$2
    fi
fi

# check -no-bib and rebuilds
if [ $# -eq 3 ]; then
    if ! [ "$2" = "-no-bib" ]; then usage; else bib=0; fi;

    if ! [[ $3 =~ ^[0-9]+$ ]]; then 
        usage;
    else
        pre_pdf=$3
    fi
fi

# build
# build-bib
if [ $bib -eq 1 ]; then
    printf "Build bibliography.\n"
    xelatex -quiet -interaction=batchmode -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=$j -no-pdf "$c"
    if ! [ $? = 0 ]; then error; fi;
    bibtex -quiet -include-directory=../ ./int/$j
    xelatex -quiet -interaction=batchmode -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=$j -no-pdf "$c"
    if ! [ $? = 0 ]; then error; fi;
fi

# pre-pdf
for (( i=1; i<=$pre_pdf; i++ ))
do
	printf "Build pre-pdf step $i.\n"
	xelatex -quiet -interaction=batchmode -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=$j -no-pdf "$c"
    if ! [ $? = 0 ]; then error; fi;
done

# pdf
printf "Build pdf.\n"
xelatex -quiet -interaction=batchmode -halt-on-error -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=$j -no-pdf "$c"
if ! [ $? = 0 ]; then error; fi;
xelatex -halt-on-error -synctex=1 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name=$j "$c"
exit $?
