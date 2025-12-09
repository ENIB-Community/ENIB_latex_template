# Report LaTeX Template

This repository provides a LaTeX template inspired by the official template recommended by INRIA for thesis manuscripts:  
[INRIA Thesis Template](https://gitlab.inria.fr/ed-mathstic/latex-template)

---

## Demo

You can find an example of a compiled document here:  
[Compiled PDF example](https://github.com/ENIB-Community/ENIB_latex_template/blob/main/main.pdf)

---

## Getting Started

### Repository Structure

- **`main.tex`**  
  The main document file defining the overall structure; contains no content itself.

- **`enib-report.cls`**  
  Custom class file managing package imports, bibliography settings (including citation styles), and the full document layout—cover pages included.

- **`cover/front.tex`**  
  Contains variables to be filled by the author for the front cover. These variables are used in the customized `\maketitle` command.

- **`cover/back.tex`**  
  Contains variables to be completed for the back cover, used by macros defined in the class file.

- **`Makefile`**  
  Simplifies compiling the LaTeX document and bibliography into a PDF (see details below).

- **Chapter directories**  
  Each directory corresponds to a chapter of the report and contains its respective content.

---

### Customizing Your Report

- **Front and Back Cover**  
  Update the author and report details by editing the variables in `cover/front.tex` and `cover/back.tex`.

- **Logos and Images**  
  - To change the company logo, replace the image referenced by the command `\companyLogo` (default path: `./cover/company`).  
  - To change the ENIB logo, replace the image referenced by the command `\enibLogo` (default path: `./cover/enib_inp`).  
  - To change the profile picture, replace the image at `cover/profile.jpg`.

---

### Dependencies

You need a LaTeX distribution (e.g., TeX Live) to compile the template. Some required packages are not included in the basic TeX Live installation.

- **Fedora** (install with `dnf install`):  
  - `texlive-abstract`  
  - `texlive-wallpaper`

- **Arch Linux**:  
  - Install the [texlive-most](https://wiki.archlinux.org/title/TeX_Live) package group

- **Other distributions**:  
  - Search for full TeX Live packages at [pkgs.org](https://pkgs.org/search/?q=texlive-full)

---

### Compiling the Document

Use the provided `Makefile` to automate compilation:

- **Compile the document and bibliography:**  
  ```bash
  make
  ```

- **Open the generated PDF:**  
  ```bash
  make viewpdf
  ```

- **Clean auxiliary files (including PDF):**  
  ```bash
  make clean
  ```

---

Feel free to reach out if you need help customizing or compiling your report!