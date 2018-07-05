TMP_FILE_TYPES= *.acn *.acr *.alg *.aux *.bbl *.bcf *.blg *.brf *.cb *.cb2 *.dbj *.dvi *.glo\
                *.glg *.gls *.idx *.ilg *.ind *.lof *.log *.lol *.lot *.nav\
                *.nlg *.nlo *.nls *.not *.ntn *.out *.pdfsync *.run.xml *.sd *.sgl *.snm *?.svn\
                *.svt *.svx *.swp *.tex.bak *.toc *.vrb *.vtc

.PHONY: all %.pdf main clean realclean

all: main clean

%.pdf: %.tex
	@pdflatex $<

main: autoarg.tex zotero.bib
	@pdflatex autoarg
	@bibtex autoarg
	@pdflatex autoarg
	@pdflatex autoarg
	@pdflatex autoarg
	@echo 'LaTeX gave' `grep "Warning:" autoarg.log | wc -l` 'warnings'

clean:
	@rm -f $(TMP_FILE_TYPES)

realclean:
	@rm -f $(TMP_FILE_TYPES)
	@rm -f autoarg.pdf

spellcheck:
	aspell check autoarg.tex --mode=tex --lang=en_US
