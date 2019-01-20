s=${1?Argument missing, specify stage: pre-alpha, alpha, beta, gamma, gold, press}
j="thesis-$s"
c="\newcommand{\setstage}{$s} \input{thesis}"

xelatex -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name="$j" -no-pdf "$c"
bibtex -include-directory=../ "./int/thesis-$s"
xelatex -synctex=0 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name="$j" -no-pdf "$c"
xelatex -synctex=1 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -job-name="$j" "$c"

