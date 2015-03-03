# Special config for pannus
ifeq ($(shell hostname | grep pannus),)
  TEX=pdflatex
else
  TEX=$(TEXLIVEPATH)/pdflatex
endif


algos:
	${TEX} algo_zonal
	${TEX} algo_merid
