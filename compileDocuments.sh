#! /bin/sh

R --silent -f createExample.R

cat assignment.tex | sed -e s/solutionfalse/solutiontrue/ > solution.tex

latexmk -gg -pdf assignment.tex

latexmk -gg -pdf solution.tex

