SRC=$(wildcard *.asy)
PDF=$(SRC:.asy=.pdf)
#PS2PDF=ps2pdf -dEPSCrop

ASY=asy

all: ${PDF}

%.pdf:%.asy
	${ASY} -f pdf $<

clean: 
	rm -f ${EPS}
