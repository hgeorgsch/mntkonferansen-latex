% Documentclass for MNT-konferansen
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mnt}[2019/01/31 v0.1
^^JLaTeX document class for the Norwegian "MNT-konferansen"]

% Base Class

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions
\LoadClass[a4paper,twoside,11pt]{scrartcl}

% Options

\newif\ifjournal\journalfalse
\DeclareOption{journal}{\journaltrue}
\newif\ifbiblatex\biblatexfalse
\DeclareOption{biblatex}{\biblatextrue}
\ProcessOptions\relax

% Packages

\RequirePackage{babel}
\ifbiblatex
   \usepackage[backend=biber, natbib=true, style=apa]{biblatex}
   \RequirePackage[T1]{fontenc}
   \RequirePackage[utf8]{inputenc}
   % \RequirePackage{fontspec}
   % \setmainfont{Times New Roman}
\else
   \RequirePackage[T1]{fontenc}
   \RequirePackage[utf8x]{inputenc}
   \RequirePackage[round]{natbib}
   % Norwegian characters in headers
   \PrerenderUnicode{æ}
   \PrerenderUnicode{ø}
   \PrerenderUnicode{å}
   \PrerenderUnicode{Æ}
   \PrerenderUnicode{Ø}
   \PrerenderUnicode{Å}
\fi
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{times}
%\RequirePackage{newtxtext,newtxmath}

\RequirePackage{siunitx}
\RequirePackage[vskip=0pt]{quoting}
%\RequirePackage[vskip=0pt,font=itshape]{quoting}

\RequirePackage{caption}
\ifjournal
\captionsetup{font={small},
              labelfont={small,it},
              format=plain,
              labelsep=period,
              % singlelinecheck=false,
              justification=justified}
\else
\captionsetup{font={small,it},
              labelfont={small,it},
              format=plain,
              labelsep=period,
              % singlelinecheck=false,
              justification=justified}
\fi
%\captionsetup[table]{tableposition=top}

% Margins and such
\setlength{\textwidth}{160mm} % 210 mm - 50mm
\setlength{\textheight}{257mm} % 297 mm - 40mm

\setlength\oddsidemargin   {-0.4mm}
\setlength\evensidemargin  {-0.4mm}
\setlength\topmargin  {-5.4mm}
\setlength\marginparwidth  {\z@}

\setlength\headsep   {16\p@}

\advance\textheight by -\headheight
\advance\textheight by -\headsep
\ifjournal
  \advance\topmargin by -\headheight
  \advance\topmargin by -\headsep
\fi

% Spacing and linebreak

\frenchspacing
\widowpenalty=10000
\clubpenalty=10000

\parindent=0pt
\parskip=6pt

\setlength\footnotesep{7.7\p@}
\setlength\textfloatsep{8mm\@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {8mm\@plus 2\p@ \@minus 2\p@}

% Ragged bottom for the actual page
\def\thisbottomragged{\def\@textbottom{\vskip\z@ plus.0001fil
\global\let\@textbottom\relax}}

% OTHER

\ifjournal
  \def\journal#1{\gdef\@journal{#1}}
  \def\Jvolume#1{\gdef\@vol{#1}}
  \def\Jnumber#1{\gdef\@no{#1}}
  \def\Jyear#1{\gdef\@jyear{#1}}
  \journal{}
\else
  \def\conference#1{\gdef\@conf{#1}}
  \conference{}
\fi
\def\firstpage#1{\setcounter{page}{31}} % Starting page number
\def\doi#1{\gdef\@doi{#1}}
\doi{TBA}
\def\makedoi{DOI: \href{http://doi.org/\@doi}{\@doi}}
\setcounter{secnumdepth}{2}

%\let\footnotesize\small

% Sections

\RequirePackage{sectsty,titlecaps}% http://ctan.org/pkg/titlecaps
\sectionfont{\MakeUppercase}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                       {-18\p@ \@plus -4\p@ \@minus -4\p@}%
                       {8\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\normalsize\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                       {-18\p@ \@plus -4\p@ \@minus -4\p@}%
                       {-0.5em \@plus -0.22em \@minus -0.1em}%
                       {\normalfont\normalsize\bfseries\boldmath}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                       {-12\p@ \@plus -4\p@ \@minus -4\p@}%
                       {-0.5em \@plus -0.22em \@minus -0.1em}%
                       {\normalfont\normalsize\itshape}}
\renewcommand\subparagraph[1]{\typeout{MNT warning: You should not use
                  \string\subparagraph\space with this class}\vskip0.5cm
You should not use \verb|\subparagraph| with this class.\vskip0.5cm}

% ????

\setlength\leftmargini  {17\p@}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ \@plus1\p@ \@minus\p@
            \topsep 4\p@ \@plus2\p@ \@minus4\p@
            \itemsep0\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus2\p@ \@minus\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@}

\renewcommand\labelitemii{\normalfont\bfseries --}
\renewcommand\labelitemi{$\m@th\bullet$}
%%% \renewenvironment{quotation}
%%%                {\list{}{\listparindent 1.5em%
%%%                \itemindent    \listparindent
%%%                \rightmargin   \leftmargin
%%%                \topsep       \z@%\@plus\p@%
%%%                \parsep        \z@ \@plus\p@}%
%%%                \item\relax}
%%%                {\endlist}
%%% \renewenvironment{quote}
%%%                {\list{}{\rightmargin\leftmargin%
%%%                \topsep =0pt%        \z@%\@plus\p@
%%%                }%
%%%                \item\relax}
%%%                {\endlist}

\setlength\arraycolsep{1.4\p@}
\setlength\tabcolsep{1.4\p@}


\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width 2truecm
  \kern2.6\p@}
  \newdimen\fnindent
  \fnindent1em
\long\def\@makefntext#1{%
    \parindent \fnindent%
    \leftskip \fnindent%
    \noindent
    \llap{\hb@xt@1em{\hss\@makefnmark\ }}\ignorespaces#1}


\def\@fnsymbol#1{\ensuremath{\ifcase#1\or\star\or{\star\star}\or
   {\star\star\star}\or \dagger\or \ddagger\or
   \mathchar "278\or \mathchar "27B\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

\def\fnmsep{\unskip$^,$}
\def\email#1{{\tt#1}}
\def\homedir{\~{ }}

% Subtitle

\def\clearheadinfo{\gdef\@subtitle{}%
                   \gdef\@thanks{}%
                   }
\def\subtitle#1{\gdef\@subtitle{#1}}
\clearheadinfo

% maketitle

\renewcommand\maketitle{%
  \newpage
  \begingroup
    \parindent=\z@
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
%
    \def\thanks##1{\unskip{}}\def\fnmsep{\unskip}%
%
  \endgroup
  \setcounter{footnote}{0}%
  \clearheadinfo}
%
\def\@maketitle{\newpage
 \begin{center}%
 \vskip 24pt%
 {\fontsize{18}{20}\selectfont%
  \pretolerance=10000%
  \@title \par}%
  \vskip 12pt%
  \if!\@subtitle!\else {\large%
    \vskip -.65cm%
    \pretolerance=10000%
    \@subtitle \par}\vskip .8cm\fi%
 {\noindent\ignorespaces%
  \@author%
  \par%
 }
 \vskip 24pt%
 \end{center}%
}

\renewenvironment{abstract}{\bfseries\abstractname}{}

\newdimen\headlineindent             % dimension for space between
\headlineindent=1.166cm              % number and text of headings.

\setlength\arraycolsep{1.4\p@}
\setlength\tabcolsep{1.4\p@}


% Captions
\renewcommand{\abstractname}{ABSTRACT:}
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Table}
\def\andname{and}
\addto\captionsnynorsk{%
  \renewcommand{\abstractname}{SAMANDRAG:}
  \renewcommand{\contentsname}{Innhaldsliste}
  \renewcommand{\figurename}{Fig.}
  \renewcommand{\tablename}{Tabell}
  \renewcommand\andname{og}
  \sisetup{output-decimal-marker = {,}}
}
\addto\captionsnorsk{%
  \renewcommand{\abstractname}{SAMMENDRAG:}
  \renewcommand{\contentsname}{Innholdsliste}
  \renewcommand{\figurename}{Fig.}
  \renewcommand{\tablename}{Tabell}
  \renewcommand\andname{og}
  \sisetup{output-decimal-marker = {,}}
}

\RequirePackage{xspace}
\newcommand*{\Num}{N\textsuperscript{o}\xspace}

% Running header
\ifjournal
  \RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhead{}
  % \fancyhead[R]{\theauthor}
  \fancyfoot{}
  \fancyfoot[LE,RO]{\thepage}
  \fancyfoot[LO,RE]{\emph{\@journal}\ifdefined\@vol, Vol.\ \@vol\fi%
  \ifdefined\@no, \Num \@no\fi\ifdefined\@jyear\xspace (\@jyear)\fi}
  \fancypagestyle{plain}{}
  \fancypagestyle{plain}{
     \fancyhead[R]{\makedoi}
  }
  \AtBeginDocument{%
       \pagestyle{fancy}
       \thispagestyle{plain}
     }
\else
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\hfill\@conf\hfill}
  \def\@oddhead{\hfill\@conf\hfill}
\fi

\endinput
