FILE=researchnotes



all: $(FILE).pdf chapters.tex
.PHONY: all

.PHONY: clean
clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.pdf chapters.tex

$(FILE).pdf: $(FILE).tex chapters.tex
	pdflatex $(FILE)
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

chapters.tex: $(wildcard dir/*.tex)
	ls chapters/*.tex | awk '{printf "\\input{%s}\n", $$1}' > chapters.tex
