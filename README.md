# Report Latex Template 

> Ce repo contient un code latex proche du code proposé par l'INRIA pour les manuscrits de thèse: https://gitlab.inria.fr/ed-mathstic/latex-template

## Demonstration

* [Latex Document](https://github.com/ENIB-Community/ENIB_latex_template/blob/main/main.pdf)


## Getting Started

#### Structure of the repository

- `main.tex` contains the backbone structure of the document, no content is present in this file
- `these-dbl.cls` contains the package dependencies, bibliography parameters including citation style and overall layout specifications including both front and back cover layouts
- `cover/front.tex` contains the variables that must be filled by the author to complete the front cover, these variables are used in `\maketitle` redefined in `these-dbl.cls`
- `cover/back.tex` contains the variables that must be filled by the author to complete the back cover, these variables are used in the macros defined in `these-dbl.cls`
- The `Makefile` helps you compile the latex and bibliography into a pdf (details below)
- The rest of the directories each contain one chapter of the document

#### Configuration Options

**Language Selection:**
You can switch between French and English by editing the documentclass in `main.tex`:
```latex
\documentclass[french]{these-dbl}  % For French (default)
\documentclass[english]{these-dbl} % For English
```

**Confidential Reports:**
For confidential internship reports, add the `confidential` option:
```latex
\documentclass[french,confidential]{these-dbl}  % French + Confidential
\documentclass[english,confidential]{these-dbl} % English + Confidential
```
This will add a red "CONFIDENTIEL" or "CONFIDENTIAL" marker on the front cover.

#### Fill the front and back cover

The front cover details must be provided by filling the variables in `cover/front.tex` and `cover/back.tex`.
To change the compagny logo, you need to change the file `cover/logo_entreprise.png`
To change the profile image, you need to change the file `cover/profile.jpg`

#### Dependencies

A LaTeX distribution such as texlive is necessary in order to compile your document. Please note some necessary packages are not directly included in a base texlive installation.

Required additional packages:

- Fedora (install using `dnf install`)
	- texlive-abstract
	- texlive-wallpaper
- Archlinux:
	- [texlive-most](https://wiki.archlinux.org/title/TeX_Live)
- Other distributions: [Search on pkgs.org](https://pkgs.org/search/?q=texlive-full)

#### Compile latex into pdf

A `Makefile` is provided to help you compile your document. It uses `pdflatex` and`biber` to generate the pdf file and can display it by using your prefered PDF reader on Linux and MacOS.

Compile your document with `pdflatex/biber`:

```sh
make
```

Display the generated pdf:

```sh
make viewpdf
```

Remove all generated files, pdf included:

```sh
make clean
```

#### Customizing Your Document

**Optional Sections:**
You can comment out sections you don't need in `main.tex`:
- `\listoffigures` - List of figures
- `\listoftables` - List of tables
- `\lstlistoflistings` - List of code listings
- `\printglossary` - Glossary/acronyms
- `\input{./acknowledgement/acknowledgement}` - Acknowledgements page

Simply add `%` at the beginning of the line to disable any section.