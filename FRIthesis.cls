%%
%% This is file `FRIreport.cls'
%%
%% Originaly based on 'book.cls' 2005/09/16 v1.4f Standard LaTeX document class
%% generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3b
%% of this license or (at your option) any later version.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{FRIthesis}[2018/02/20 v1.3 FRIteza LaTeX thesis class]

%TODO:
%refactor
%\textt and \textsf for rm, it, bf, bfit
%draft with no color and "zoomed-in"
%
%!! figure sizes intext, outofbounds - align to fulpage, fullpage, spread!
%        instructions
%
%\RequirePackage{ifluatex}
%\ifluatex
%\PackageWarningNoLine {xltxtra} {^^J
%	XLTXTRA IS TO BE USED ONLY UNDER XETEX.
%	LOAD FONTSPEC DIRECTLY, INSTEAD.^^J
%	ABORTING LOADING%
%}
%\RequirePackage{fontspec}
%\expandafter \endinput
%\fi
%\RequirePackage{ifxetex}
%\RequireXeTeX

\newif\if@restonecol \@twocolumnfalse
\newif\if@titlepage \@titlepagetrue
\newif\if@openright \@openrighttrue
\newif\if@mainmatter \@mainmattertrue
\newif\if@slovene \@slovenefalse
\newif\if@forreview \@forreviewfalse
\newif\if@notes \@notesfalse
\newif\if@BVSRI \@BVSRIfalse
\newif\if@BUNRI \@BUNRIfalse
\newif\if@BUNRM \@BUNRMfalse
\newif\if@BSc \@BScfalse
\newif\if@MSc \@MScfalse
\newif\if@PhD \@PhDfalse
\newif\if@PhDp \@PhDpfalse
\newif\if@Presern \@Presernfalse
\newif\if@funded \@fundedfalse
\newif\if@press \@pressfalse

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{forreview}{\@forreviewtrue}
\DeclareOption{notes}{\@notestrue}
\DeclareOption{slovene}{\@slovenetrue}
\DeclareOption{english}{\@slovenefalse}
\DeclareOption{funded}{\@fundedtrue}
\DeclareOption{press}{\@presstrue}
\DeclareOption{BVSRI}{\@BVSRItrue \@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{BUNRI}{\@BVSRIfalse \@BUNRItrue \@BUNRMfalse\@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{BUNRM}{\@BVSRIfalse\@BUNRIfalse \@BUNRMtrue \@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{BSc}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse \@BSctrue \@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{MSc}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse \@MSctrue \@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{PhD}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse \@PhDtrue \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{PhDp}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse \@PhDfalse \@PhDptrue \@Presernfalse \@titlepagefalse \@twosidefalse \@mparswitchfalse}
\DeclareOption{Presern}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Preserntrue \@titlepagetrue}
\ExecuteOptions{twoside,slovene,BSc}
\ProcessOptions

\input{bk9.clo}

\special{pdf:minorversion 7}

% Resolves "No room for a new \count" error that seems to be caused by the combination biblatex+floatrow
\RequirePackage{etex}
\reserveinserts{20}

\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\ifxetex
  \RequirePackage[log-declarations=false]{xparse}
  \RequirePackage{microtype} 
  \RequirePackage{realscripts} % for propper supser/subscripts loaded also by xltxtra
  
  \RequirePackage{polyglossia}
  \if@slovene
    \setmainlanguage{slovenian}
    \setotherlanguage{english}
  \else
    \setmainlanguage{english}
    \setotherlanguage{slovenian}
  \fi

	\RequirePackage{amsmath} % must be loaded before unicode-math to avoid conflicts
	\RequirePackage[math-style=french,bold-style=upright]{unicode-math}

	\setmathfont{XITS Math} % base font
	%\setmathfont{Asana Math} % base font until v1.2.20170526
	%\setmathfont{EB Garamond} % To use in the future?

	\setmathfont[
	    Path=fonts/EBGaramond/,
		range=\mathup/{num,latin,Latin,greek,Greek}, 
		Ligatures={TeX},
		Numbers={Lining}, 
		SizeFeatures={
			{Size=-8, Font={EBGaramond08-Regular.otf}},
			{Size= 8-, Font=*}
		}
	]
	{EBGaramond12-Regular.otf}
	\setmathfont[
		Path=fonts/EBGaramond/,
		range=\mathbfup/{num,latin,Latin,greek,Greek},
		Ligatures={TeX},
		Numbers={Lining}, 
		FakeBold=1.5,
		SizeFeatures={
			{Size=-8, Font={EBGaramond08-Regular.otf}},
			{Size= 8-, Font=*}
		}
	]
	{EBGaramond12-Regular.otf}
	\setmathfont[
		Path=fonts/EBGaramond/,
		range=\mathit/{latin,Latin,greek,Greek},
		Ligatures={TeX},
		Numbers={Lining},
		SizeFeatures={
			{Size=-8, Font={EBGaramond08-Italic.otf}},
			{Size= 8-, Font=*}
		}
	]
	{EBGaramond12-Italic.otf}
	\setmathfont[
		Path=fonts/EBGaramond/,
		range=\mathbfit/{latin,Latin,greek,Greek},
		Ligatures={TeX},
		Numbers={Lining}, 
		FakeBold=1.5,
		SizeFeatures={
			{Size=-8, Font={EBGaramond08-Italic.otf}},
			{Size= 8-, Font=*}
		}
	]
	{EBGaramond12-Italic.otf}
	
	\setmainfont[
		Path=fonts/EBGaramond/,
		Ligatures={TeX,Discretionary},
		UprightFeatures={
			SizeFeatures={
				{Size=-8, Font={EBGaramond08-Regular.otf}},
				{Size= 8-, Font={EBGaramond12-Regular.otf}}
			}
		}, 
		ItalicFont={EBGaramond12-Italic.otf},
		ItalicFeatures={
			SizeFeatures={
				{Size=-8, Font={EBGaramond08-Italic.otf}},
				{Size= 8-, Font={EBGaramond12-Italic.otf}}
			}
		},
		Mapping=tex-text,
		Numbers={OldStyle},
		AutoFakeBold=1.5
	]
	{EBGaramond12-Regular.otf}
	
	\setsansfont[
		Path=fonts/SourceSansPro/,
		Mapping=tex-text, 
		Ligatures={TeX}, 
		Numbers={OldStyle}, 
		UprightFont={*-Regular.otf},
		ItalicFont={*-It.otf},
		BoldFont={*-Semibold.otf},
		BoldItalicFont={*-SemiboldIt.otf},
		Scale=MatchLowercase
	]
	{SourceSansPro}
	
	\setmonofont[
		Path=fonts/SourceCodePro/,
		Mapping=tex-text, 
		Ligatures={TeX}, 
		UprightFont={*-Regular.otf},
		ItalicFont={*-It.otf},
		BoldFont={*-Semibold.otf},
		BoldItalicFont={*-SemiboldIt.otf},
		Numbers={OldStyle}, 
		Scale=MatchLowercase
	]
	{SourceCodePro}
	
\else
  \RequirePackage{ebgaramond}
  \RequirePackage[cmintegrals,cmbraces]{newtxmath} 
  \RequirePackage{ebgaramond-maths} 

  \RequirePackage[utf8]{inputenc}
  \if@slovene
   \RequirePackage[english,slovene]{babel}
  \else
   \RequirePackage[slovene,english]{babel}
  \fi
  \ifpdf
    \RequirePackage[pdftex]{color}
  \else
    \RequirePackage[dvipdfm]{color}
  \fi
\fi
\RequirePackage{graphicx}
\RequirePackage{xltxtra} % for vulgar fractions and logos

\ifpdf
  \RequirePackage{epstopdf}
\fi
\RequirePackage{xcolor}
\definecolor{grey65}{cmyk}{0,0,0,.65}
\definecolor{grey50}{cmyk}{0,0,0,.5}
\definecolor{grey40}{cmyk}{0,0,0,.4}
\definecolor{grey20}{cmyk}{0,0,0,.2}
\definecolor{grey05}{cmyk}{0,0,0,.05}
\definecolor{PCG3M}{cmyk}{0.20,0.15,0.14,0}
\definecolor{PCG9M}{cmyk}{0.48,0.39,0.37,0.03}
\definecolor{P654M}{cmyk}{1,0.87,0.32,0.19}
\definecolor{P1797}{cmyk}{0,0.94,0.94,0.06}

%P424
%P654M
%P1797U 0, 100, 99, 4
%P1797C 0, 100, 100, 0

\RequirePackage{anysize,layout}%,amsthm}
\RequirePackage{boxedminipage}
\RequirePackage{pdftexcmds}
\ifxetex
\else
 \RequirePackage{amssymb}
 \RequirePackage{amsmath}
\fi
\@ifundefined{@xp}{\let\@xp\expandafter}{}
\RequirePackage{numprint} % should  be loaded with autolanguage
\if@slovene
 \npdecimalsign{,}
\else
 \npdecimalsign{.}
\fi

\setlength\overfullrule{0pt}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5} %.5
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

% quite neet large figs in text
%\setcounter{topnumber}{1}
%\renewcommand\topfraction{.8}
%\setcounter{bottomnumber}{1}
%\renewcommand\bottomfraction{.3}
%\setcounter{totalnumber}{3}
%\renewcommand\textfraction{.01}
%\renewcommand\floatpagefraction{.8} %.5
%\setcounter{dbltopnumber}{1}
%\renewcommand\dbltopfraction{.4}
%\renewcommand\dblfloatpagefraction{.4}

% define macro for singlelinespacing TODO!! --- define spacing for large fonts!!!!
\newcommand{\setsinglelinespacing}{}%{\setlength{\baselineskip}{.67\baselineskip}}%{.8\baselineskip}}

% create a sidenote with text #2 referencing #1
\newcommand{\sidecmnt}[2]{\if@notes{{\color{grey65}{#1}\normalcolor}\marginpar{\raggedright\hspace{0pt}\tiny\color{P1797}{\sf #2}\normalcolor}}\else{#1}\fi}
\newcommand{\cmnt}[1]{\if@notes{\color{grey65}{#1}\normalcolor}\else{}\fi}

% define page styles
\def\cleardoublepage{
 \clearpage
 \if@twoside
  \ifodd
   \c@page
  \else
   \hbox{}\thispagestyle{empty}
   \newpage
   \if@twocolumn
    \hbox{}
    \thispagestyle{empty}
    \newpage
   \fi
  \fi
 \fi
}
\def\ps@plain{
  \ps@empty
  \if@forreview
   \def\@oddfoot{\hfil\normalfont\footnotesize\thepage\hfil\sffamily\footnotesize\today}
  \else
   \def\@oddfoot{\hfil\normalfont\footnotesize\thepage\hfil}
  \fi
  \let\@evenfoot\@oddfoot
}
\def\ps@chapter{
  \ps@empty
  \if@forreview
   \def\@oddfoot{\hfil\normalfont\footnotesize\if@isChapterPage\color{white}\fi\thepage\hfil\sffamily\footnotesize\today\normalcolor}
  \else
   \def\@oddfoot{\hfil\normalfont\footnotesize\if@isChapterPage\color{white}\fi\thepage\normalcolor\hfil}
  \fi
  \let\@evenfoot\@oddfoot
}
\def\ps@headings{
   \if@forreview
    \def\@oddfoot{\hfil\sffamily\scriptsize\today}
   \else
    \let\@oddfoot\@empty
   \fi
   \let\@evenfoot\@oddfoot
   \def\@evenhead{\thepage\hfil{\small\scshape\leftmark}\hfil}%
   \def\@oddhead{\hfil{\small\scshape\rightmark}\hfil\thepage}%
   \let\@mkboth\markboth
   \def\chaptermark##1{%
    \markboth {{%
     \ifnum \c@secnumdepth >\m@ne
      \thechapter \ %
     \fi
     ##1}}{}}%
   \def\sectionmark##1{%
    \markright {{%
     \ifnum \c@secnumdepth >\z@
      \thesection \ %
     \fi
     ##1}}}
}

% TODO: reorder so that page setup is first
\RequirePackage{calc}
\newlength{\gW}\setlength{\gW}{6.13in/9}
\RequirePackage{fancyhdr}
\fancypagestyle{fancybook}{%
     \fancyhf{}%
     % Note the ## here. It's required because \fancypagestyle is making a macro (\ps@fancybook).
     % If we just wrote #1, TeX would think that it's the argument to \ps@fancybook, but
     % \ps@fancybook doesn't take any arguments, so TeX would complain with an error message.
     % You are not expected to understand this.
     \renewcommand*{\sectionmark}[1]{ \markright{\thesection\ ##1} }%
     \renewcommand*{\chaptermark}[1]{ \markboth{\thechapter\ ##1}{} }%
     % Increase the length of the header such that the folios
     % (typography jargon for page numbers) move into the margin
     \if@twoside
      \fancyhfoffset[LE]{\gW/2}%{9.055mm}%a5{16.5mm}%
     \fi
     \fancyhfoffset[RO]{\gW/2}%{9.055mm}%a5{16.5mm}%
 %     [footmarkpageNo] \fancyhfoffset[LE,RO]{0pt}%{9.055mm}%a5{16.5mm}%
     % Put some space and a vertical par between the folio and the rest of the header
     \renewcommand{\headrulewidth}{0pt}
     \renewcommand{\footrulewidth}{0pt}
      % compute length of skip: offset - width of \ssfamily\textbf{\thepage}
     \if@twoside
      \fancyhead[LE]{{\itshape\thepage\settowidth{\@tempdima}{\thepage}\addtolength{\@tempdima}{-\gW/2}\hspace*{-\@tempdima}}\small\color{grey65}\leftmark}%
 %    \fancyhead[LE]{\small\leftmark}%
      \fancyhead[RE]{\color{grey65}\small\@authorRH}
     \fi
     \fancyhead[LO]{\color{grey65}\small\@titleRH}
     \fancyhead[RO]{\itshape\thepage}%
     %\fancyfoot[LE]{\setlength{\@tempdima}{\gW/2}\hspace*{\@tempdima}\hfill\textcolor{P1797}{\rule{1.3mm}{1.3mm}}\hfill}
     %\fancyfoot[LO]{\hfill\textcolor{P1797}{\rule{1.3mm}{1.3mm}}\hfill\setlength{\@tempdima}{\gW/2}\hspace*{\@tempdima}}
}

\def\ps@proposal{
   \if@forreview
    \def\@oddfoot{\hfil\sffamily\scriptsize\today}
   \else
    \let\@oddfoot\@empty
   \fi
   \let\@evenfoot\@oddfoot
   \def\@evenhead{\thepage\hfil{\small\scshape\leftmark}\hfil}%
   \def\@oddhead{\hfil{\small\scshape\rightmark}\hfil\thepage}%
   \let\@mkboth\markboth
}

\let\@thesisId\@empty
\newcommand{\thesisId}[1]
{
 \renewcommand*{\@thesisId}{%
  \pgfmathsetbasenumberlength{3}%
  \pgfmathdectoBase\mynumber{#1}{16}\mynumber
 }
}
\newcommand\@coverTitle\@title % coverTitle linebreaks
\newcommand\coverTitle[1]{
 \renewcommand{\@coverTitle}{#1}
}
\newcommand\@coverTitleLoc{SE} % SE, SW, NE, NW
\newcommand\coverTitleLoc[1]{
 \renewcommand{\@coverTitleLoc}{#1}
}
\newcommand\@coverTitleColour{P1797} % P1797, white, black, grey65
\newcommand\coverTitleColour[1]{
 \renewcommand{\@coverTitleColour}{#1}
}
\newcommand\@coverImage\@empty
\newcommand\coverImage[1]{
 \renewcommand{\@coverImage}{#1}
}
\newcommand\@thesisPages{0}
\newcommand\thesisPages[1]{
 \renewcommand{\@thesisPages}{#1}
}
\newcommand*{\@paperCaliper}{.120mm}

\newcommand*{\@showCoverAnnotations}{NO}
\newcommand{\showCoverAnnotations}[1]
{
 \renewcommand{\@showCoverAnnotations}{#1}
}

\RequirePackage{hyphenat} % disable hyphenation

\newlength{\@lmW}
\newlength{\@lmH}
\newlength{\@lbW}
\newlength{\@lbH}

\newcommand\makecoverpage{
  \thispagestyle{empty}
% save current geometry: media size, margins, bleed and slug area
  \savegeometry{G}
  \setlength{\@lmW}{\mW}
  \setlength{\@lmH}{\mH}
  \setlength{\@lbW}{\bleedW}
  \setlength{\@lbH}{\bleedH}

% compute cover spine width, page, coverspine, front/back and media size
  \pgfmathsetlengthmacro{\spineW}{(round(\@thesisPages/2)*\@paperCaliper+0*.5mm+6mm)}
  \pgfmathsetlengthmacro{\coverW}{(2*(4mm+\bindingW+\pageW+4mm)+\spineW)}
  \pgfmathsetlengthmacro{\coverH}{(4mm+\pageH+4mm)}
  \pgfmathsetlengthmacro{\coverspineW}{(18mm+\spineW+18mm)}
  \pgfmathsetlengthmacro{\coverfrontW}{((\coverW-\coverspineW)/2)}
  \if@press
   \pgfmathsetlengthmacro{\coverbleed}{15mm}
  \else
   \pgfmathsetlengthmacro{\coverbleed}{0mm}
  \fi
% setup cover geometry: media size, margins, bleed and slug area
  \pgfmathsetlength{\mW}{(\coverW+2*(\coverbleed+\trimMark))}
  \pgfmathsetlength{\mH}{(\coverH+2*(\coverbleed+\trimMark))}
  \pdfpagewidth=\mW \pdfpageheight=\mH
  \paperwidth=\mW \paperheight=\mH
  \setlength{\bleedW}{\coverbleed}
  \setlength{\bleedH}{\coverbleed}
  \setPDFBoxes

% draw cover page
  \pgfmathsetlengthmacro{\sW}{\spineW/2}
  \pgfmathsetlengthmacro{\csW}{\coverspineW/2}
  \pgfmathsetlengthmacro{\ULc}{\trimMark+\bleedW+\coverfrontW/2}
  \pgfmathsetlengthmacro{\CIc}{\trimMark+(\bleedW+\coverfrontW)/2}
  \pgfmathsetlengthmacro{\ciH}{\coverH+2*\coverbleed}
  \pgfmathsetlengthmacro{\ciW}{\ciH/1.5} % expect images in 2:3 ratio w:h
  \pgfmathsetlengthmacro{\TN}{-\trimMark-\bleedH-4mm-\gridH}
  \pgfmathsetlengthmacro{\TS}{\trimMark+\bleedW+4mm+\gridH}
  \pgfmathsetlengthmacro{\TE}{-\trimMark-\bleedW-4mm-\gridW}
  \pgfmathsetlengthmacro{\TW}{\csW+\gridW}

  \begin{tikzpicture}[remember picture,overlay]
  % front
  % --- include 2:3 figure stretched
    \ifthenelse{\equal{\@coverImage}{\@empty}}{}{
     \node at
        ([shift={(-\CIc,0)}]current page.east)
        {\includegraphics[height=\ciH,width=\ciW]{\@coverImage}};
  % --- include single figure centered
  %  \node at
  %      ([shift={(-\ULc,0)}]current page.east)
  %      {\includegraphics[height=\ciH]{\@coverImage}};
    }
    \ifthenelse{\equal{\@coverTitleLoc}{SE}}{
     \node[\@coverTitleColour, anchor=south east] at
        ([shift={(\TE,\TS)}]current page.south east)
        {\begin{minipage}{6\gridW}
         \begin{flushright}\nohyphens{
           \fontsize{18}{19}\selectfont
           \@author\\
           \vspace{30bp}
           \fontsize{24}{24.5}\selectfont
           \emph{\@coverTitle}
         }\end{flushright}
         \end{minipage}
        };
    }{}
    \ifthenelse{\equal{\@coverTitleLoc}{SW}}{
     \node[\@coverTitleColour, anchor=south west] at
        ([shift={(\TW,\TS)}]current page.south)
        {\begin{minipage}{6\gridW}
         \begin{FlushLeft}\nohyphens{
           \fontsize{18}{19}\selectfont
           \@author\\
           \vspace{30bp}
           \fontsize{24}{24.5}\selectfont
           \emph{\@coverTitle}
         }\end{FlushLeft}
         \end{minipage}
        };
    }{}
    \ifthenelse{\equal{\@coverTitleLoc}{NE}}{
    \node[\@coverTitleColour, anchor=north east] at
        ([shift={(\TE,\TN)}]current page.north east)
        {\begin{minipage}{6\gridW}
         \begin{flushright}\nohyphens{
           \fontsize{24}{24.5}\selectfont
           \emph{\@coverTitle}\\
           \vspace{30bp}
           \fontsize{18}{19}\selectfont
           \@author
         }\end{flushright}
         \end{minipage}
        };
    }{}
    \ifthenelse{\equal{\@coverTitleLoc}{NW}}{
     \node[\@coverTitleColour, anchor=north west] at
        ([shift={(\TW,\TN)}]current page.north)
        {\begin{minipage}{6\gridW}
         \begin{FlushLeft}\nohyphens{
           \fontsize{24}{24.5}\selectfont
           \emph{\@coverTitle}\\
           \vspace{30bp}
           \fontsize{18}{19}\selectfont
           \@author
         }\end{FlushLeft}
         \end{minipage}
        };
    }{}

  % back
    \path[fill=P1797]
        ([shift={(-\csW,-\trimMark)}]current page.north)
        rectangle
        ([shift={(\trimMark,\trimMark)}]current page.south west);
    \node at
        ([shift={(\ULc,\trimMark)}]current page.west)
        {\includegraphics{cc/uni-lj-max}};

  % spine
    \path[fill=grey65]
        ([shift={(-\csW,-\trimMark)}]current page.north)
        rectangle
        ([shift={(\csW,\trimMark)}]current page.south);
    \path[fill=P1797]
        ([shift={(-\sW,\trimMark+\bleedH+\ULsquare)}]current page.south)
        rectangle
        ([shift={(\sW,\trimMark)}]current page.south);
    \node[white] at
        ([shift={(0,\trimMark+\bleedH+\ULsquare/2)}]current page.south)
        {\texttt{\fontsize{10}{11}\selectfont{\textbf{\@thesisId}}}};
    \node[white] at
        ([shift={(0,\trimMark+\bleedH+1.5*\ULsquare)}]current page.south)
        {\begin{minipage}{\textwidth}\fontsize{10.5bp}{11bp}\selectfont\centering\texttt{\textbf{FRI}\\PhD}\end{minipage}};
    \node[white] at
        ([shift={(0,\trimMark+\bleedH+2.5*\ULsquare)}]current page.south)
        {\color{grey20}\fontsize{8bp}{9bp}\selectfont\texttt{\textbf{\number\@year}}};
    \node[white, anchor=west, rotate=270] at
        ([shift={(0,-\trimMark-\bleedH-1.5*\ULsquare)}]current page.north)
        {\fontsize{14}{15}\selectfont{\@title}};

  % slug area
    \draw[white, line width=\trimMark]
        ([shift={(\trimMark/2,\trimMark/2)}]current page.south west)
        rectangle
        ([shift={(-\trimMark/2,-\trimMark/2)}]current page.north east);

  % trimmarks
    \draw[black, line width=0.25pt]
        ([shift={(\trimMark+\bleedW,0)}]current page.south west)
        --
        ([shift={(\trimMark+\bleedW,\trimMark)}]current page.south west);
    \draw[black, line width=0.25pt]
        ([shift={(0,\trimMark+\bleedH)}]current page.south west)
        --
        ([shift={(\trimMark,\trimMark+\bleedH)}]current page.south west);
    \draw[black, line width=0.25pt]
        ([shift={(\trimMark+\bleedW,0)}]current page.north west)
        --
        ([shift={(\trimMark+\bleedW,-\trimMark)}]current page.north west);
    \draw[black, line width=0.25pt]
        ([shift={(0,-\trimMark-\bleedW)}]current page.north west)
        --
        ([shift={(\trimMark,-\trimMark-\bleedW)}]current page.north west);
    \draw[black, line width=0.25pt]
        ([shift={(-\trimMark-\bleedW,0)}]current page.south east)
        --
        ([shift={(-\trimMark-\bleedW,\trimMark)}]current page.south east);
    \draw[black, line width=0.25pt]
        ([shift={(0,\trimMark+\bleedW)}]current page.south east)
        --
        ([shift={(-\trimMark,\trimMark+\bleedW)}]current page.south east);
    \draw[black, line width=0.25pt]
        ([shift={(-\trimMark-\bleedW,0)}]current page.north east)
        --
        ([shift={(-\trimMark-\bleedW,-\trimMark)}]current page.north east);
    \draw[black, line width=0.25pt]
        ([shift={(0,-\trimMark-\bleedW)}]current page.north east)
        --
        ([shift={(-\trimMark,-\trimMark-\bleedW)}]current page.north east);

  % job info
    \draw[green, dashed, line width=.25pt]
        ([shift={(-\sW,0)}]current page.north)
        --
        ([shift={(-\sW,-\trimMark)}]current page.north);
    \draw[green, dashed, line width=.25pt]
        ([shift={(\sW,0)}]current page.north)
        --
        ([shift={(\sW,-\trimMark)}]current page.north);
    \node at
        ([shift={(0,-\trimMark/2)}]current page.north)
        {\fontsize{8}{8}\selectfont{\textsf{\pgfmathparse{round(\spineW/1mm)}\pgfmathresult\,mm}}};
    \draw[green, dashed, line width=.25pt]
        ([shift={(-\sW,0)}]current page.south)
        --
        ([shift={(-\sW,\trimMark)}]current page.south);
    \draw[green, dashed, line width=.25pt]
        ([shift={(\sW,0)}]current page.south)
        --
        ([shift={(\sW,\trimMark)}]current page.south);
    \node at
        ([shift={(0,\trimMark/2)}]current page.south)
        {\fontsize{8}{8}\selectfont{\textsf{\@thesisPages\,p}}};

  %% annotations
   \ifthenelse{\equal{\@showCoverAnnotations}{YES}}
   {
  % cover spine
    \draw[grey65, dashed]
        ([shift={(-\csW,-\trimMark)}]current page.north)
        rectangle
        ([shift={(\csW,\trimMark)}]current page.south);
  % midpage line
    \draw[green, dotted]
        (current page.north)
        --
        (current page.south);
  % bleed
    \draw[red, dashed]
        ([shift={(\trimMark+\bleedW,\trimMark+\bleedH)}]current page.south west)
        rectangle
        ([shift={(-\trimMark-\bleedW,-\trimMark-\bleedH)}]current page.north east);
    \draw[green]
        ([shift={(\ULc,0)}]current page.west)
        circle(2.5mm);
    \draw[green]
        ([shift={(\ULc,5mm)}]current page.west)
        --
        ([shift={(\ULc,-5mm)}]current page.west);
    \draw[green]
        ([shift={(\ULc-5mm,0)}]current page.west)
        --
        ([shift={(\ULc+5mm,0)}]current page.west);
    \draw[orange]
        ([shift={(-\CIc,0)}]current page.east)
        circle(2.5mm);
    \draw[orange]
        ([shift={(-\CIc,5mm)}]current page.east)
        --
        ([shift={(-\CIc,-5mm)}]current page.east);
    \draw[orange]
        ([shift={(-\CIc-5mm,0)}]current page.east)
        --
        ([shift={(-\CIc+5mm,0)}]current page.east);
    \draw[green, dashed]
        ([shift={(\TW,\TS)}]current page.south)
        rectangle
        ([shift={(\TE,\TS+1.5\gridH)}]current page.south east);
    \draw[green, dashed]
        ([shift={(\TW,\TN)}]current page.north)
        rectangle
        ([shift={(\TE,\TN-1.5\gridH)}]current page.north east);
   }{}
  \end{tikzpicture}
% end draw cover page

% restore page geometry, media size, margins, bleed and slug area
  \newpage
  \setlength{\mW}{\@lmW}
  \setlength{\mH}{\@lmH}
  \setlength{\bleedW}{\@lbW}
  \setlength{\bleedH}{\@lbH}
  \loadgeometry{G}
  \pdfpagewidth=\mW \pdfpageheight=\mH
  \paperwidth=\mW \paperheight=\mH
  \setPDFBoxes
}

\def\metabox#1{\edef\theprevdepth{\the\prevdepth}\nointerlineskip
  \vbox to0pt{#1\vss}\prevdepth=\theprevdepth}
% bastardtitle
\newif \if@btitle \@btitlefalse
% define titlepage
\if@titlepage
\newcommand\maketitle{
 \begin{titlepage}%
  \if@btitle
    \pagecolor{P1797} % bastard title
    \vspace*{\fill}
    \begin{centering}
      {\LARGE\setsinglelinespacing
      \begingroup
      \color{white}
      \MakeUppercase{\@titleRH}
      \endgroup
      \par}
    \end{centering}
    \vspace*{\fill}
    \cleardoublepage
    \pagecolor{white}
    \thispagestyle{empty}
  \fi
  \if@PhD
  \thispagestyle{empty}
	\begin{centering}
  \vspace*{5\baselineskip}
  {\Large\itshape\setsinglelinespacing%
%    \begingroup
    \color{P1797}
    \@title
%    \endgroup
    \par}

  \if@slovene
  \else
  \vspace*{1.5\baselineskip}
  {\normalsize\scshape%
   A dissertation presented\\
   by}
  \fi

  \vspace*{1.5\baselineskip}
  {\large\upshape%
   \@author}

  \if@slovene
  \vspace*{1.5\baselineskip}
  {\normalsize\scshape\setsinglelinespacing%
  doktorska disertacija\\
  predana\\
  Fakulteti za računalništvo in informatiko\\
  kot del izpolnjevanja pogojev za pridobitev naziva\\
  doktor znanosti\\
  s področja\\
  računalništva in informatike\\
  }\par
  \else
  \vspace*{1.5\baselineskip}
  {\normalsize\scshape\setsinglelinespacing%
  to\\
  The Faculty of Computer and Information Science\\
  in partial fulfilment of the requirements for the degree of\\
  Doctor of Philosophy\\
  in the subject of\\
  Computer and Information Science\\
  }\par
  \fi

  \vfill
  \includegraphics{cc/uni-lj-min}

  {\@place,~\number\@year}

  \end{centering}
  \if@funded
    \cleardoublepage
    \thispagestyle{empty}

    \if@slovene
     \metabox{\vspace{-\baselineskip}%
      \ifx\@companyLogo\empty\relax\else\includegraphics[totalheight=.5\gridH,width=2.5\gridW,keepaspectratio]{\@companyLogo}\fi%
      \hfill%
      \includegraphics[totalheight=.5\gridH,width=2.5\gridW,keepaspectratio]{cc/funding_ess-slo}}
    \else
      \metabox{\vspace{-\baselineskip}%
      \ifx\@companyLogo\empty\relax\else\includegraphics[totalheight=.5\gridH,width=2.5\gridW,keepaspectratio]{\@companyLogo}\fi%
      \hfill%
      \includegraphics[totalheight=.5\gridH,width=2.5\gridW,keepaspectratio]{cc/funding_ess-eng}}
    \fi

    \begin{centering}
    \vspace*{5\baselineskip}
    {\Large\itshape\setsinglelinespacing%
%    \begingroup
      \color{P1797}
      \@title
%    \endgroup
     \par}

    \if@slovene
    \else
    \vspace*{1.5\baselineskip}
    {\normalsize\scshape%
     A dissertation presented\\
     by}
    \fi

    \vspace*{1.5\baselineskip}
    {\large\upshape%
     \@author}

    \if@slovene
    \vspace*{1.5\baselineskip}
    {\normalsize\scshape\setsinglelinespacing%
    doktorska disertacija\\
    predana\\
    Fakulteti za računalništvo in informatiko\\
    kot del izpolnjevanja pogojev za pridobitev naziva\\
    doktor znanosti\\
    s področja\\
    računalništva in informatike\\
    }\par
    \else
    \vspace*{1.5\baselineskip}
    {\normalsize\scshape\setsinglelinespacing%
    to\\
    The Faculty of Computer and Information Science\\
    in partial fulfilment of the requirements for the degree of\\
    Doctor of Philosophy\\
    in the subject of\\
    Computer and Information Science\\
    }\par
    \fi

    \vfill
    \includegraphics{cc/uni-lj-min}

    {\@place,~\number\@year}

    \end{centering}
  \fi
  \else
	\begin{centering}
   {\Large \setsinglelinespacing
 		\if@slovene
 		 Univerza v Ljubljani
 		\else
 		 Univesity of Ljubljana
 		\fi
	  \par}
	 {\large \setsinglelinespacing
		\if@slovene
		 Fakulteta za računalništvo in informatiko
		\else
		 Faculty of Computer and Information Science
		\fi
    \par}
	 \vfill
   {\Large \@author} \\
   \vspace{5mm}
   {\LARGE\itshape\setsinglelinespacing
    \begingroup
    \color{P1797}
    \@title
    \endgroup
    \par}
   \vspace*{10mm}
   {\scshape
    \setsinglelinespacing
    \if@slovene
     \if@BVSRI diplomsko delo \\ visokošolski strokovni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRI diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRM diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in matematika\fi
     \if@BSc diplomska naloga \\ na univerzitetnem študiju\fi
     \if@MSc magistrska naloga\fi
     \if@PhD doktorska disertacija\fi
    \else
     \if@BVSRI diplomsko delo \\ visokošolski strokovni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRI diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRM diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in matematika\fi
     \if@BSc diplomska naloga \\ na univerzitetnem študiju\fi
     \if@MSc magistrska naloga\fi
     \if@PhD a dissertation submitted in partial fulfilment of the requirements \\ for the degree of \\ Doctor of Philosophy \fi
    \fi
    \par}
   \vfill
   {\setsinglelinespacing
    \ifx\@advisor\empty
     \relax
    \else
     \@advisor\\
    	{\small \sc
    	 \if@slovene
  			mentor
 			 \else
  			advisor
 			\fi
 			}
 			\par
 		\fi
    \ifx\@coadvisor\empty
     \relax
    \else
     \vspace{3mm}
     \@coadvisor\\
    	{\small \sc
    	 \if@slovene
  			somentor
 			 \else
  			coadvisor
 			\fi
 			}
 		 \par
 		\fi
 		}
   \vspace*{10mm}
   {\setsinglelinespacing
    \@place, \oldstylenums{\number\@year}
    \par}
   \end{centering}
   \fi
   \cleardoublepage
  \end{titlepage}%
  \setcounter{footnote}{0}%
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
%      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
}
\def\@maketitle{%
  \newpage
  \begin{center}%
    \let \footnote \thanks
    {\normalsize \setsinglelinespacing
		  \if@slovene
       Univerza v Ljubljani
      \else
       University of Ljubljana
      \fi
		  \par}
		 {\small \setsinglelinespacing
       \if@slovene
        Fakulteta za računalništvo in informatiko
       \else
        Faculty of Computer and Information Science
       \fi
		  \par}
		 \vspace{3mm}
		 {\setsinglelinespacing
		  \large \@author
		  \par}
     \vspace{5mm}
     {\large\itshape
        \setsinglelinespacing
         \color{P1797}\@title\normalcolor
        \par}
     \vspace{3mm}
%     {\large\sffamily%\itshape
 %       \setsinglelinespacing
 %        %\color{P1797}\@titleA\normalcolor
%        \@titleA
%        \par}
%     \vspace{4mm}
     \if@slovene
      {\scshape\setsinglelinespacing
       predlog teme doktorske disertacije
       \par}
     \else
      {\scshape\setsinglelinespacing
       a dissertation proposal submitted in partial fulfilment of the requirements for the degree of Doctor of Philosophy
       \par}
     \fi
     \vspace{3mm}
     {\bfseries\ttfamily \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

% define copyright
\newcommand\makecopyright[1][-]{
		\if@openright\cleardoublepage\else\clearpage\fi
%    \edef\@copyright{\uppercase{#1}}
    \thispagestyle{plain}%
		\vspace*{\fill}
    \ifnum\pdf@strcmp{#1}{-}=\z@
     {\small
      \noindent \copyright~\sffamily \number\@year, Univerza v Ljubljani, Fakulteta za računalništvo in informatiko

      Rezultati diplomskega dela so intelektualna lastnina Fakultete za računalništvo in informatiko Univerze v Ljubljani. Za objavljanje ali izkoriščanje rezultatov diplomskega dela je potrebno pisno soglasje Fakultete za računalništvo in informatiko ter mentorja.%
     \footnote{V dogovorju z mentorjem lahko kandidat diplomsko delo s pripadajočo izvorno kodo izda tudi pod katero izmed alternativnih licenc, ki ponuja določen del pravic vsem: npr. Creative Commons, GNU GPL.}
     }
    \fi
    \ifnum\pdf@strcmp{#1}{FRI}=\z@
     {\small
      \noindent \copyright~\sffamily \number\@year, Univerza v Ljubljani, Fakulteta za računalništvo in informatiko

      Rezultati diplomskega dela so intelektualna lastnina Fakultete za računalništvo in informatiko Univerze v Ljubljani. Za objavljanje ali izkoriščanje rezultatov diplomskega dela je potrebno pisno soglasje Fakultete za računalništvo in informatiko ter mentorja.
     }
     \hypersetup{
      pdfcopyright={Copyright (c) \number\@year, Univerza v Ljubljani, Fakulteta za računalništvo in informatiko.},
      pdflicenseurl={http://www.fri.uni-lj.si/licenses}
     }
    \fi
    \ifnum\pdf@strcmp{#1}{CC}=0
     \begin{center}
      \includegraphics*{cc/cc}
      \includegraphics*{cc/by}
      \includegraphics*{cc/sa}
     \end{center}

     {\small \sffamily
      \noindent Delo je ponujeno pod licenco Creative Commons Priznanje avtorstva--Deljenje pod enakimi pogoji 2.5 Slovenija (ali novejšo različico).
      To pomeni, da se tako besedilo, slike, grafi in druge sestavine dela kot tudi rezultati dela lahko prosto distribuirajo,
reproducirajo, uporabljajo, priobčujejo javnosti in predelujejo, pod pogojem, da se jasno in vidno navede avtorja in naslov tega
dela in da se v primeru spremembe, preoblikovanja ali uporabe tega dela v svojem delu, lahko distribuira predelava le pod
licenco, ki je enaka tej.
      Podrobnosti licence so dostopne na spletni strani \href{http://creativecommons.si}{creativecommons.si} ali na Inštitutu za
intelektualno lastnino, Streliška 1, 1000 Ljubljana.%
     }
     \hypersetup{
      pdfcopyright={This work is licensed under a Creative Commons Attribution-ShareAlike 2.5 Slovenia License.},
      pdflicenseurl={http://creativecommons.org/licenses/by-sa/2.5/si/deed.en_GB}
     }
    \fi
    \ifnum\pdf@strcmp{#1}{GNU}=0
     {\small \sffamily
      \noindent Izvorna koda dela, njeni rezultati in v ta namen razvita programska oprema je ponujena pod licenco GNU General Public License, različica 3 (ali novejša). To pomeni, da se lahko prosto distribuira in/ali predeluje pod njenimi pogoji.
      Podrobnosti licence so dostopne na spletni strani \href{http://www.gnu.org/licenses}{gnu.org/licenses}.
     }
     \hypersetup{
      pdfcopyright={This work is licensed under the GNU General Public License.},
      pdflicenseurl={http://www.gnu.org/licenses/gpl.html}
     }
    \fi


		\thispagestyle{empty}
}

% define topic
\newcommand\thesistopic{
		\if@openright\cleardoublepage\else\clearpage\fi
    \thispagestyle{plain}
    \vspace*{\fill}
    \begin{quote}
		{\itshape
     Namesto te strani se \emph{vstavi} original izdane teme diplomskega dela s podpisom mentorja in dekana ter žigom fakultete, ki ga diplomant dvigne v študentskem referatu,  preden odda izdelek v vezavo!
    }
    \end{quote}
    \vspace*{\fill}
		\thispagestyle{empty}
}

\RequirePackage{enumerate}

% define declaration
\newcommand\makedeclaration{
  \if@slovene
   \chapter*{Izjava o avtorstvu diplomskega dela}
  \else
   \chapter*{Declaration of Authorship}
  \fi
  \vspace{20pt}
  \noindent
	\begin{minipage}{\textwidth}
  \if@slovene
    Spodaj podpisani izjavljam, da sem avtor dela, da slednje ne vsebuje materiala, ki bi ga kdorkoli predhodno že objavil ali oddal v obravnavo za pridobitev naziva na univerzi ali drugem visokošolskem zavodu, razen v primerih kjer so navedeni viri.

    S svojim podpisom zagotavljam, da:
    \begin{itemize}
    \item sem delo izdelal samostojno pod mentorstvom \@advisorA{}\ifx\@coadvisorA\empty\relax\else{} in somentorstvom \@coadvisorA\fi,
    \item so elektronska oblika dela, naslov (slov., angl.), povzetek (slov., angl.) ter ključne besede (slov., angl.) identični s tiskano obliko in
	  \item soglašam z javno objavo elektronske oblike dela v zbirki ``Dela FRI''.
	  \end{itemize}
  \else
    I hereby declare that this thesis is my own work and that, to the best of my knowledge
and belief, it contains no material previously published or written by another person
nor material which to a substantial extent has been accepted for the award of any other
degree or diploma of the university or other institute of higher learning, except where due
acknowledgement has been made in the text.

    With my signature I confirm that:
    \begin{itemize}
    \item the work was done wholly or mainly while in candidature for a degree at this University under the advisorship of \@advisor{}\ifx\@coadvisor\empty\relax\else{} and coadvisorship of \@coadvisor\fi,
    \item the electronic and printed version of the work, the title (eng., slov.), the abstract (eng., slov.) and key words (eng., slov.) are identical and
	  \item I agree with the publication of the electronic version of the thesis in the ``Dela FRI'' collection.
	  \end{itemize}
  \fi
	\end{minipage}
  \par \null \hfill  --- \@author, \@place,
  \if@slovene
   \ifcase\@month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
  \else
   \ifcase\@month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \fi
  ~\number\@year.
	\par
  \thispagestyle{empty}
  }

%TODO: \xspace package
\if@PhD
 \renewcommand\makecopyright[1][-]{\empty}
 \renewcommand\thesistopic{\empty}
 \renewcommand\makedeclaration{\empty}
 \newcommand\makepreviouspublication{%
  \if@slovene
   \chapter*{Predhodna objava}
  \else
   \chapter*{Previous publication}
  \fi
  \thispagestyle{empty}
  \if@slovene
   {Izjavljam, da so bili rezultati obravnavane raziskave predhodno objavljeni/sprejeti za objavo v recenzirani reviji ali javno predstavljeni v naslednjih primerih:}\par
  \else
   {I hereby declare that the research reported herein was previously published/submitted for publication in peer reviewed journals or publicly presented at the following occasions:}\par
  \fi

  \vspace*{\baselineskip}
  \begin{centering}
  \begin{minipage}{\linewidth-1em}
  {\small \raggedright
  \ifx\@publicationList\empty\relax
  \else
   \begin{enumerate}[{[}1{]}]
    \@publicationList
   \end{enumerate}
  \fi
  }
  \end{minipage}\par
  \end{centering}

  \vspace*{\baselineskip}
  \if@slovene
   {Potrjujem, da sem pridobil pisna dovoljenja vseh lastnikov avtorskih pravic, ki mi dovoljujejo vključitev zgoraj navedenega materiala v pričujočo disertacijo. Potrjujem, da zgoraj navedeni material opisuje rezultate raziskav, izvedenih v času mojega podiplomskega študija na Univerzi v Ljubljani.}\par
  \else
   {I certify that I have obtained a written permission from the copyright owner(s) to include the above published material(s) in my thesis. I certify that the above material describes work completed during my registration as graduate student at the University of Ljubljana.}\par
  \fi
 }
\fi

% define chapter\section counters
\newcommand*\chaptermark[1]{}
\setcounter {secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

% define chapter\section\figure names
\newcommand\chaptername{\empty}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\if@slovene
 \providecommand\biographyname{Biografija}
\else
 \providecommand\biographyname{Biography}
\fi
\if@slovene
 \providecommand\bibliographyname{Osebna bibliografija}
\else
 \providecommand\bibliographyname{Personal bibliography}
\fi
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\@month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\@year}

% define chapter\section formatting
\if@PhDp
 \renewcommand \thepart {}
 \renewcommand \thechapter {}
 \renewcommand \thesection {\@arabic\c@section}
\else
 \renewcommand \thepart {\@Roman\c@part}
 \renewcommand \thechapter {\@arabic\c@chapter}
 \renewcommand \thesection {\thechapter.\@arabic\c@section}
\fi
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

% forntmatter, mainmatter, backmatter, part styles
\newcommand\frontmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\itshape \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \itshape #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \itshape #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}


\def\@place{Ljubljana}
\def\@month{\number\month}
\def\@year{\number\year}
\let\@author\@empty
\let\@authorRH\@empty
\let\@advisor\@empty
\let\@advisorA\@empty
\let\@coadvisor\@empty
\let\@coadvisorA\@empty
\let\@title\@empty
\let\@titleA\@empty
\let\@titleRH\@empty
\let\@titleRHA\@empty
\let\@keywords\@empty
\let\@keywordsA\@empty
\let\@companyLogo\@empty
\let\@approvedByNameA\@empty
\let\@approvedByTitleA\@empty
\let\@approvedByRoleA\@empty
\let\@approvedByAffiliationA\@empty
\let\@approvedByNameB\@empty
\let\@approvedByTitleB\@empty
\let\@approvedByRoleB\@empty
\let\@approvedByAffiliationB\@empty
\let\@approvedByNameC\@empty
\let\@approvedByTitleC\@empty
\let\@approvedByRoleC\@empty
\let\@approvedByAffiliationC\@empty
\let\@approvedByNameD\@empty
\let\@approvedByTitleD\@empty
\let\@approvedByRoleD\@empty
\let\@approvedByAffiliationD\@empty
\let\@publicationList\@empty

\newcommand{\forceDate}[2]{
 \def\@month{#1}
 \def\@year{#2}
}
\def\author{\@ifnextchar[{\@authoropt}{\@authornopt}}
\def\@authoropt[#1]#2#3%
{%
 \def\@authorRH{#1}
 \def\@author{#2}
 \def\@enrolmentId{#3}
 \hypersetup{
  pdfinfo={
   Author={#2}
  }
 }%
}%
\def\@authornopt#1#2%
{%
 \def\@authorRH{#1}
 \def\@author{#1}
 \def\@enrolmentId{#2}
 \hypersetup{
  pdfinfo={
   Author={#1}
  }
 }
}%
\newcommand{\advisor}[2]
{
 \hypersetup{
  pdfinfo={
   Advisor={#1}
  }
 }
 \def\@advisor{#1}
 \def\@advisorA{#2}
}
\newcommand{\coadvisor}[2]
{
 \hypersetup{
  pdfinfo={
   Coadvisor={#1}
  }
 }
 \def\@coadvisor{#1}
 \def\@coadvisorA{#2}
}
\def\title{\@ifnextchar[{\@titleopt}{\@titlenopt}}
\def\@titleopt[#1][#2]#3#4%
{%
 \hypersetup{
  pdfinfo={
   Title={\if@slovene#2\else#1\fi}
  }
 }
 \gdef\@titleRH{#1}\gdef\@titleRHA{#2}
 \gdef\@title{#3}\gdef\@titleA{#4}
 \if@PhDp\@mkboth{#1}{#1}\fi
 \if@BVSRI \subject{BVS-RI thesis}\fi
 \if@BUNRI \subject{BUN-RI thesis}\fi
 \if@BUNRM \subject{BUN-RM thesis}\fi
 \if@BSc \subject{BSc thesis}\fi
 \if@MSc \subject{MSc thesis}\fi
 \if@PhD \subject{PhD thesis}\fi
 \if@PhDp \subject{PhD thesis proposal}\fi
}
\def\@titlenopt#1#2%
{%
 \hypersetup{
  pdfinfo={
   Title={\if@slovene#2\else#1\fi}
  }
 }
 \gdef\@title{#1}\gdef\@titleA{#2}
 \if@PhDp\@mkboth{#1}{#1}\fi
 \if@BVSRI \subject{BVS-RI thesis}\fi
 \if@BUNRI \subject{BUN-RI thesis}\fi
 \if@BUNRM \subject{BUN-RM thesis}\fi
 \if@BSc \subject{BSc thesis}\fi
 \if@MSc \subject{MSc thesis}\fi
 \if@PhD \subject{PhD thesis}\fi
 \if@PhDp \subject{PhD thesis proposal}\fi
}
\newcommand{\subject}[1]
{
 \def\@subject{#1}
 \hypersetup{
  pdfinfo={
   Subject={#1}
  }
 }
}
\newcommand{\keywords}[2]
{
 \def\@keywords{#1}\def\@keywordsA{#2}
 \hypersetup{
  pdfinfo={
   Keywords={\if@slovene#2\else#1\fi}
  }
 }
}
\newcommand{\companyLogo}[1]
{
 \def\@companyLogo{#1}
}
\newcommand{\approvedByA}[4][\@empty]
{
  \ifx#1\empty\relax\else\def\@approvedByAffiliationA{#1}\fi
  \def\@approvedByNameA{#2}
  \def\@approvedByTitleA{#3}
  \def\@approvedByRoleA{#4}
}
\newcommand{\approvedByB}[4][\@empty]
{
  \ifx#1\empty\relax\else\def\@approvedByAffiliationB{#1}\fi
  \def\@approvedByNameB{#2}
  \def\@approvedByTitleB{#3}
  \def\@approvedByRoleB{#4}
}
\newcommand{\approvedByC}[4][\@empty]
{
  \ifx#1\empty\relax\else\def\@approvedByAffiliationC{#1}\fi
  \def\@approvedByNameC{#2}
  \def\@approvedByTitleC{#3}
  \def\@approvedByRoleC{#4}
}
\newcommand{\approvedByD}[4][\@empty]
{
  \ifx#1\empty\relax\else\def\@approvedByAffiliationD{#1}\fi
  \def\@approvedByNameD{#2}
  \def\@approvedByTitleD{#3}
  \def\@approvedByRoleD{#4}
}
\newcommand{\publicationList}[1]
{
 \def\@publicationList{#1}
}

\newenvironment{Abstract}{%
    \chapter*{Abstract}
    \@mkboth{Abstract}{Abstract}
	 	\addcontentsline{toc}{chapter}{\protect\numberline{}Abstract}
    \metabox{
      \vspace{-9\baselineskip}%
      \begin{centering}
       { \setlength{\@tempdima}{\baselineskip}
         \fontsize{8}{9}\selectfont
         \setlength{\@tempdimb}{\baselineskip}
         \setlength{\@tempdimc}{\@tempdima}\addtolength{\@tempdimc}{-\@tempdimb}
         \vspace*{1em}
         University \emph{of Ljubljana}\\
         Faculty \emph{of Computer and Information Science}\\
         \vspace*{\@tempdimc}
         \@author\\
         {\itshape\if@slovene\@titleA\else\@title\fi}\\
        }
      \end{centering}
      }
		\if@slovene
	    \selectlanguage{english}
	  \fi
    \@afterheading
    \@afterindentfalse
   }
	 {\par \vspace{10pt}
	  {{\itshape \noindent Key words:}\hskip3.4pt\if@slovene\@keywordsA\else\@keywords\fi \par}
	  \if@slovene
      \ifxetex\selectlanguage{slovenian}\else\selectlanguage{slovene}\fi
	 	\fi}

\newenvironment{Povzetek}{%
    \chapter*{Povzetek}
    \@mkboth{Povzetek}{Povzetek}
	 	\addcontentsline{toc}{chapter}{\protect\numberline{}Povzetek}
    \metabox{
      \vspace{-9\baselineskip}%
      \begin{centering}
       { \setlength{\@tempdima}{\baselineskip}
         \fontsize{8}{9}\selectfont
         \setlength{\@tempdimb}{\baselineskip}
         \setlength{\@tempdimc}{\@tempdima}\addtolength{\@tempdimc}{-\@tempdimb}
         \vspace*{1em}
         Univerza \emph{v Ljubljani}\\
         Fakulteta \emph{za računalništvo in informatiko}\\
         \vspace*{\@tempdimc}
         \@author\\
         {\itshape\if@slovene\@title\else\@titleA\fi}\\
        }
      \end{centering}
      }
		\if@slovene
		\else
      \ifxetex\selectlanguage{slovenian}\else\selectlanguage{slovene}\fi
	  \fi
    \@afterheading
    \@afterindentfalse
   }
	 {\par \vspace{10pt}
	  {{\itshape \noindent Ključne besede:}\hskip3.4pt\if@slovene\@keywords\else\@keywordsA\fi \par}
	  \if@slovene
		\else
     \selectlanguage{english}
	  \fi}

\newenvironment{Acknowledgements}
 {\if@slovene
   \chapter*{Zahvala}
   \@mkboth{Zahvala}{Zahvala}
   \addcontentsline{toc}{chapter}{\protect\numberline{}Zahvala}
  \else
   \chapter*{Acknowledgements}
   \@mkboth{Acknowledgements}{Acknowledgements}
   \addcontentsline{toc}{chapter}{\protect\numberline{}Acknowledgements}
  \fi
  \begingroup
	\itshape
	}
 {\endgroup%
  \par%
  \hfill  --- \@author, \@place,
  \if@slovene
   \ifcase\@month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
  \else
   \ifcase\@month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \fi
  ~\number\@year.
	\par
  }

\newenvironment{Statement}
 {\cleardoublepage
  \thispagestyle{plain}
  \vspace*{138pt}

  \noindent
  \begin{minipage}{\textwidth}
  \itshape
  }
 {
	\end{minipage}
	\par \null \hfill  --- \@author, \@place,
	\if@slovene
   \ifcase\@month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
  \else
   \ifcase\@month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \fi
  ~\number\@year.
  \par
  }

\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{chapter}%
                    %\@stopChapterThumb
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
                }


%TODO: use totcount package and
%\regtotcounter{chapter}\total{chapter}
%to define @deltay to step tag marks so that they are distributed over the whole textheight (if more than the amount that fits in)
% remove thmb on schapters (e.g. bibliography)
\newcommand{\ULsquare}{13mm}
\newlength{\VOffset}\setlength{\VOffset}{-\ULsquare}
\RequirePackage[all]{background} %chaptermarks based on TikZ
\RequirePackage{tikz}
\usetikzlibrary{calc}
%%
\RequirePackage[strict]{changepage}
\RequirePackage{ifoddpage}

\newlength{\gs@dpth}\settodepth{\gs@dpth}{q}
\newlength{\gs@bls}\setlength{\gs@bls}{\baselineskip}

\newcommand{\@drawGridSystem}{% For a grid system drawn with TikZ
% \begin{tikzpicture}[remember picture,overlay]]
 \pgfmathsetmacro{\nRows}{round(6*\gridH/\gs@bls)}
 \checkoddpage
 \ifoddpageoroneside
  \foreach \n in {1,...,8} {
    \draw[dashed, lightgray]
        (\trimMark+\bleedW+\bindingW+\n\gridW,-\bleedH-\trimMark)
        --
        (\trimMark+\bleedW+\bindingW+\n\gridW,-\mH+\bleedH+\trimMark);
    \draw[dashed, lightgray]
        (\trimMark+\bleedW+\bindingW,-\n\gridH-\bleedH-\trimMark)
        --
        (\mW-\bleedW-\trimMark,-\n\gridH-\bleedH-\trimMark);
  }
  \draw[dashed, black]
      (\trimMark+\bleedW+\bindingW,-\bleedH-\trimMark)
      --
      (\trimMark+\bleedW+\bindingW,-\mH+\bleedH+\trimMark);
  \draw[green]
      (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT)
      rectangle
      (\mW-\trimMark-\bleedW-\marginO,-\mH+\trimMark+\bleedH+\marginB);
  \draw[green!50]
      (\mW-\trimMark-\bleedW-\marginO+\marginparsep,-\trimMark-\bleedH-\marginT)
      rectangle
      (\mW-\trimMark-\bleedW-\marginO+\marginparsep+\marginparwidth,-\mH+\trimMark+\bleedH+\marginB);
  \draw[dashed, green]
      (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT+\headsep+\headheight)
      rectangle
      (\mW-\trimMark-\bleedW-\marginO+\gridW/2,-\trimMark-\bleedH-\marginT+\headsep);
  \draw[dashed, green]
      (\trimMark+\bleedW+\bindingW+\marginI,-\mH+\trimMark+\bleedH+\marginB-\headsep)
      rectangle
      (\mW-\trimMark-\bleedW-\marginO+\gridW/2,-\mH+\trimMark+\bleedH+\marginB-\headsep-\headheight);
%  \draw[orange] (1in+\hoffset+\oddsidemargin,-1in-\voffset-\topmargin-\headheight-\headsep) rectangle (1in+\hoffset+\oddsidemargin+\textwidth,-1in-\voffset-\topmargin-\headheight-\headsep-\textheight);
%  \draw[orange] (1in+\hoffset+\oddsidemargin+\textwidth+\marginparsep,-1in-\voffset-\topmargin-\headheight-\headsep) rectangle (1in+\hoffset+\oddsidemargin+\textwidth+\marginparsep+\marginparwidth,-1in-\voffset-\topmargin-\headheight-\headsep-\textheight);
  \foreach \n in {1,...,\nRows} {
    \draw[dashed, red]
      (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT-\n\gs@bls+\gs@dpth)
      --
      (\mW-\trimMark-\bleedW-\marginO,-\trimMark-\bleedH-\marginT-\n\gs@bls+\gs@dpth);
  }
 \else
  \foreach \n in {1,...,8} {
    \draw[dashed, lightgray]
        (\mW-\trimMark-\bleedW-\bindingW-\n\gridW,-\trimMark-\bleedH)
        --
        (\mW-\trimMark-\bleedW-\bindingW-\n\gridW,-\mH+\trimMark+\bleedH);
    \draw[dashed, lightgray]
        (\mW-\trimMark-\bleedW-\bindingW,-\n\gridH-\bleedH-\trimMark)
        --
        (\trimMark+\bleedW,-\n\gridH-\bleedH-\trimMark);
  }
  \draw[dashed, black]
      (\mW-\trimMark-\bleedW-\bindingW,-\trimMark-\bleedH)
      --
      (\mW-\trimMark-\bleedW-\bindingW,-\mH+\bleedH+\trimMark);
  \draw[green]
      (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\marginT-\bleedH-\trimMark)
      rectangle
      (\trimMark+\bleedW+\marginO,-\mH+\marginB+\bleedH+\trimMark);
  \draw[green!50]
      (\trimMark+\bleedW+\marginO-\marginparsep,-\marginT-\bleedH-\trimMark)
      rectangle
      (\trimMark+\bleedW+\marginO-\marginparsep-\marginparwidth,-\mH+\marginB+\bleedH+\trimMark);
  \draw[dashed,green]
      (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\marginT-\bleedH-\trimMark+\headsep+\headheight)
      rectangle
      (\trimMark+\bleedW+\marginO-\gridW/2,-\marginT-\bleedH-\trimMark+\headsep);
  \draw[dashed,green]
      (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\mH+\marginB+\bleedH+\trimMark-\headsep)
      rectangle
      (\trimMark+\bleedW+\marginO-\gridW/2,-\mH+\marginB+\bleedH+\trimMark-\headsep-\headheight);
%  \draw[orange] (1in+\hoffset+\oddsidemargin,-1in-\voffset-\topmargin-\headheight-\headsep) rectangle (1in+\hoffset+\oddsidemargin+\textwidth,-1in-\voffset-\topmargin-\headheight-\headsep-\textheight);
%  \draw[orange] (\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth-\marginparsep,-1in-\voffset-\topmargin-\headheight-\headsep) rectangle (\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth-\marginparsep-\marginparwidth,-1in-\voffset-\topmargin-\headheight-\headsep-\textheight);
  \foreach \n in {1,...,\nRows} {
    \draw[dashed, red]
        (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\marginT-\bleedH-\trimMark-\n\gs@bls+\gs@dpth)
        --
        (\trimMark+\bleedW+\marginO,-\marginT-\bleedH-\trimMark-\n\gs@bls+\gs@dpth);
  }
 \fi
% \end{tikzpicture}
}

\newcommand{\@drawTrimMarks}
{
% trimmarks
  \draw[black, line width=0.25pt]
      (\trimMark+\bleedW,0)
      --
      (\trimMark+\bleedW,-\trimMark);
  \draw[black, line width=0.25pt]
      (\trimMark+\bleedW,-\mH)
      --
      (\trimMark+\bleedW,-\mH+\trimMark);
  \draw[black, line width=0.25pt]
	  (\mW-\trimMark-\bleedW,0)
	  --
	  (\mW-\trimMark-\bleedW,-\trimMark);
  \draw[black, line width=0.25pt]
	  (\mW-\trimMark-\bleedW,-\mH)
	  --
	  (\mW-\trimMark-\bleedW,-\mH+\trimMark);
  \draw[black, line width=0.25pt]
      (0,-\trimMark-\bleedH)
      --
      (\trimMark,-\trimMark-\bleedH);
  \draw[black, line width=0.25pt]
      (\mW-\trimMark,-\trimMark-\bleedH)
      --
      (\mW,-\trimMark-\bleedH);
  \draw[black, line width=0.25pt]
      (0,-\mH+\trimMark+\bleedH)
      --
      (\trimMark,-\mH+\trimMark+\bleedH);
  \draw[black, line width=0.25pt]
      (\mW-\trimMark,-\mH+\trimMark+\bleedH)
      --
      (\mW,-\mH+\trimMark+\bleedH);
}

\newif \if@showGridSystem \@showGridSystemfalse
\newif\if@showChapterThumb \@showChapterThumbfalse
\newif\if@isChapterPage \@isChapterPagefalse
%
\newcommand{\@drawBkgnd}{% For a bacground displaying either a chaptermark or the grid system
 \begin{tikzpicture}[remember picture,overlay]
  \if@press \@drawTrimMarks \fi
  \if@showGridSystem \@drawGridSystem \fi
  \if@showChapterThumb
   \if@isChapterPage \@drawChapterMark{white}{P1797} \else \@drawChapterThumb{P1797} \fi
  \fi
 \end{tikzpicture}
}
\newcommand{\@drawChapterThumb}[1]{% For a chaptermark drawn with TikZ
%  \begin{tikzpicture}[remember picture,overlay]
  \checkoddpage
  \ifoddpageoroneside
    \path[fill=#1]
        (\mW-\trimMark-\bleedW-\gridW/4,-\trimMark-\bleedH-\marginT-\VOffset)
        rectangle
        (\mW-\trimMark,-\trimMark-\bleedH-\marginT-\VOffset-\ULsquare);
  \else
    \path[fill=#1]
        (\trimMark,-\trimMark-\bleedH-\marginT-\VOffset)
        rectangle
        (\trimMark+\bleedW+\gridW/4,-\trimMark-\bleedH-\marginT-\VOffset-\ULsquare);
  \fi
%  \end{tikzpicture}
}
\newcommand{\@drawChapterMark}[2]{% For a chaptermark drawn with TikZ
%  \begin{tikzpicture}[remember picture,overlay]
  \checkoddpage
  \ifoddpageoroneside
    \path[fill=#1]
        (\mW-\trimMark-\bleedW-\ULsquare,-\trimMark-\bleedH-\marginT-\VOffset)
        rectangle
        (\mW-\trimMark,-\trimMark-\bleedH-\marginT-\VOffset-\ULsquare);
    \node[#2] at
        (\mW-\trimMark-\bleedW-\ULsquare/2,-\trimMark-\bleedH-\marginT-\VOffset-\ULsquare/2)
        {\fontsize{26}{30}\itshape\selectfont\thechapter\normalfont};
  \else
    \path[fill=#1]
        (\trimMark, -\trimMark-\bleedH-\marginT-\VOffset)
        rectangle
        (\trimMark+\bleedW+\ULsquare, -\trimMark-\bleedH-\marginT-\VOffset-\ULsquare);
    \node[#2] at
        (\trimMark+\bleedW+\ULsquare/2, -\trimMark-\bleedH-\marginT-\VOffset-\ULsquare/2)
        {\fontsize{26}{30}\itshape\selectfont\thechapter\normalfont};
  \fi
%  \end{tikzpicture}
}
\newcommand{\@addChapterThumb}{%
 \global\@showChapterThumbtrue
 \addtolength{\VOffset}{\ULsquare}
}
\newcommand{\@stopChapterThumb}{%
 \global\@showChapterThumbfalse
}

\def\@makechapterhead#1{
 \global\@isChapterPagetrue
 \pagecolor{P1797}
 \@addChapterThumb
 \null
 \vfil
 {
 % {\null\hfill
 %  \begingroup
    \begin{flushright}%\noindent
    \fontsize{26}{30}\itshape\selectfont
     \setsinglelinespacing%\raggedright
    \color{white}
    #1%
    \normalcolor
    \end{flushright}
%   \endgroup}\par
  }
 \normalfont
\newpage
\global\@isChapterPagefalse
\pagecolor{white}
}

\def\@schapter#1{\@stopChapterThumb
                 \if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi
                }
\def\@makeschapterhead#1{%
  \vspace*{4\baselineskip}%
  \begin{centering}
   {\Large\scshape\setsinglelinespacing%
    \color{P1797}
    \@xp\uppercase\@xp{#1}
   }\par
  \end{centering}
  \vspace*{3\baselineskip}
}

\newcommand\section{\@startsection {section}{1}{\z@}%
	{-2.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	%{44pt}{18pt}
  {\color{P1797}\large\if@PhDp\sffamily\bfseries\else
  %\fontsize{14}{16}\selectfont
  \itshape\fi}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-2.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	%{34pt}{18pt}
  {\color{P1797}\if@PhDp\sffamily\bfseries\else
  %\fontsize{10}{13}\selectfont
  \itshape\fi}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-2.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\color{P1797}\if@PhDp\sffamily\else\itshape\fi\normalsize}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{2.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\color{P1797}\if@PhDp\sffamily\else\itshape\fi\normalsize}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{2.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\color{P1797}\normalfont\normalsize}}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi  {\color{grey65}\raisebox{.05em}{\rule{.35em}{.35em}}\normalcolor}
\newcommand\labelitemii {\color{grey50}\raisebox{.1em}{\rule{.25em}{.25em}}\normalcolor}
\newcommand\labelitemiii{\color{grey40}\raisebox{.15em}{\rule{.15em}{.15em}}\normalcolor}
\newcommand\labelitemiv {\color{grey30}\raisebox{.15em}{\rule{.15em}{.15em}}\normalcolor}

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\itshape #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \pagenumbering{alph}
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\newcommand\appendix{
  \if@PhDp
  \par
  \cleardoublepage
  \def\sectionmark##1{%
    \markright {{%
     \ifnum \c@secnumdepth >\z@
      \thesection \ %
     \fi
     ##1}}}
  \else
  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \fi
  }
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {\itshape #1\hskip3.4pt\par\vskip2mm}{\RaggedRight\scriptsize #2\par}
  %{\scriptsize\sffamily \@hangfrom{{\itshape #1}\hskip3.4pt}#2 \par}
  \vskip\belowcaptionskip
}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}
\DeclareMathAlphabet{\mathppl}{OT1}{ppl}{m}{it}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
	\@xp\chapter\@xp*\@xp{\contentsname \@mkboth{\contentsname}{\contentsname}}%
	\@starttoc{toc}%
	}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \itshape
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\def\bibliographystyle#1{%
    \if@filesw\immediate\write\@auxout{\string\bibstyle{#1}}\fi
    \def\@tempa{#1}%
    \def\@tempb{amsplain}%
    \def\@tempc{}%
    \ifx\@tempa\@tempb
        \def\@biblabel##1{##1.}%
        \def\bibsetup{}%
    \else
        \def\bibsetup{\labelsep6\p@}%
        \ifx\@tempa\@tempc
            \def\@biblabel##1{}%
            \def\bibsetup{\labelwidth\z@ \leftmargin24\p@
                \itemindent-24\p@
                \labelsep\z@ }%
        \fi
    \fi}
\if@PhDp
 \def\bib@heading{%
   \section{\bibname}%
 }
\fi
\newenvironment{thebibliography}[1]{%
  \if@PhDp
   \section*{\bibname}%
  \else
   \@xp\chapter\@xp*\@xp{\bibname}%
  \fi
  \@mkboth{\bibname}{\bibname}
  \vspace{18.5pt}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
  \labelsep .5em\relax
  \renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
  \list{\@biblabel{\theenumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth \advance\leftmargin\labelsep
    \usecounter{enumiv}}%
  \sloppy \clubpenalty\@M \widowpenalty\clubpenalty
  \sfcode`\.=\@m
  \if@PhD
   \normalfont\footnotesize\setsinglelinespacing
  \fi
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\if@PhDp
 \pagestyle{proposal}
\else
%\pagestyle{headings}
\pagestyle{fancybook}
\fi
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\RequirePackage{ragged2e}

\AtBeginDocument{%
%\@showGridSystemtrue
\backgroundsetup{
 contents=\@drawBkgnd, % Set tikz picture
 position={current page.north west}, % Select location
 opacity=1.0, % Select opacity
 angle=0.0, % Select roation of logo
 scale=1.0 % Select scale factor of logo
}
\if@PhDp
 \setcounter{secnumdepth}{0}
\else
 \setcounter{secnumdepth}{2}
\fi
\setcounter{tocdepth}{2}
\if@PhDp
 \ps@proposal
\else
 %\ps@headings
 \ps@fancybook
\fi
%\RaggedRight
%\sffamily
\raggedbottom
\if@slovene
 \ifxetex\selectlanguage{slovenian}\else\selectlanguage{slovene}\fi
\else
 \selectlanguage{english}
\fi
}
\AtEndDocument{
}

\providecommand{\url}[1]{\href{#1}{#1}}
\providecommand{\doi}[1]{doi:~\href{http://dx.doi.org/#1}{#1}}

\if@PhDp
\RequirePackage[numbers,sort&compress,sectionbib]{natbib}
\else
\RequirePackage[numbers,sort&compress]{natbib}
\fi
\RequirePackage{hyperxmp}
\ifxetex
  \RequirePackage[xetex,pdfa,pdfdisplaydoctitle=true,colorlinks,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true]{hyperref}
\else
  \ifpdf
    \RequirePackage[pdftex,pdfa,pdfdisplaydoctitle=true,colorlinks,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true,unicode=true]{hyperref}
  \else
    \RequirePackage[dvipdfm,pdfa,pdfdisplaydoctitle=true,colorlinks,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true,unicode=true]{hyperref}
  \fi
\fi

%TODO: provide for PhDp as well remove old code check natbib --- find out how to jump out of twocolumn mode!
\RequirePackage{multicol}
\renewcommand{\bibpreamble}{
 \@mkboth{\bibname}{\bibname}
 \addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
}

%\renewcommand{\bibsection}{
%%  \vspace*{\baselineskip}
  %\@xp\chapter\@xp*\@xp{\bibname}
  %\@mkboth{\bibname}{\bibname}
  %\addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
%}
%\papersize{210mm}{148mm}
%\paperheight 297mm \paperwidth 210mm \textheight 54.5pc
%\if@PhDp
%\marginsize{37.5mm}{37.5mm}{30mm}{40mm}
%\else
%\marginsize{32.5mm}{42.5mm}{30mm}{40mm}
%\marginsize{16mm}{33mm}{23.333mm}{46.667mm}
%\fi
%\linespread{1.5}

%zupan 16.3x23.2 gutter 8
% TODO: add heightrounded for a multiple of baselineskip + topskip
% TODO: resize to follow page harmony with int multiples in milimiter or lineskip
% best page size is 6" x 9", respecting the 2:3 ratio - http://www.thebookdesigner.com/2010/09/self-publishing-basics-how-to-pick-the-size-of-your-book/
% page harmony canon dictates margins based on a 9x9 grid with textbox respecting the page aspect ratio
% this gives a 6" heigh textbox -- i.e. 36 lines at 12pt per line, for a 9pt typeface this is 1.5 linespread
\RequirePackage{calc} % length calculations
%\RequirePackage{layouts} % length printing
% one possible solution to the bottom white space issue is 7.45x9.21in
% page size giving a 1:phi golden ratio page spread but a book 242x200mm which is too wide!
\newlength{\pageW}\setlength{\pageW}{6.14in}%6.14%6.13
\newlength{\pageH}\setlength{\pageH}{9.21in}%9.195
\newlength{\gridW}\setlength{\gridW}{\pageW/9}
\newlength{\gridH}\setlength{\gridH}{\pageH/9}
\newlength{\marginI}\setlength{\marginI}{\gridW}
\newlength{\marginO}\setlength{\marginO}{2\gridW}
\newlength{\marginT}\setlength{\marginT}{\gridH}% +2\baselineskip} % header part of body text
\newlength{\marginB}\setlength{\marginB}{2\gridH}% +2\baselineskip} % footer part of body text

\newlength{\bindingW}\setlength{\bindingW}{0mm}
\newlength{\bleedH}\setlength{\bleedH}{0mm}
\newlength{\bleedW}\setlength{\bleedW}{0mm}
\if@press
 \setlength{\bindingW}{16mm}%{10mm}%{\gridW/2} % widden up each page by 7.5mm / 6mm due to binding
 \setlength{\bleedH}{5mm}%{20mm}
 \setlength{\bleedW}{5mm}%{5mm}%{20mm}
\fi

%\addtolength{\pageW}{\bindingW}

\newlength{\trimMark}\setlength{\trimMark}{0mm}
\if@press
 \setlength{\trimMark}{5mm}
\fi
\newlength{\mW}\setlength{\mW}{\trimMark+\bleedW+\bindingW+\pageW+\bleedW+\trimMark}
\newlength{\mH}\setlength{\mH}{\trimMark+\bleedH+\pageH+\bleedH+\trimMark}
\newlength{\cx}\setlength{\cx}{\trimMark+\bleedW+\bindingW}
\newlength{\cy}\setlength{\cy}{\trimMark+\bleedH}
\newlength{\cX}\setlength{\cX}{\mW-\trimMark-\bleedW}
\newlength{\cY}\setlength{\cY}{\mH-\trimMark-\bleedH}
\newlength{\tx}\setlength{\tx}{\trimMark+\bleedW}
\newlength{\ty}\setlength{\ty}{\trimMark+\bleedH}
\newlength{\tX}\setlength{\tX}{\mW-\trimMark-\bleedW}
\newlength{\tY}\setlength{\tY}{\mH-\trimMark-\bleedH}

\setlength{\marginparsep}{\gridW/4}
\setlength{\marginparwidth}{\marginO-3\marginparsep}
% use -4\marginparsep for 7.45x9.21 page!
%\setlength{\marginparwidth}{\marginO-4\marginparsep}
\setlength{\headheight}{\baselineskip}
%\setlength{\headsep}{\baselineskip}% to do \gridH/4 - depth for baseline of font!
\setlength{\headsep}{\gridH/4-\baselineskip}% to do \gridH/4 - depth for baseline of font!

%\newlength{\bindingO}\setlength{\bindingO}{\bindingW+\bleedW}
\pgfmathsetlengthmacro{\bO}{\bindingW+\bleedW+\trimMark}
\pgfmathsetlengthmacro{\mI}{\marginI}
\pgfmathsetlengthmacro{\mO}{\marginO+\trimMark+\bleedW}
\pgfmathsetlengthmacro{\mT}{\marginT+\trimMark+\bleedH}
\pgfmathsetlengthmacro{\mB}{\marginB+\trimMark+\bleedH}

\pdfpagewidth=\mW \pdfpageheight=\mH
\paperwidth=\mW \paperheight=\mH

\RequirePackage[papersize={\mW, \mH}, bindingoffset=\bO, left=\mI, top=\mT, right=\mO, bottom=\mB]{geometry}
%\RequirePackage[papersize={\pageW, \pageH}, bindingoffset=\bindingW, left=\marginI, top=\marginT, right=\marginO, bottom=\marginB]{geometry}
%\RequirePackage[papersize={171mm, 232mm}, bindingoffset=8mm, left=18.111mm, top=25.788mm, right=36.222mm, bottom=51.556mm]{geometry}
%\RequirePackage[a5paper, left=16mm, right=33mm, top=23.333mm, bottom=46.667mm]{geometry}

% configures PDF trim, crop, bleed, media boxes
\let\@XeTeXTrimBoxes\relax
\def\setbpdim#1#2{\@tempdimc#2 \@tempdimc .99626\@tempdimc
    \edef#1{\strip@pt\@tempdimc}}

% if bindingW does not include bleedW setPDFboxex must be recomputed on every page!!!!
\def\setPDFBoxes{%
    \setlength{\@tempdima}{\bleedW+\trimMark} \setlength{\@tempdimb}{\bleedH+\trimMark}
    \setbpdim\@tx\@tempdima \setbpdim\@ty\@tempdimb
    \setlength{\@tempdima}{\pdfpagewidth-\trimMark-\bleedW}\setlength{\@tempdimb}{\pdfpageheight-\trimMark-\bleedH}
    \setbpdim\@tX\@tempdima \setbpdim\@tY\@tempdimb
    \setbpdim\@bx{0pt} \setbpdim\@by{0pt}
    \setbpdim\@bX\pdfpagewidth \setbpdim\@bY\pdfpageheight
    \edef\@tmp{
               /BleedBox [\@bx\space \@by\space
                          \@bX\space \@bY]
               /TrimBox [\@tx\space \@ty\space
                         \@tX\space \@tY]
              }
% TODO: ifxetex ...
%    \ifcaseZWdriver
%    \or %pdftex
%      \expandafter\pdfpageattr\expandafter{\@tmp}
%    \or %xetex
      \edef\@XeTeXTrimBoxes{\noexpand\special{pdf:put @thispage <<\@tmp>>}}
%    \else %dvips
%      \special{! userdict begin
%                 userdict /bop-hook known {/bop-hook load cvx /ZWBox-hook exch def} if
%                 /bop-hook {
%                   [/TrimBox [\@tx\space \@ty\space
%                              \@tX\space \@tY] /PAGE pdfmark
%                   userdict /ZWBox-hook known {ZWBox-hook} if
%                 } def
%      end}
%    \fi
}
\AtBeginDocument{\setPDFBoxes}
%\RequirePackage{atbegshi}
\AtBeginShipout{%
  \setbox\AtBeginShipoutBox=\hbox{%
   \@XeTeXTrimBoxes
   \box\AtBeginShipoutBox
  }%
}

% TODO: rearange code and remove dead or overwritten code
\RequirePackage{floatrow} %solve for subfigures!!!
%\DeclareCaptionSubType[alph]{figure}
%\captionsetup[subfigure]{labelformat=brace,justification=centerlast}
%\floatsetup[subfigure]{style=plain,heightadjust=object}
\DeclareColorBox{framedfigure}{\fcolorbox{grey20}{white}}
\if@twoside
  \floatsetup[figure]{margins=hangoutside,capposition=beside,capbesideposition={outside,bottom},facing=yes,floatwidth=\textwidth,objectset=centering,framefit=yes,colorframeset=framedfigure,framestyle=colorbox,frameset={\fboxrule1pt\fboxsep2.5pt}}
\else
  \floatsetup[figure]{margins=hangright,capposition=beside,capbesideposition={right,bottom},facing=no,floatwidth=\textwidth,objectset=centering,framefit=yes,colorframeset=framedfigure,framestyle=colorbox,frameset={\fboxrule1pt\fboxsep2.5pt}}
\fi
\floatsetup[table]{capposition=top}
\newlength{\figurewidth}\setlength{\figurewidth}{\textwidth-7pt}

% not good -- does not install properly ==> took only parts of code
%\usepackage[paperzie={\pageW,\pageH}, topmargin=\marginT, botmargin=\marginB, leftmargin=\marginI, rightmargin=\marginO]{zwpagelayout}
%nopdfinfo

\newcommand{\sidenote}[2]{\if@notes{{\color{grey65}{#1}\normalcolor}\marginpar{\RaggedRight\hspace{0pt}\color{blue}\tiny{\@xp\emph\@xp{#2}}\normalcolor}}\else{#1}\fi}

\newlength\Linewidth
\def\findlength{
\setlength\Linewidth
\linewidth\addtolength\Linewidth{-4\fboxrule}\addtolength\Linewidth{-3\fboxsep}
}


\newcommand\definitionname{Definition}
\if@slovene
 \renewcommand{\definitionname}{Definicija}
\fi

\newif \if@oldstyle \@oldstylefalse
\@oldstylefalse
\if@oldstyle %TODO: remove oldstyle --- the new version is perfect
\RequirePackage{amsthm}
\newtheoremstyle{definition}{}{}{\upshape}{}{\itshape}{:}{ }{}
\theoremstyle{definition}
\newtheorem{definition}{\definitionname}
%\renewcommand{\thedefinition}{\thechapter.\arabic{definition}}
\numberwithin{definition}{chapter}
%\renewcommand{\theequation}{\arabic{equation}}
%\numberwithin{equation}{part}

%TODO: alow for multipage defn http://tex.stackexchange.com/questions/21344/locally-setting-the-line-width-in-a-paragraph
\newenvironment{defn}{%\vskip\medskipamount % or other desired dimension
%\leaders\vrule width \textwidth\vskip0.4pt % or other desired thickness
%\vskip\medskipamount % ditto
%\nointerlineskip
   \par\begingroup%
   \setlength{\fboxsep}{5pt}\findlength%
   \setbox0=\vbox\bgroup\noindent%
   \hsize=\Linewidth%
   \begin{minipage}{\Linewidth}\small
  \begin{definition}
  }
  {
%\vskip\medskipamount % or other desired dimension
%\leaders\vrule width \textwidth\vskip0.4pt % or other desired thickness
%\vskip\medskipamount % ditto
%\nointerlineskip
  \end{definition}
  \end{minipage}\egroup%
    \vspace{6pt}%
    \addvspace{6pt minus 3pt} %added 12.12.2004
    \noindent\textcolor{orange}{\fboxsep2.5pt\fbox%
     {\fboxsep5pt\colorbox{grey05}{\normalcolor\box0}}}%
    \endgroup\par\addvspace{6pt minus 3pt}\noindent%
    \normalcolor\ignorespacesafterend
  }
\let\Defn\defn
\let\endDefn\enddefn
\else
\RequirePackage[framemethod=tikz]{mdframed}
\newlength{\@skip}\setlength{\@skip}{\baselineskip-8.5pt}
\mdfdefinestyle{theoremstyle}{%
%linecolor=orange,linewidth=3pt,%
leftline=false,rightline=false,%
innerleftmargin=5pt,innerrightmargin=5pt,
innertopmargin=5pt,innerbottommargin=5pt,
skipabove=\@skip,skipbelow=\@skip,
%skipabove=3.5pt,skipbelow=3.5pt,
%skipabove={6pt minus 3pt},skipbelow={6pt minus 3pt},
outerlinewidth=1pt,outerlinecolor=grey20,
middlelinewidth=2.5pt,middlelinecolor=white,
splittopskip=12pt,splitbottomskip=6pt,
ignorelastdescenders,
backgroundcolor=grey05
}
%\mdtheorem[style=theoremstyle]{defn}{Definition}
\RequirePackage{ntheorem}
%\theoremstyle{theoremstyle}
\theoremheaderfont{\normalfont\itshape}
\theorembodyfont{\normalfont}
\theoremseparator{:}
\newmdtheoremenv[style=theoremstyle]{defn}{\definitionname}[chapter]
% TODO: provide Theorem, Definition, Proof, Lemma
\fi

\providecommand{\nopagecolor}{\pagecolor{white}}

\endinput
%%
%% End of file `FRIthesis.cls'.
