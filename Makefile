RM = rm -fv

.SUFFIXES: .tex .dvi .ps .pdf

# ALLFILES = $(patsubst %.tex,%.pdf,$(wildcard *.tex))
all: lebenslauf_ghagerer.pdf

.tex.pdf:
	pdflatex $*
	bash -c " ( grep Rerun $*.log && pdflatex $* ) || echo noRerun "
	bash -c " ( grep Rerun $*.log && pdflatex $* ) || echo noRerun "

clean:
	$(RM) *.log *.aux *.dvi *.toc *.bbl *.blg *.out

spotless: clean
	$(RM) *.ps *.pdf