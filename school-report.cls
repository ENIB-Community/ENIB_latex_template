% Load the 'report' document class with specific options
\LoadClass[oneside,12pt,a4paper]{report} % 'report' document class, one-sided layout, 12pt font size, A4 paper format.

% Define global variables for margins
\newlength{\docmargin}
\newlength{\bindingoffset}
\newlength{\logomargin}

\newcommand{\schoolLogo}{./cover/enib_inp}
\newcommand{\companyLogo}{./cover/company}
\newcommand{\frontCover}{./cover/front-background.pdf}
\newcommand{\backCover}{./cover/back-background.pdf}

\newcommand{\globalMail}{\@mail}

% Set the values for the margins
\setlength{\docmargin}{2cm} % Global margin for the document
\setlength{\headheight}{30pt} % Set the header height
\setlength{\headsep}{20pt} % Set the separation between the header and the body text

% ------------------------- ENCODING AND LANGUAGES -------------------------
% Load package for UTF-8 character encoding
\RequirePackage[utf8]{inputenc}
% Load package for language management, English by default
\RequirePackage[english]{babel}

% ------------------------- MATHEMATICS AND SYMBOLS -------------------------
% Load packages for mathematics and mathematical symbols
\RequirePackage{amsmath, amssymb}

% ------------------------- COLORS AND SYMBOLS -------------------------
% Load package for the use of named colors
\RequirePackage[usenames,dvipsnames]{color}
% Load package for additional textual symbols
\RequirePackage{textcomp}
% Load package for various symbols
\RequirePackage{pifont}

% ------------------------- SECTIONS, COLUMNS, AND LAYOUT -------------------------
% Load package for customization of section titles
\RequirePackage{titlesec}
% Load package for the creation of parallel columns
\RequirePackage{parcolumns}
% Load package for the creation of multi-column environments
\RequirePackage{multicol}

% ------------------------- FONTS AND ENCODING -------------------------
% Use T1 encoding for characters
\RequirePackage[T1]{fontenc}
% Improves the printing quality of characters
\RequirePackage{lmodern}
% Fixes some issues with Computer Modern fonts
\RequirePackage{fix-cm}

% ------------------------- GRAPHICS AND IMAGES -------------------------
% Load package for drawing graphs, boxes, etc.
\RequirePackage{tikz}
% Load package for inserting images
\RequirePackage{graphicx}
% Load package for adding graphical elements to pages
\RequirePackage{eso-pic}
% Load package for referencing the last page
\RequirePackage{lastpage}

% ------------------------- ABSTRACT, HEADERS, AND FOOTERS -------------------------
% Load package for adding an abstract
\RequirePackage{abstract}
% Load package for creating a condensed table of contents at the beginning of the document
\RequirePackage{shorttoc}
% Load package for customization of headers and footers
\RequirePackage{fancyhdr}

% ------------------------- COMMENTS AND BACKGROUNDS -------------------------
% Load package for creating comment environments
\RequirePackage{comment}
% Load package for adding a background to the page
\RequirePackage{wallpaper}

% ------------------------- LAYOUT AND SPACING -------------------------
% Use these variables to configure the geometry package
\RequirePackage[%
    margin=\docmargin, % Use the global variable for the margins
]{geometry}

% Load package for defining line spacing
\RequirePackage{setspace}
% Set line spacing to 1.5
\onehalfspacing

% ------------------------- LISTS AND GLOSSARIES -------------------------
% Load package for formatting of source code
\RequirePackage{listings}
% Load package for creating glossaries and lists of acronyms
\RequirePackage[toc, acronym]{glossaries}

% ------------------------- CITATIONS AND REFERENCES -------------------------
% Load package for adding epigraphs
\RequirePackage{epigraph}
% Load package for creating interactive links in the PDF
\RequirePackage{hyperref}
% Configure link colors
\hypersetup{colorlinks=true, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black}

% ------------------------- BOXES AND ENVIRONMENTS -------------------------
% Load package for coloring of boxes
\RequirePackage{framed}
% Load package for conditional commands
\RequirePackage{ifthen}
% Load package for the use of French quotation marks
\RequirePackage{csquotes}

% Configure Listings
% Pour les listings (package listings)
\renewcommand{\lstlistingname}{Code}
\renewcommand{\lstlistlistingname}{L\MakeLowercase{ist of \lstlistingname s}}

\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of tables}

% Define Font Commands
% Command for the font style used in the front cover
\newcommand*{\selectfontfrontcover}{\fontfamily{phv}\selectfont}
% Command for the font style used in the back cover
\newcommand*{\selectfontbackcover}{\fontfamily{phv}\selectfont}
% Command for the font style used in chapter headings
\newcommand*{\selectfontchapheads}{\fontfamily{phv}\selectfont}

% ------------------------- BACKGROUND IMAGES FOR COVERS -------------------------
% Command to Insert Front Cover Background
\newcommand\BackgroundPicfront{%
  \put(0,0){%
    \parbox[b][\paperheight]{\paperwidth}{%
      \vfill
      \centering
      % Insert the front cover background image, scaling it to fit the page while maintaining the aspect ratio.
      \includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{\frontCover}%
      \vfill
    }
  }
}

% Command to Insert Back Cover Background
\newcommand\BackgroundPicback{%
  \put(0,0){%
    \parbox[b][\paperheight]{\paperwidth}{%
      \vfill
      \centering
      % Insert the back cover background image, scaling it to fit the page while maintaining the aspect ratio.
      \includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{\backCover}%
      \vfill
    }
  }
}

% ------------------------- CHAPTER HEADERS -------------------------
\makeatletter
% Define a thick horizontal rule for chapter headers
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}

% Custom Chapter Headers with logos using \docmargin
\def\@makechapterhead#1{%
  \thispagestyle{fancy}
  \vspace*{0\p@}% % Reduce space above the chapter title.
  {%
    \parindent \z@ % No paragraph indentation.
    \raggedleft % Align the chapter title to the right.
    \reset@font % Reset the font settings.
    \scshape % Use small caps for the chapter label.
    \@chapapp{} \thechapter % Print the chapter label and number.
    \par\nobreak % Prevent a page break after the chapter number.
    \interlinepenalty\@M % Prevent a page break within the chapter title.
    \selectfontchapheads % Apply custom font settings for chapter headers.
    \Huge \bfseries #1 % Print the chapter title in a large, bold font.
    \par\nobreak % Prevent a page break after the chapter title.
    \hrulefill % Add a horizontal rule below the chapter title.
    \par\nobreak % Prevent a page break after the rule.
    \vskip 30\p@ % Add vertical space below the chapter title.
  }
}

% Custom Unnumbered Chapter Headers with logos using \docmargin
\def\@makeschapterhead#1{%
  \thispagestyle{fancy}
  \vspace*{-20\p@}% % Reduce space above the chapter title.
  {%
    \parindent \z@ % No paragraph indentation.
    \raggedleft % Align the chapter title to the right.
    \reset@font % Reset the font settings.
    \scshape % Use small caps for the chapter label.
    \vphantom{\@chapapp{} \thechapter} % Ensure vertical alignment with numbered chapters.
    \par\nobreak % Prevent a page break after the chapter number.
    \interlinepenalty\@M % Prevent a page break within the chapter title.
    \selectfontchapheads % Apply custom font settings for chapter headers.
    \Huge \bfseries #1 % Print the chapter title in a large, bold font.
    \par\nobreak % Prevent a page break after the chapter title.
    \hrulefill % Add a horizontal rule below the chapter title.
    \par\nobreak % Prevent a page break after the rule.
    \vskip 10\p@ % Add vertical space below the chapter title.
  }
}
\makeatother

% ------------------------- SECTION HEADERS -------------------------
% This section defines a custom command to create visually distinct section headers.
\makeatletter
% Stylized Section Header
\newcommand*{\jolipart}[1]{%
  \begin{center}
    \begin{Huge}\color{black} % Set the text to be large and black.
      #1 % The content of the section header is passed as an argument.
    \end{Huge}
  \end{center}
  \vspace{1cm} % Add vertical space below the header text.
  \begin{center}
    \hrulefill % Add a horizontal rule (line) below the header text for emphasis.
  \end{center}
}
% ------------------------- BIBLIOGRAPHY SETUP -------------------------
% Configure Biblatex for Bibliography Management

% Load Biblatex Package
\RequirePackage[
  hyperref,
  backend=biber, % Use Biber backend for better features
  style=ieee % Citation style (e.g., alphabetic, ieee, nature, numeric, verbose-trad1)
]{biblatex}

% Note: Example styles for Biblatex can be found at:
% https://www.overleaf.com/learn/latex/Biblatex_bibliography_styles

% Customize Bibliography Strings
% Italicize the word "in" in bibliographic references
\DefineBibliographyStrings{english}{%
  in = {\emph{in}}%
}

% Biblatex can manage keywords in bibliographic entries.
% It supports abbreviations like "idem," "ibidem," and "op cit."
% Ensure your .bib file contains the necessary keywords, such as "primary" and "secondary."

% ------------------------- SINGLE SPACING FOR QUOTES AND VERSES -------------------------
% Environments: QUOTE, QUOTATION, VERSE
% This section redefines the environments for quotes, quotations, and verses
% to use single spacing instead of the default spacing.

% Redefine the 'quote' Environment
% Save the original 'quote' environment to \orig@quote and \endorig@quote.
\let\orig@quote\quote
\let\endorig@quote\endquote
% Renew the 'quote' environment to use single spacing.
\renewenvironment*{quote}
	{\orig@quote\singlespace} % Begin the 'quote' environment with single spacing.
	{\endsinglespace\endorig@quote} % End the 'quote' environment and revert to normal spacing.

% Redefine the 'quotation' Environment
% Save the original 'quotation' environment to \old@quotation and \endold@quotation.
\let\old@quotation\quotation
\let\endold@quotation\endquotation
% Renew the 'quotation' environment to use single spacing.
\renewenvironment*{quotation}
	{\old@quotation\singlespace} % Begin the 'quotation' environment with single spacing.
	{\endsinglespace\endold@quotation} % End the 'quotation' environment and revert to normal spacing.

% Redefine the 'verse' Environment
% Save the original 'verse' environment to \old@verse and \endold@verse.
\let\old@verse\verse
\let\endold@verse\endverse
% Renew the 'verse' environment to use single spacing.
\renewenvironment*{verse}
	{\old@verse\singlespace} % Begin the 'verse' environment with single spacing.
	{\endsinglespace\endold@verse} % End the 'verse' environment and revert to normal spacing.

% ------------------------- COVER PAGES VARIABLES -------------------------
% Define placeholders for key variables used in the cover page.
% These commands store values that can be modified later.

% Company name
\newcommand{\company}[1]{\gdef\@company{#1}}
\company{} % Initialize empty

% Jury details
\newcommand{\jury}[1]{\gdef\@jury{#1}}
\jury{} % Initialize empty

% Defense location
\newcommand{\place}[1]{\gdef\@place{#1}}
\place{} % Initialize empty

% Semester
\newcommand{\semester}[1]{\gdef\@semester{#1}}
\semester{} % Initialize empty

% Report submission date
\newcommand{\dates}[1]{\gdef\@dates{#1}}
\dates{} % Initialize empty

% Student email
\newcommand{\mail}[1]{\gdef\@mail{#1}}
\mail{} % Initialize empty

% ------------------------- FONT SIZES FOR COVER PAGE -------------------------
% Define custom font sizes for different elements on the cover page.
% These font sizes are adjusted to match a 12pt base document.

\newcommand{\HugeTwelve}{\fontsize{26}{31}\selectfont} % Equivalent to 12pt \Huge
\newcommand{\LARGETwelve}{\fontsize{20.74}{25}\selectfont} % Equivalent to 12pt \LARGE
\newcommand{\LargeTwelve}{\fontsize{16}{19}\selectfont} % Equivalent to 12pt \Large
\newcommand{\largeTwelve}{\fontsize{14.4}{17}\selectfont} % Equivalent to 12pt \large
\newcommand{\normalTwelve}{\fontsize{12}{13.2}\selectfont} % Equivalent to 12pt \normalsize
\newcommand{\smallTwelve}{\fontsize{11}{13.5}\selectfont} % Equivalent to 12pt \small
\newcommand{\footnotesizeTwelve}{\fontsize{9.5}{11}\selectfont} % Equivalent to 12pt \footnotesize

% ------------------------- DISPLAY LOGOS ON COVER PAGE -------------------------
\newcommand{\displayLogos}{%
    \thispagestyle{empty} % No headers/footers on this page
    \begin{tikzpicture}[remember picture, overlay]
        % Use the global variables to position the logos
        \node[anchor=north west, xshift=\docmargin, yshift=-\docmargin] at (current page.north west) {%
            \includegraphics[keepaspectratio, height=2cm]{\companyLogo}%
        };

        \node[anchor=north east, xshift=-\docmargin, yshift=-\docmargin] at (current page.north east) {%
            \includegraphics[keepaspectratio, height=2cm]{\schoolLogo}%
        };
    \end{tikzpicture}
    \par\nobreak % Prevent unwanted page breaks
}

% ------------------------- COVER PAGE LAYOUT -------------------------
% Define the structure of the cover page
\makeatletter
\def\maketitle{%
  \thispagestyle{empty} % Ensure no headers or footers on the title page
  {
    \clearpage % Start on a fresh page
    \AddToShipoutPicture*{\BackgroundPicfront} % Set background image for the cover page
    \displayLogos % Display institution/company logos
    \selectfontfrontcover % Apply custom font settings

    \vskip 6em~\\ % Add vertical space before the title
    {\HugeTwelve\textsc{Internship report \@semester}} % Report title with semester info
    \vskip 2em~\\ % Add vertical space before the title
    {\LARGETwelve Presented by \textbf{\@author}} % Author's name
    \vskip 2em~\\ % Add vertical space before the title
    {\LargeTwelve \textbf{\@title}} % Report title in bold

    \vfill ~\\
    {\smallTwelve
    \textbf{Report presented and defended at \@place, on \@date \\~\\}
    }
    \begin{small}
    \@jury
    \vskip 4em~\\
    {\smallTwelve \textbf{Administrative Information:}}\\
    \newline
    \footnotesizeTwelve
    \begin{tabular}{@{}ll}
    Company: & \@company \\
    Institution: & École Nationale d'Ingénieurs de Brest (ENIB) \\
    Dates: & \@dates \\
    Student email: & \@mail \\
    \end{tabular}
    \end{small}
    }
}
\makeatother

% ------------------------- BACK COVER -------------------------
% Command to set up the back cover header
\newcommand{\backcoverheader}{%
  \thispagestyle{empty} % Ensure the page has no headers or footers
  \hspace{9mm} % Horizontal spacing adjustment
  \AddToShipoutPicture*{\BackgroundPicback} % Add background image for the back cover
  \displayLogos % Display the predefined logos (defined elsewhere)
}

% Command to define the "Subject" section on the back cover
\newcommand{\subject}[1]{%
  \vspace{0.5cm} % Add vertical spacing before the section
  \noindent{\smallTwelve \textbf{Subject: }#1} % Format text with predefined font size
}

% Command to define the "Keywords" section
\newcommand{\keywords}[1]{%
  \vspace{0.5cm} % Add vertical spacing before the section
  \noindent{\smallTwelve \textbf{Keywords: }#1} % Format text with predefined font size
}

% Command to define the "feedback" section
\newcommand{\feedback}[1]{%
  \vspace{0.5cm} % Add vertical spacing before the section
  \begin{spacing}{1} % Ensure single line spacing
    \noindent\smallTwelve \textbf{Company Feedback: }#1 % Format text with predefined font size
  \end{spacing}
}

% Command to define the "Work Done" (Résumé) section
\newcommand{\resume}[1]{%
  \vspace{0.5cm} % Add vertical spacing before the section
  \begin{spacing}{1} % Ensure single line spacing
    \noindent\smallTwelve \textbf{Work Done: }#1 % Format text with predefined font size
  \end{spacing}
}

% Command to define the "Conclusion" section
\newcommand{\conclusion}[1]{%
  \vspace{0.5cm} % Add vertical spacing before the section
  \begin{spacing}{1} % Ensure single line spacing
    \noindent\smallTwelve \textbf{Conclusion: }#1 % Format text with predefined font size
  \end{spacing}
}

% ------------------------- PAGE HEADERS -------------------------
\newcommand{\clearemptydoublepage}{%
    \newpage{\pagestyle{empty}\cleardoublepage}%
}

\newcommand{\setupPagestyle}{%
  \pagestyle{fancy} % activate fancyhdr
  \fancyhf{} % clear headers and footers
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{.4pt}

  % Headers (logos)
  \fancyhead[L]{\includegraphics[height=1.2cm]{\companyLogo}}
  \fancyhead[R]{\includegraphics[height=1.2cm]{\schoolLogo}}

  \fancyfoot[C]{\thepage /\pageref{LastPage}} % Page number centered
  \fancyfoot[L]{\leftmark} % Chapter title on the left
  \fancyfoot[R]{\globalMail}
}

\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}%
}

% Frontmatter Configuration
\appto\frontmatter{%
  \setupPagestyle%
}

% Mainmatter Configuration
\appto\mainmatter{%
  \setupPagestyle%
}

% Backmatter Configuration
\appto\backmatter{%
  \setupPagestyle%
}

% ------------------------- BOXES -------------------------
% Define colors used for the boxes
\definecolor{titlebg}{RGB}{85,85,85} % Title background color (dark gray)
\definecolor{boxbg}{RGB}{232,232,232} % Box background color (light gray)
\definecolor{shadecolor}{RGB}{232,232,232} % Used for the 'shaded' environment

\ProcessOptions % Apply package options if necessary

% Magic Box (with a title and a framed content)
\newcommand*{\magicBox}[2]{%
  \begin{center} % Center the box on the page
    \begin{tikzpicture} % Start drawing with TikZ

      % Create the main box with a colored background
      \node[
        rectangle, % Rectangle shape
        draw=titlebg, % Border color same as title background
        fill=boxbg, % Fill with the defined box background color
        inner sep=10pt, % Internal padding between content and edges
        inner ysep=20pt % Increases internal vertical spacing
      ] (mabox) {
        \begin{minipage}{15cm} % Content container with a width of 15 cm
          #2 % Insert content provided as an argument
        \end{minipage}
      };

      % Create the title placed above the main box
      \node[
        fill=titlebg, % Background color for the title
        text=white, % White text for contrast
        rectangle, % Rectangle shape
        inner xsep=5pt, % Internal horizontal padding
        inner ysep=2pt % Internal vertical padding
      ]
      at (mabox.north) {\sffamily\textbf{#1}}; % Title text in bold sans-serif

    \end{tikzpicture} % End TikZ drawing
  \end{center} % End centering
}

% Simple Box (without title, with shaded background)
\newcommand*{\simpleBox}[1]{%
  \begin{center} % Center the box on the page
    \begin{minipage}{12cm} % Set a width of 12 cm for the text
      \begin{shaded} % Shaded environment defined by 'shadecolor'
        #1 % Insert content
      \end{shaded}
    \end{minipage}
  \end{center}
}
