\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{these-dbl}[11/07/2021 v5.1]

\LoadClass[twoside,multicol,12pt,a4paper]{report}	% notez le "twoside", essentiellement pour alterner les en-tete et pieds de page gauche et droit si on veut utliser les fancyhead. 
\RequirePackage[utf8]{inputenc} 
\RequirePackage[english,french]{babel} % Last language is the default, use \selectlanguage{english} to switch
\RequirePackage{ifpdf}
\RequirePackage{amsmath, amssymb}
\RequirePackage[usenames,dvipsnames]{color} % pour les couleurs
\RequirePackage{textcomp}
\RequirePackage{titlesec}
\RequirePackage{parcolumns}
\RequirePackage{multicol}
\RequirePackage[T1]{fontenc} % permet de sp\'{e}cifier \`{a} LaTeX l'utilisation du codage de caract\`{e}res T1, nouvelle norme LaTeX non utilis\'{e}e par d\'{e}faut pour des raisons de compatibilit\'{e} avec les anciens documents LaTeX.
\RequirePackage{lmodern} % Assurer une bonne impression!
\RequirePackage{tikz} % tikz est utilise pour tracer des boites, par exemple
\RequirePackage{fix-cm}
\RequirePackage{abstract}
\RequirePackage{graphicx} % Pour ins\'{e}rer des images. Utiliser le format jpg pour plus de simplicit\'{e}.
\RequirePackage{sectsty} % obligatoire, pour jouer avec l'apparence des titres
\RequirePackage{shorttoc} % pour le sommaire, au debut.
\RequirePackage{fancyhdr} % Afin de r\'{e}aliser soi-même les en-têtes et pieds de page, voir chaque d\'{e}but de chapitre.
\RequirePackage{pifont} % Pour utiliser des symboles divers.
\RequirePackage{color}
\RequirePackage{comment}
\RequirePackage{wallpaper}
\RequirePackage[inner=30mm,outer=20mm,top=30mm,bottom=20mm]{geometry}
\RequirePackage{setspace}
\RequirePackage{listings}
\RequirePackage{eso-pic}
\RequirePackage[toc, acronym]{glossaries}

%Ou bien : \RequirePackage[top=4 cm, bottom=4 cm, left=3 cm, right=3 cm]{geometry} % On peut modifier ces valeurs pour augmenter ou r\'{e}duire les marges. Attention aux en-têtes de chapitres. 
\RequirePackage{epigraph} % \cleartoevenpage

\RequirePackage{setspace} % permet d'utiliser les commandes \spacing, doublespace (double interligne), singlespace (simple interligne) et onehalfspace (un interligne et demi)

\RequirePackage{hyperref} %Utiliser pour une bibliographie interactive + sommaire et TOC interactifs (pour une sortie PDF, par exemple).
\hypersetup{colorlinks=true, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black}

\RequirePackage{eso-pic} % For \AddToShipoutPicture used for cover backgrounds
\RequirePackage{framed} % utilise pour coloriser les encarts

\onehalfspacing %Interligne 1,5

\RequirePackage{ifthen} % Entrer valeurs bool\'{e}ennes et autres options
\RequirePackage{csquotes} % Assurer les guillemets français
\frenchspacing
\FrenchFootnotes

% configure
\renewcommand{\lstlistingname}{Code}% Listing -> Algorithm
\renewcommand{\lstlistlistingname}{Liste des \lstlistingname s}

% Define commands to set fonts throughout the document
\newcommand*{\selectfontfrontcover}{\fontfamily{phv}\selectfont}  % Font style used in front cover 
\newcommand*{\selectfontbackcover}{\fontfamily{phv}\selectfont}   % Font style used in back cover 
\newcommand*{\selectfontchapheads}{\fontfamily{phv}\selectfont} % Font style used chapter headings



\newcommand\BackgroundPicfront{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{./cover/front-background.pdf}%
\vfill
}}
}

\newcommand\BackgroundPicback{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{./cover/back-background.pdf}%
\vfill
}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% En-tete chap %%%%%%%%%%%%%%%%

\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
\def\@makechapterhead#1{%
  \vspace*{-30\p@}%
  {\parindent \z@ \raggedleft \reset@font
            \scshape \@chapapp{} \thechapter
        \par\nobreak
        \interlinepenalty\@M
    \selectfontchapheads \Huge \bfseries #1\par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 50\p@
  }
}
\def\@makeschapterhead#1{%
 \vspace*{-50\p@}%
  {\parindent \z@ \raggedleft \reset@font
            \scshape \vphantom{\@chapapp{} \thechapter}
        \par\nobreak
        \interlinepenalty\@M
    \selectfontchapheads \Huge \bfseries #1 \par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 30\p@
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Tete de parties %%%%%%%%%%%%%%%%

\makeatletter
\newcommand*{\jolipart}[1]{%
	\begin{center}
		\begin{Huge}\color{black}
			#1
		\end{Huge}
		\end{center}
		\vspace{1cm}		
	\begin{center}
	\hrulefill
	\end{center}		
	}

\parttitlefont{\jolipart}

\partnumberfont{\sc\normalsize}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% REGLAGE DE LA BIBLIOGRAPHIE %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% ATTENTION, on utilise Biblatex %%%%%%%%%%%%%

% Les dernieres versions de biblatex pr\'{e}conisent l'option backend=biber
% pour profiter des derni\`{e}res nouveaut\'{e}s. Si vous choisissez cette
% option, il vous faut simplement compiler avec $biber nomdufichier (sans le
% .tex). Pour utiliser bibtex, remplacer par backend=bibtex.
\RequirePackage[hyperref,backend=biber,
  % Exemples de styles: alphabetic, ieee, nature, numeric, verbose-trad1 (en utilisant \footcite{}).
  % https://www.overleaf.com/learn/latex/Biblatex_bibliography_styles
  style=ieee
  ]{biblatex}

% Style biblatex avec gestion des mots cl\'{e}s des entr\'{e}es bibliographiques
% + les abbr\'{e}viations idem, ibidem, op cit. Pr\'{e}voir un fichier bib
% contenant ces mots-cl\'{e}s, ici primary et secondary.

% Et pour mettre le in en italique dans la ref\'{e}rence biblio (merci encore \`{a} Josquin Debaz)
\DefineBibliographyStrings{english}{%
        in = {\emph{in}}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Interligne simple pour citations et vers %%%%%%%%%%%%%%%%%%
%% Environnements: QUOTE, QUOTATION, VERSE
% Copyright (C) 2002 Mike Nolta <mrnolta@princeton.edu>, GPL V. 2.0 and
% later version. http://www.physics.princeton.edu/cosmology/computing/PrincetonThesis.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\orig@quote\quote
\let\endorig@quote\endquote
\renewenvironment*{quote}
	{\begin{orig@quote}\begin{singlespace}}
	{\end{singlespace}\end{orig@quote}}

\let\old@quotation\quotation
\let\endold@quotation\endquotation
\renewenvironment*{quotation}
	{\begin{old@quotation}\begin{singlespace}}
        {\end{singlespace}\end{old@quotation}}

\let\old@verse\verse
\let\endold@verse\endverse
\renewenvironment*{verse}
	{\begin{old@verse}\begin{singlespace}}
        {\end{singlespace}\end{old@verse}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% VARIABLES PAGE DE GARDE %%%%%%%%%%%%%%%%

%%%% Entreprise
\newcommand{\entreprise}[1]{\gdef\@entreprise{#1}}
\entreprise{}

%%%% Jury
\newcommand{\jury}[1]{\gdef\@jury{#1}}
\jury{}

%%% Ville de soutenance
\newcommand{\lieu}[1]{\gdef\@lieu{#1}}
\lieu{}

%%% Semester
\newcommand{\semester}[1]{\gdef\@semester{#1}}
\semester{}

%%% Date
\newcommand{\dates}[1]{\gdef\@dates{#1}}
\dates{}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% PAGE DE GARDE %%%%%%%%%%%%%%%%

% Define some font sizes specific to the covers, supposed to be in 12pt
\newcommand{\HugeTwelve}{\fontsize{26}{31}\selectfont} % 12pt \Huge
\newcommand{\LARGETwelve}{\fontsize{20.74}{25}\selectfont} % 12pt \LARGE
\newcommand{\LargeTwelve}{\fontsize{16}{19}\selectfont} % 12pt \Large
\newcommand{\largeTwelve}{\fontsize{14.4}{17}\selectfont} % 12pt \large
\newcommand{\normalTwelve}{\fontsize{12}{13.2}\selectfont} % 12pt \normalsize
\newcommand{\smallTwelve}{\fontsize{11}{13.5}\selectfont} % 12pt \small
\newcommand{\footnotesizeTwelve}{\fontsize{9.5}{11}\selectfont} % 12pt \footnotesize

% Affiche les logos sur les pages de couverture
\newcommand{\displayLogos}{%
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay,line width=0mm]
    \node[xshift=6.7cm,yshift=2cm] {%
    \parbox{\textwidth}{%
      $\vcenter{\hbox{\includegraphics[keepaspectratio,height=2cm]{./cover/logo_entreprise}}}$
      \hfill
      \hspace{3mm}
      $\vcenter{\hbox{\includegraphics[keepaspectratio,height=2cm,width=7cm]{./cover/logo_ENIB}}}$
    }%
  };
  \end{tikzpicture}
  \par\nobreak
}


%mise en page de la page de garde
\makeatletter
\def\maketitle{%
  \thispagestyle{empty}
  {
    \clearpage
    \AddToShipoutPicture*{\BackgroundPicfront}
    \displayLogos
    \selectfontfrontcover
    \vskip 6em~\\
    {\HugeTwelve\textsc{Rapport de Stage \@semester}}
    \vskip 2em~\\
    {\LARGETwelve Pr\'{e}sent\'{e} par \textbf{\@author}}
    \vskip 2em~\\ 
    {\LargeTwelve \textbf{\@title}}
    \vfill ~\\
    {\smallTwelve
    \textbf{Rapport pr\'{e}sent\'{e} et soutenu \`{a} \@lieu, le \@date  \\~\\}
    }
    \begin{small}
    \@jury
    
    \vskip 4em~\\ 
    {\smallTwelve \textbf{Informations Administratives :}}\\
    \newline
    \footnotesizeTwelve
    \begin{tabular}{@{}ll}
    Entreprise :          & \@entreprise \\
    \'{E}tablissement :   & \'{E}cole Nationale d'Ingénieurs de Brest (ENIB) \\
    Dates :   & \@dates \\
    \end{tabular}
    \end{small}
    }
}

\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% QUATRIEME DE COUVERTURE %%%%%%%%%%%%%%%%

\newcommand{\backcoverheader}{%
\thispagestyle{empty}
\hspace{9mm}
\AddToShipoutPicture*{\BackgroundPicback}
\displayLogos
}

\newcommand{\subject}[1]{%
\vspace{0.5cm}
\noindent{\smallTwelve \textbf{Sujet : }#1}
}

\newcommand{\keywords}[1]{%
\vspace{0.5cm}
\noindent{\smallTwelve \textbf{Mot cl\'{e}s : }#1}
}

\newcommand{\compagny}[1]{%
\vspace{0.5cm}
\begin{spacing}{1}
	\noindent\smallTwelve \textbf{Entreprise : }#1
\end{spacing}
}

\newcommand{\resume}[1]{%
\vspace{0.5cm}
\begin{spacing}{1}
	\noindent\smallTwelve \textbf{Travaux Réalisés : }#1
\end{spacing}
}

\newcommand{\conclusion}[1]{%
\vspace{0.5cm}
\begin{spacing}{1}
\noindent\smallTwelve \textbf{Conclusion : }#1
\end{spacing}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% EN-TETES PAGES %%%%%%%%%%%%%%%%

%%%%%%%%% Pour suppirmer les entetes et pied de page gênants par exemple juste avant un chapitre sur une page de droite
\newcommand{\clearemptydoublepage}{%
   \newpage{\pagestyle{empty}\cleardoublepage}}
%%%% .... et utiliser la commande \clearemptydoublepage juste avant le \chapter


\fancyhf{}                       % on annule le fancy automatique
   

%%%%%%%%%% Gerer les en tetes dans les frontmatter mainmatter et backmatter
\RequirePackage{geometry}
\RequirePackage{etoolbox}

\appto\frontmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\chaptermark}[1]{\markboth{\textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\leftmark}   % \rightmark = section courante
    \fancyhead[LE]{\small\leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre
}

\appto\mainmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\textit{\thesection.\ #1}}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ \textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\rightmark}   % \rightmark = section courante
    \fancyhead[LE]{\small \leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre
}     

\appto\backmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ #1}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{}   % \rightmark = section courante
    \fancyhead[LE]{} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre

} 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% FAIRE DES ENCARTS %%%%%%%%%%%%%%%%

\definecolor{fondtitre}{RGB}{85,85,85}
\definecolor{fonddeboite}{RGB}{232,232,232}
\definecolor{shadecolor}{RGB}{232,232,232}

\ProcessOptions

%%%%%%%%%% Boitemagique  %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\boitemagique}[2]{
\begin{center}
\begin{tikzpicture}
% la boite
\node[rectangle,draw=fondtitre!100,fill=fonddeboite!100,inner sep=10pt, inner ysep=20pt] (mabox)
{
\begin{minipage}{12cm}
#2
\end{minipage}
};
% le titre de la boite
\node[fill=fondtitre!100, text=white, rectangle] at (mabox.north) {\sffamily\textbf{#1}};
\end{tikzpicture}
\end{center}
}

%%%%%% boitesimple %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\boitesimple}[1]{%
\begin{center}
\begin{minipage}{12cm}
\begin{shaded}
	#1
\end{shaded}
\end{minipage}
\end{center}
}
