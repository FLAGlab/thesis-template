%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%% The file `misis.cls', created on <September 2019> by
%% Nicolás Cardozo  (n.cardozo@uniande.edu.co) at Universidad de los Andes
%%
%% This class is used to create thesis documents for the MISIS program at Universidad de los Andes


%% La portada de la tesis y añade una página de derechos, en el caso que no se deseen ceder los derechos.
%% Ademas incluye una version distinta de pagina de resumen y de notación. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%   ***********************************
%   *         IDENTIFICATION          *
%   ***********************************
%

\ProvidesClass{misis}[2019/09/16 v1.0 Thesis class]


%   ***********************************
%   *      BASIC PACKAGES         *
%   ***********************************

\RequirePackage{ifthen}
\RequirePackage{ifdraft}
\RequirePackage{ifxetex}
\RequirePackage{mathrsfs}
\RequirePackage{yfonts}
\RequirePackage{amsthm}
\RequirePackage{paralist}
\RequirePackage{amsmath}
\RequirePackage{cases}   
\RequirePackage{multirow}
\RequirePackage{paralist}
\RequirePackage{beramono} %listings font
\RequirePackage{textcomp}   

\newboolean{print}
\setboolean{print}{false}
\DeclareOption{print}{\setboolean{print}{true}}

\newboolean{comments}
\setboolean{comments}{false}
\newboolean{showcomments}
\setboolean{showcomments}{false}
\DeclareOption{comments}{%
  \setboolean{comments}{true}
  \setboolean{showcomments}{true}}
  
\DeclareOption*{% pass unknown options to scrbook
  \PassOptionsToClass{\CurrentOption}{scrbook}}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[10pt,bibliography=totoc,version=first,index=totoc,cleardoublepage=empty]{scrbook}

%   ***********************************
%   *       PACKAGE READING           *
%   ***********************************

\RequirePackage{amssymb}
\let\labelindent\relax
\RequirePackage[inline]{enumitem}

\ifxetex
  \RequirePackage{xunicode}
  \RequirePackage{xltxtra}
  \RequirePackage{fontspec}
  % Mapping=tex-text makes ligatures and smart quotes work
  \defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
  % Latin Modern
  % see http://www.gust.org.pl/projects/e-foundry/latin-modern/download
  \setmainfont{Latin Modern Roman}
  \setromanfont[SmallCapsFont={Latin Modern Roman Caps}]{Latin Modern Roman}
  \setsansfont{Latin Modern Sans}
  \setmonofont[SmallCapsFont={Latin Modern Mono Caps}]{Latin Modern Mono}
  %\setmonofont{Monaco}
  %\setsansfont{Lucida Grande}
  %\setkomafont{chapter}{\fontsize{30}{30}\fontspec{Lucida Grande}}
\else
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage{lmodern}
\fi
%   ***********************************
%   *           MAIN CODE             *
%   ***********************************
%

\RequirePackage{geometry}

\renewcommand{\arraystretch}{1}\addtolength{\tabcolsep}{0in}

\AtEndOfClass{\raggedbottom}

\RequirePackage[english]{babel}
\selectlanguage{english}

\RequirePackage{url}
\DeclareUrlCommand\formatdoi{\urlstyle{rm}}

%\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{prop}{Proposition}[chapter]
\newtheorem{cor}{Corollary}[theorem]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{definition}{Definition}[chapter]
\newtheorem{ex}{Example}[chapter]
\newtheorem{notation}{Notation}[chapter]

% Avoid italics in examples (it's awful to read)
\let\origEx\ex
\let\origendEx\endex
\renewenvironment{ex}{\origEx\upshape}{\origendEx}

\RequirePackage{graphicx}
\graphicspath{{figures/}}
\RequirePackage{caption}
\RequirePackage{subcaption}  
\RequirePackage[figuresright]{rotating}
\RequirePackage{lscape}

\RequirePackage{tabularx}
\RequirePackage{tabu,longtable}
\RequirePackage{tablefootnote}
\RequirePackage{booktabs}

\RequirePackage[table,usenames,dvipsnames, svgnames]{xcolor}
\RequirePackage{footnote}
\RequirePackage{fmtcount}

\RequirePackage[plain]{fancyref}
\def\cref{\Cref}
\def\fref{\Fref} % treat all \frefs as \Frefs

\ifthenelse{\boolean{print}}%
{% print version
  \providecommand{\href}[2]{#2}
  \providecommand{\nolinkurl}[1]{\url{#1}}
  \providecommand{\doi}[1]{DOI \formatdoi{#1}}}
{% screen version
  \RequirePackage[pdfstartview=fitV, colorlinks=false, citecolor=red]{hyperref}
  %\RequirePackage[open, openlevel=2, atend]{bookmark}[2008/08/08]
  % make a DOI reference that works with hyperref
  \providecommand{\doi}[1]{DOI
    \href{http://dx.doi.org/#1}{\formatdoi{#1}}}}

\RequirePackage[numbers]{natbib}
\AtBeginDocument{
  \renewcommand{\bibname}{References} % should go after fancyref
  \setbibpreamble{The references are sorted alphabetically by first
    author.\par\medskip}
  \bibliographystyle{plainnat}}

\RequirePackage[smaller, printonlyused]{acronym}
\renewcommand*{\chapterformat}{\acresetall% reset acronyms
  \thechapter\enskip} % original definition
  
  
% ---Set spacing commands for single, single and half and double space -----
\def\singlespace{\def\baselinestretch{1.0}\large\normalsize}
\ifnum \@ptsize = 0
    \def\baselinestretch{1.67}\large\normalsize
    \def\singleandhalfspace{\def\baselinestretch{1.25}\large\normalsize}
    \def\doublespace{\def\baselinestretch{1.67}\large\normalsize}
\else
    \ifnum \@ptsize = 1
        \def\baselinestretch{1.62}\large\normalsize
        \def\singleandhalfspace{\def\baselinestretch{1.21}\large\normalsize}
        \def\doublespace{\def\baselinestretch{1.62}\large\normalsize}
    \else
        \def\baselinestretch{1.66}\large\normalsize
        \def\singleandhalfspace{\def\baselinestretch{1.24}\large\normalsize}
        \def\doublespace{\def\baselinestretch{1.66}\large\normalsize}
    \fi
\fi


%---Set declarative data on the document------

\def\reference#1{\gdef\@reference{#1}}
\def\title#1{\gdef\@title{#1}}
\def\authorA#1{\gdef\@authorA{#1}}
\def\authorB#1{\gdef\@authorB{#1}}
\def\authorC#1{\gdef\@authorC{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\sponsoringentity#1{\gdef\@sponsoringentity{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\departament#1{\gdef\@departament{#1}}
\def\dateA#1{\gdef\@dateA{#1}}
\def\dateM#1{\gdef\@dateM{#1}}
\def\advisorA#1{\gdef\@advisorA{#1}}
\def\advisorB#1{\gdef\@advisorB{#1}}
\def\promoterA#1{\gdef\@promoterA{#1}}
\def\promoterB#1{\gdef\@promoterB{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\long\def\abstract#1{\gdef\@abstract{#1}}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\long\def\symbols#1{\gdef\@symbols{#1}}
\long\def\conv#1{\gdef\@conv{#1}}

% ---Set standar header for all pages--------------------
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\S \thesection \hfil \rmfamily \lowercase{\thepage}}%
    \def\@oddhead{\S \thesection \hfil \rmfamily \lowercase{\thepage}}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble}

\def\ps@myheadingsA{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\rmfamily \thepage\hfil}%
    \def\@oddhead{ \hfil \rmfamily }%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble}

\def\ps@plain{\let\@mkboth\markboth
\def\@oddfoot{}\def\@evenfoot{}             % no feet
\def\@oddhead{\hbox{}\hfil\rmfamily\lowercase{\thepage}}        % heading (right)
\def\@evenhead{\rmfamily\thepage\hfil\hbox{}}}      % heading (left)
    

% ---Command to generate rights page----------------------------------
\newcommand*{\makecopyrightpage}{
  \newpage
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{flushleft}
    \copyright\ Copyright by \@authorA, \@dateA. \\
    Universidad de los Andes, All rights reserved.
  \end{flushleft}
  \clearpage}


% ---Command to generate content table----------------------------------
\setcounter{tocdepth}{2}
\def\tableofcontents{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\contentsname
        \@mkboth{\uppercase{\contentsname}}{\uppercase{\contentsname}}}%
  {\singlespace\@starttoc{toc}}\if@restonecol\twocolumn\fi}

\def\l@chapter{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

% ---Command to generate table of figures ----------------------------------

\def\listoffigures{
  \newpage
  \thispagestyle{plain}
  \chapter*{\listfigurename\@mkboth{\uppercase{\listfigurename}}%
{\uppercase{\listfigurename}}}
   \addcontentsline{toc}{chapter}{\protect \listfigurename}
   {\singlespace\@starttoc{lof}}
   \clearpage
   }

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

% ---Command to generate listing of tables----------------------------------

\def\listoftables{
  \newpage
  \chapter*{\listtablename\@mkboth{\uppercase{\listtablename}}%
{\uppercase{\listtablename}}}
   \addcontentsline{toc}{chapter}{\protect \listtablename}
   {\singlespace\@starttoc{lot}}
   \clearpage
   }

\let\l@table\l@figure

% ---Command to generate listing of Symbols----------------------------------

\newcommand{\listsymbols}{Symbol List}

\def\listofsymbols{
  \newpage
  \setlength{\labelwidth}{40mm}%
  \setlength{\labelsep}{0pt}%
  \setlength{\leftmargin}{\labelwidth}
  \chapter*{\listsymbols\@mkboth{\uppercase{\listsymbols}}%
{\uppercase{\listsymbols}}}
   \addcontentsline{toc}{chapter}{\protect \listsymbols}
    \singlespace
    \@symbols
    \@starttoc{sym}  
   \clearpage
}

%\newcommand{\symbol}[2]{\addcontentsline{sym}{symbol}{\protect #1, #2}}
%\newcommand{\l@symbol}[2]{\par #1 {\itshape #2}}

\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}


% FIGURE

%\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

% TABLE
%
%\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\table{\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}

% ---Command to generate special headers----------
\newcommand{\header}[1]{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pagestyle{myheadings}
    {\noindent\huge\bfseriesseries #1}
    \singlespace
    \vspace{3\baselineskip}}

% ---Command to generate department's observation sheets------------
\newcommand{\observationname}{Department Observation Sheet}
\newcommand{\departmentobservations}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \addcontentsline{toc}{\protect chapter}{Department Observation Sheet}
    \mbox{}}


%    ****************************************
%    *                   LISTINGS                  *
%    ****************************************
\RequirePackage{listings}

\lstdefinelanguage{json}{
    basicstyle=\normalfont\ttfamily,
    numbers=left,
    numberstyle=\scriptsize,
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    breaklines=true,
    frame=lines,
    backgroundcolor=\color{background},
    literate=
     *{:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1},
}

\lstdefinestyle{floating}
 {frame=none,
  float=htbp,
  captionpos=b,
  aboveskip=-0.5pt,
  belowskip=-1pt,
  abovecaptionskip=-1pt}

\colorlet{punct}{red!60!black}
\definecolor{background}{HTML}{EEEEEE}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}
  
%Scala definition
\lstdefinestyle{scala}
 {language=Java,
  showstringspaces=false,
  keywordstyle=\ttfamily\bfseries,
  stringstyle=\color{blue}\ttfamily,
  commentstyle=\color{gray}\ttfamily,
  tabsize=3,  
  style=floating,
  backgroundcolor=\color{background},
  breaklines=true,
  belowskip=-0.5 \baselineskip,
  aboveskip=-0\baselineskip,
  morekeywords={val, var}
}

%Python environment    
\lstnewenvironment{oscar}[1][]
 {\lstset{style=scala,#1}}{}  

\lstnewenvironment{code}[1][]
{\lstset{numbers=left,escapechar=`,caption=b,basicstyle=\small\ttfamily,#1}}{}

\newcommand{\scode}[1]{\textrm{\texttt{#1}}}
\def\sdcode{\lstinline[style=scala]}
 

%    ****************************************
%    *                   PACKAGES               *
%    ****************************************
\RequirePackage{fancybox}

%\RequirePackage[bf]{subfigure}

\RequirePackage{relsize}

\RequirePackage{bibentry}
\AtBeginDocument{\nobibliography*} % enable \bibentry{} commands

%\RequirePackage{scrlfile}
%\ReplacePackage{scrpage2}{scrlayer-scrpage}
%\clearscrheadfoot
%\ohead{\pagemark}
%\ihead{\headmark}
%\setheadsepline{.4pt}
%\renewcommand*{\chaptermarkformat}{} % remove chapter number
%\pagestyle{scrheadings}
%\setkomafont{pagehead}{\normalfont\sffamily}

\RequirePackage{imakeidx}
\citeindextrue % ask natbib to include citations in the index
\makeindex[title=List of Terms] % request makeidx package to build an index
\makeindex[name=symbols, title=List of Symbols, options=-s latex.ist -c, intoc, columns=2]


% Utilities
\RequirePackage{xspace,keyval,longtable,afterpage,isodate}


% Fonts
\RequirePackage{bbding}

\RequirePackage{fmtcount}
\let\saved@ordinalnum=\ordinalnum
\AtBeginDocument{\renewcommand{\ordinalnum}[1]{%
    \selectlanguage{english}\expandafter\saved@ordinalnum#1%
    \selectlanguage{british}}}

\RequirePackage{stmaryrd,pifont}

%% Pictures
\RequirePackage{tikz}
\RequirePackage{tikz-qtree}

% Comments
\definecolor{author}{rgb}{.0, .0, .0}
\definecolor{comment}{rgb}{.1, .8, .2}
\definecolor{note}{rgb}{.2, .4, .7}
\definecolor{idea}{rgb}{.3, .1, .6}
\definecolor{missing}{rgb}{.9, .0, .0}
\definecolor{change}{rgb}{.0, .9, .0}

\RequirePackage{xparse}

\newcommand{\commentedout}[1]{}     

\newcommand{\authorcomment}[3][comment]
  {\ifthenelse{\boolean{showcomments}}
  {\noindent
      \fbox{\footnotesize\textcolor{author}{\textsc{#2}}}
      \textcolor{#1}{\textsl{#3}}}{}}

%List of Symbols
\def\listofnotations{\input symbols.tex \clearpage}
\def\addnotation #1: #2#3{$#1$\> \parbox{5in}{#2 \dotfill  \pageref{#3}}\\}
\def\newnot#1{\label{#1}}

% to be used when defining special words or concepts in the text
\newcommand{\termdef}[2][]{\textbf{#2}%
  \ifthenelse{\equal{#1}{}}{\index{#2}}{\index{#1}}}

% important terms in the running text   
\newcommand{\specialterm}[2][]{\textit{#2}%
  \ifthenelse{\equal{#1}{}}{\index{#2}}{\index{#1}}}

% text written in another language (e.g. latin, french)
\newcommand{\foreignlang}[1]{\textsl{#1}}

% a figurative allusion in the text
\newcommand{\figurative}[1]{``#1''}

% text which is supposed to mean what it says, but it does not
\newcommand{\supposedly}[1]{``#1''}

% text which literally means what it says
\newcommand{\literal}[1]{``#1''}

\RequirePackage{titlesec}
\RedeclareSectionCommands{section}
\RedeclareSectionCommands{subsection}
\RedeclareSectionCommands{subsubsection}
\RedeclareSectionCommands{paragraph}
%\microtypesetup{expansion=false}%


\definecolor{halfgray}{gray}{0.55} % chapter numbers will be semi transparent .5 .55 .6 .0


% --------------- Floating
% lst delimiter
\newcommand*{\fancyreflstlabelprefix}{lst}
\newcommand*{\Freflstname}{\lstlistingname}
\newcommand*{\freflstname}{\MakeLowercase{\lstlistingname}}
\Frefformat{vario}{\fancyreflstlabelprefix}%
  {\Freflstname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyreflstlabelprefix}%
  {\freflstname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyreflstlabelprefix}%
  {\Freflstname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyreflstlabelprefix}%
  {\freflstname\fancyrefdefaultspacing#1}
  
% ln delimiter
\newcommand*{\fancyreflnlabelprefix}{ln}
\newcommand*{\Freflnname}{Line}
\newcommand*{\freflnname}{\MakeLowercase{\Freflnname}}
\Frefformat{vario}{\fancyreflnlabelprefix}%
  {\Freflnname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyreflnlabelprefix}%
  {\freflnname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyreflnlabelprefix}%
  {\Freflnname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyreflnlabelprefix}%
  {\freflnname\fancyrefdefaultspacing#1}

% apx delimiter
\newcommand*{\fancyrefapxlabelprefix}{apx}
\newcommand*{\Frefapxname}{Appendix}
\newcommand*{\frefapxname}{\MakeLowercase{\Frefapxname}}
\Frefformat{vario}{\fancyrefapxlabelprefix}%
  {\Frefapxname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyrefapxlabelprefix}%
  {\frefapxname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyrefapxlabelprefix}%
  {\Frefapxname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyrefapxlabelprefix}%
  {\frefapxname\fancyrefdefaultspacing#1}

% grm delimiter
\newcommand*{\fancyrefgrmlabelprefix}{grm}
\newcommand*{\Frefgrmname}{Grammar}
\newcommand*{\frefgrmname}{\MakeLowercase{\Frefgrmname}}
\Frefformat{vario}{\fancyrefgrmlabelprefix}%
  {\Frefgrmname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyrefgrmlabelprefix}%
  {\frefgrmname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyrefgrmlabelprefix}%
  {\Frefgrmname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyrefgrmlabelprefix}%
  {\frefgrmname\fancyrefdefaultspacing#1}

\renewcommand{\lstlistingname}{Snippet}
\renewcommand{\Frefenumname}{Requirement}
\renewcommand{\frefsecname}{Section}
\renewcommand{\frefeqname}{Rule}

% thm delimiter
\newcommand*{\fancyrefthmlabelprefix}{thm} % define thm delimiter
\newcommand*{\Frefthmname}{Theorem}%
\newcommand*{\frefthmname}{\MakeLowercase{\Frefthmname}}%
\Frefformat{vario}{\fancyrefthmlabelprefix}%
  {\Frefthmname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyrefthmlabelprefix}%
  {\frefthmname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyrefthmlabelprefix}%
  {\Frefthmname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyrefthmlabelprefix}%
  {\frefthmname\fancyrefdefaultspacing#1}

% def delimiter
\newcommand*{\fancyrefdeflabelprefix}{def} % define def delimiter
\newcommand*{\Frefdefname}{Definition}%
\newcommand*{\frefdefname}{\MakeLowercase{\Frefdefname}}%
\Frefformat{vario}{\fancyrefdeflabelprefix}%
  {\Frefdefname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyrefdeflabelprefix}%
  {\frefdefname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyrefdeflabelprefix}%
  {\Frefdefname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyrefdeflabelprefix}%
  {\frefdefname\fancyrefdefaultspacing#1}

% lem delimiter
\newcommand*{\fancyreflemlabelprefix}{lem} % define lem delimiter
\newcommand*{\Freflemname}{Lemma}%
\newcommand*{\freflemname}{%
 \MakeLowercase{\Freflemname}}%
\Frefformat{vario}{\fancyreflemlabelprefix}%
  {\Freflemname\fancyrefdefaultspacing#1#3}
\frefformat{vario}{\fancyreflemlabelprefix}%
  {\freflemname\fancyrefdefaultspacing#1#3}
\Frefformat{plain}{\fancyreflemlabelprefix}%
  {\Freflemname\fancyrefdefaultspacing#1}
\frefformat{plain}{\fancyreflemlabelprefix}%
  {\freflemname\fancyrefdefaultspacing#1}

% ex delimiter
\newcommand*{\fancyrefexlabelprefix}{ex} % define ex delimiter
\fancyrefaddcaptions{english}{%
  \providecommand*{\frefexname}{example}%
  \providecommand*{\Frefexname}{Example}%
}
\frefformat{plain}{\fancyrefexlabelprefix}{\frefexname\fancyrefdefaultspacing#1}
\Frefformat{plain}{\fancyrefexlabelprefix}{\Frefexname\fancyrefdefaultspacing#1}
\frefformat{vario}{\fancyrefexlabelprefix}{%
  \frefexname\fancyrefdefaultspacing#1#3}
\Frefformat{vario}{\fancyrefexlabelprefix}{%
  \Frefexname\fancyrefdefaultspacing#1#3}

%------------------------------------------------------------------------------
%Latins
\newcommand{\eg}{\emph{e.g.,}\xspace}
\newcommand{\ie}{\emph{i.e.,}\xspace}
\newcommand{\cf}{\emph{cf.}\xspace}
\newcommand{\uniandes}{Universidad de los Andes\xspace}


\pagenumbering{arabic}  


\endinput

