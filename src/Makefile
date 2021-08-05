all: template.pdf

template.aux: template.tex mnt.cls template.bib apalike.bst
journal.aux: journal.tex mnt.cls template.bib apalike.bst

%.pdf: %.tex %.bbl
	pdflatex $<
	pdflatex $<

%.aux: %.tex 
	pdflatex $<

%.bbl: %.tex %.aux 
	bibtex $*

%.html: %.tex
	htlatex $< 
