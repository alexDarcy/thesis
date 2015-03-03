mp = mpost
mp2pdf=pdftex -fmt=mptopdf -progname=context \\relax
#tex = /wkdir/pae1/praga/texlive/bin/x86_64-linux/pdflatex
tex = pdflatex

OBJ=$(patsubst %.mp,%.mps,$(wildcard *.mp))
# Need to be rerun
PDFS=$(patsubst %.mps,%.pdf,$(wildcard *.mps))
SRCTEX = $(basename $(wildcard *.tex))
# Latex only needs mps, but we can also have pdf
all: metapost pdf tex

metapost: $(OBJ)
	@echo "lol"
	@echo ${OBJ}

%.mps:%.mp
	$(mp) $<

pdf: $(PDFS)

%.pdf:%.mps
	$(mp2pdf) $<

tex: $(SRCTEX)

.tex:
	latex $@.tex
	dvips -E $@.dvi
	ps2pdf -dEPSCrop $@.ps
clean:
	rm -f *.out *.aux *.nav *.log *.snm *.toc *.mps *.dvi *.mpx *.ps
