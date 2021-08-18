all: template.pdf journal.pdf

template.aux: template.tex mnt.cls template.bib apalike.bst
journal.aux: journal.tex mnt.cls template.bib apalike.bst

%.pdf: %.tex %.bbl
	pdflatex $<
	pdflatex $<

%.aux: %.tex 
	pdflatex $<

test.pdf journal.pdf: %.pdf: %.tex %.bbl
	lualatex $<
	lualatex $<

test.aux journal.aux: %.aux: %.tex 
	lualatex $<

text.bbl journal.bbl: %.bbl: %.tex %.aux 
	biber $*

template.bbl: %.bbl: %.tex %.aux 
	bibtex $*

%.html: %.tex
	htlatex $< 
