LATEX = pdflatex
BIBTEX = bibtex
OUT = biblio
LOG = $(addsuffix .log,$(OUT))
SRC = $(addsuffix .tex,$(OUT))

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"


.PHONY: all clean

all: biblio.pdf

biblio.pdf: FORCE
	$(LATEX) $(OUT)
	@if(grep "There were undefined references" $(LOG) > /dev/null);\
	then \
		$(BIBTEX) $(OUT); \
		$(LATEX) $(OUT); \
	fi
	@if(grep "Rerun" $(LOG) > /dev/null);\
	then \
		$(LATEX)  $(OUT);\
	fi
	rm -f $(LOG)

	$(BIBTEX) $(OUT)
	$(LATEX) $(OUT)

FORCE:
