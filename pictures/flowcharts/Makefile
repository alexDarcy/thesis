
SRC=$(wildcard *.dot)
PDF=$(SRC:.dot=.pdf)

all: ${PDF}

%.pdf: %.svg
	inkscape -f $< -A $@

%.svg: %.dot
	dot -Tsvg -o $@ $<
