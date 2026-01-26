LATEX=pdflatex
BIBTEX=bibtex
MAIN=main

TEX=$(MAIN).tex
BIB=sample-base.bib
CLASS=acmart.cls
BST=ACM-Reference-Format.bst
LOGO=acm-jdslogo.png

.PHONY: all clean distclean

all: $(MAIN).pdf

$(MAIN).pdf: $(TEX) $(BIB) $(CLASS) $(BST) $(LOGO)
	$(LATEX) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

clean:
	rm -f $(MAIN).aux \
	       $(MAIN).bbl \
	       $(MAIN).blg \
	       $(MAIN).log \
	       $(MAIN).out \
	       $(MAIN).toc

# Remove all generated artifacts including the final PDF
# Use with care.
distclean: clean
	rm -f $(MAIN).pdf
