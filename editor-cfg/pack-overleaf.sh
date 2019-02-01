rm -Rf FRIteza
rm FRIteza.zip

mkdir FRIteza
cp README.md FRIteza
cp FRIteza.cls FRIteza
cp FRIteza.bst FRIteza
cp bk9.clo FRIteza
cp mt-EBGaramond.cfg FRIteza
cp -R cc FRIteza/
cp -R fonts FRIteza/
cp -R demo-empty/* FRIteza/
rm -Rf FRIteza/int
rm -Rf FRIteza/out

zip -r FRIteza.zip FRIteza

