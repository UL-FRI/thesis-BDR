xelatex -synctex=1 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -no-pdf thesis
bibtex -include-directory=../ ./int/thesis
xelatex -synctex=1 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out -no-pdf thesis
xelatex -synctex=1 -aux-directory=./int -include-directory=../ -include-directory=./int -output-directory=./out thesis

