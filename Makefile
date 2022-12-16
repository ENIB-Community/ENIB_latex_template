.PHONY: all viewpdf pdf clean

TARGET       = main
SOURCE_FILES = $(TARGET).tex $(wildcard */*.tex)
BIB_FILES    = $(wildcard biblio/*.bib)
FIGURES      = $(wildcard */figures/*)

# Set the pdf reader according to the operating system
OS = $(shell uname)
ifeq ($(OS), Darwin)
	PDF_READER = open
endif
ifeq ($(OS), Linux)
	PDF_READER = evince
endif

all: pdf

viewpdf: pdf
	$(PDF_READER) $(TARGET).pdf &

pdf: $(TARGET).pdf

$(TARGET).pdf: $(SOURCE_FILES) $(BIB_FILES) $(FIGURES) these-dbl.cls
	pdflatex -interaction=nonstopmode -jobname=$(TARGET) $(SOURCE_FILES)
	biber $(TARGET)
	makeglossaries $(TARGET)
	pdflatex -interaction=nonstopmode -jobname=$(TARGET) $(SOURCE_FILES) # For biber

clean:
	rm -f $(TARGET).{ps,bcf,run.xml}
	for suffix in dvi aux bbl blg toc ind out brf ilg idx synctex.gz log lof lol lot; do \
		find . -type d -name ".git" -prune -o -type f -name "*.$${suffix}" -print -exec rm {} \;  ; \
	done
