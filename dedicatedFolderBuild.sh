# Builds the document specified by 'documentname'.
# Call with option '-c' or '--clean' to clean the repo before building.

#!/bin/bash

# CONFIGURATION
documentname="Summary"
# END OF CONFUGURATION

if [ $1 == "-c" ] || [ $1 == "--clean" ]; then
    ./clean.sh
fi

mkdir Built
pdflatex -output-directory Built "$documentname.tex"
makeglossaries -d Built "$documentname"
pdflatex -output-directory Built "$documentname.tex"
pdflatex -output-directory Built "$documentname.tex"
makeindex -s "Built/""$documentname.ist" -o "Built/""$documentname.gls" "Built/""$documentname.glo"
pdflatex -output-directory Built "$documentname.tex"
echo finished
sleep 2
