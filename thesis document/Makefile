all:
	pdflatex -interaction=nonstopmode -shell-escape -synctex=1 thesis.tex
	bibtex thesis
	pdflatex -interaction=nonstopmode -shell-escape -synctex=1 thesis.tex
	makeglossaries thesis
	bibtex thesis
	pdflatex -interaction=nonstopmode -shell-escape -synctex=1 thesis.tex
	makeglossaries thesis
	pdflatex -interaction=nonstopmode -shell-escape -synctex=1 thesis.tex
