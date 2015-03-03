# Latexmk does everything
# We set it to use pdflatex and to generate bibliography
TEX=./latexmk.pl

SRC=$(wildcard *.tex)

all: main.pdf

upload: manuscript_latest.pdf manuscript_src_latest.tar.gz
	ncftpput -f login.cfg misc/pangolin/ $^

manuscript_latest.pdf: main.pdf
	cp main.pdf manuscript_latest.pdf

archive: manuscript_src_latest.tar.gz
	
%.tar.gz: list_pictures.txt ${SRC}
	cat $< | while read file ; do \
	  find ../pictures -name $$file  ; done > list_pictures_archive.txt
	tar -cvzf $@ -T list_pictures_archive.txt \
	  *.tex tlsflyleaf/* tlsflyleaf.sty bibliography

main.pdf: ${SRC}
	${TEX} -pdf -bibtex main

clean:
	rm -f *.aux *.log *.toc *.out *.bbl *.glg *.glo *.gls *.glsdefs
	rm -f *.blg *.fdb_latexmk *.fls *.idx *.ilg *.ind *.ist *.lof *.lot

final: unset_draft pdf

draft: set_draft pdf

set_draft:
	perl -pi -e 's/(?<=commands).*]/, draft]/' main.tex 

unset_draft:
	perl -pi -e 's/(?<=commands).*]/]/' main.tex 

watch:
	./latexmk.pl -pdf -bibtex -pvc main 


