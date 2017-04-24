# Builds the document specified by 'documentname'.
# Call with option '-c' or '--clean' to clean the repo before building.

#!/bin/bash

# CONFIGURATION
documentname="Summary"
# END OF CONFUGURATION

if [ $1 == "-c" ] || [ $1 == "--clean" ]; then
    ./clean.sh
fi


pdflatex "$documentname.tex"
makeglossaries "$documentname"
pdflatex "$documentname.tex"
pdflatex "$documentname.tex"
makeindex -s "$documentname.ist" -o "$documentname.gls" "$documentname.glo"
pdflatex "$documentname.tex"
echo finished
sleep 2
