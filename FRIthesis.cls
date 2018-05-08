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

\RequirePackage{ifxetex}
\RequireXeTeX 

%\newwrite\finder
%\immediate\openout\finder=\jobname.fnd
%\RequirePackage{filehook,currfile}

%\def\searchmacro#1{
%	\AtBeginOfEveryFile{%
%		\ifdefined#1
%		\expandafter\def\csname \currfilename:found\endcsname{}%
%		\fi}
%	\AtEndOfEveryFile{%
%		\ifdefined#1
%		\unless\ifcsname \currfilename:found\endcsname
%		\immediate\write\finder{found in '\currfilename'}%
%		\fi\fi}}

%\searchmacro\section

%\let\origRP\RequirePackage
%\def\where#1{
%	\renewcommand{\RequirePackage}[1]{
%		\origRP{##1}
%		\ifcsname #1\endcsname
%			\message{^^J#1 is defined in ##1^^J}
%		\fi	
%	}
%}
%
%\where{chaptermark}

%TODO:
%refactor
% check which packages are required
%\textt and \textsf for rm, it, bf, bfit
%draft with no color and "zoomed-in"
%
%!! figure sizes intext, outofbounds - align to fulpage, fullpage, spread!
%        instructions
%

% TODO: remove all unnecessary options
%\newif\if@slovene \@slovenefalse
%\newif\if@funded \@fundedfalse
%\newif\if@forreview \@forreviewfalse
%\newif\if@press \@pressfalse
%\newif\if@mainmatter \@mainmattertrue

%%\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
%\DeclareOption{slovene}{\@slovenetrue}
%\DeclareOption{english}{\@slovenefalse}
%\DeclareOption{funded}{\@fundedtrue}
%\DeclareOption{forreview}{\@forreviewtrue}
%\DeclareOption{press}{\@presstrue}
%\ExecuteOptions{slovene}
%\ProcessOptions

%\@twosidetrue 
%\@mparswitchtrue

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

%
\special{pdf:minorversion 7}

% Resolves "No room for a new \count" error that seems to be caused by the combination biblatex+floatrow
%\RequirePackage{etex}
%\reserveinserts{20}

%\RequirePackage[log-declarations=false]{xparse}

%%%%
%% load typography related packages
%%%%
% TODO
\input{bk9.clo} % font sizes

%\RequirePackage{ebgaramond}
%\RequirePackage{ebgaramond-maths} % should this be included for proper microtype? 

\RequirePackage{microtype}
\RequirePackage{xltxtra} % for vulgar fractions and logos
\RequirePackage{amsmath} % must be loaded before unicode-math to avoid conflicts
\RequirePackage{amssymb}
\RequirePackage[math-style=french,bold-style=upright]{unicode-math}
\RequirePackage{ragged2e} % for flushleft justification with hyphenation turned on

\setmathfont{XITS Math} % base font
%\setmathfont{Asana Math} % base font until v1.2.20170526
%\setmathfont{EB Garamond} % To use in the future?
% TODO: check printed
%\setmathfont[Path=fonts/]{Garamond-math.otf}%{texgyretermes-math.otf} % To use in the future? 
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

% load language related packages
\RequirePackage{translator}
\RequirePackage{polyglossia}
\if@slovene
	\setmainlanguage{slovenian}
	\setotherlanguage[variant=uk]{english}
	\RequirePackage[locale=DE]{siunitx} % load siunitx package for printing numers and units
\else
	\setmainlanguage[variant=uk]{english}
	\setotherlanguage{slovenian}
	\RequirePackage[locale=UK]{siunitx} % load siunitx package for printing numers and units
\fi


% load graphics and color related packages and setup colors
\RequirePackage{graphicx}
\RequirePackage{xcolor} % {colortbl} for color tables
\RequirePackage{tikz}
\RequirePackage[all]{background} % required for chaptermarks based on TikZ

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

%identification
%xetex
%page layout
%fonts
%font sizes
%misc
%pdfnotes

%%%%
% setup page layout and page spread graphical elements
%%%%
\RequirePackage{calc} % length calculations
\RequirePackage[strict]{changepage} % TODO: check if required
\RequirePackage{ifoddpage} % TODO: check if required
\RequirePackage{ifthen} % required for whiledo loops

\newlength{\pageW}\setlength{\pageW}{6.14in}
\newlength{\pageH}\setlength{\pageH}{9.21in}
\newlength{\gridW}\setlength{\gridW}{\pageW/9}
\newlength{\gridH}\setlength{\gridH}{\pageH/9}
\newlength{\marginI}\setlength{\marginI}{\gridW}
\newlength{\marginO}\setlength{\marginO}{2\gridW}
\newlength{\marginT}\setlength{\marginT}{\gridH}
\newlength{\marginB}\setlength{\marginB}{2\gridH}

\newlength{\bindingW}\setlength{\bindingW}{0mm}
\newlength{\bleedH}\setlength{\bleedH}{0mm}
\newlength{\bleedW}\setlength{\bleedW}{0mm}
\newlength{\trimMark}\setlength{\trimMark}{0mm}
\if@press
	\setlength{\bindingW}{16mm} % widden up each page by 7.5mm / 6mm due to binding
	\setlength{\bleedH}{5mm}
	\setlength{\bleedW}{5mm}
	\setlength{\trimMark}{5mm}
\fi
\newlength{\mW}\setlength{\mW}{\trimMark+\bleedW+\bindingW+\pageW+\bleedW+\trimMark} % media width
\newlength{\mH}\setlength{\mH}{\trimMark+\bleedH+\pageH+\bleedH+\trimMark} % media height
%\newlength{\cx}\setlength{\cx}{\trimMark+\bleedW+\bindingW}
%\newlength{\cy}\setlength{\cy}{\trimMark+\bleedH}
%\newlength{\cX}\setlength{\cX}{\mW-\trimMark-\bleedW}
%\newlength{\cY}\setlength{\cY}{\mH-\trimMark-\bleedH}
%\newlength{\tx}\setlength{\tx}{\trimMark+\bleedW}
%\newlength{\ty}\setlength{\ty}{\trimMark+\bleedH}
%\newlength{\tX}\setlength{\tX}{\mW-\trimMark-\bleedW}
%\newlength{\tY}\setlength{\tY}{\mH-\trimMark-\bleedH}

\setlength{\marginparsep}{\gridW/4}
\setlength{\marginparwidth}{\marginO-3\marginparsep}
\setlength{\headheight}{\baselineskip}
\setlength{\headsep}{\gridH/4-\baselineskip} % to do \gridH/4 - depth for baseline of font!

\pgfmathsetlengthmacro{\bO}{\bindingW+\bleedW+\trimMark}
\pgfmathsetlengthmacro{\mI}{\marginI}
\pgfmathsetlengthmacro{\mO}{\marginO+\trimMark+\bleedW}
\pgfmathsetlengthmacro{\mT}{\marginT+\trimMark+\bleedH}
\pgfmathsetlengthmacro{\mB}{\marginB+\trimMark+\bleedH}

\RequirePackage[driver=xetex, papersize={\mW, \mH}, bindingoffset=\bO, left=\mI, top=\mT, right=\mO, bottom=\mB]{geometry}

% configures PDF trim, crop, bleed, media boxes
\pdfpagewidth=\mW \pdfpageheight=\mH
\paperwidth=\mW \paperheight=\mH

\let\@XeTeXTrimBoxes\relax
\def\setbpdim#1#2{\@tempdimc#2 \@tempdimc .99626\@tempdimc
	\edef#1{\strip@pt\@tempdimc}} % convert between tex pt and pdf pt (1" = 72.72 vs 72)

% if bindingW does not include bleedW setPDFboxes must be recomputed on every page!!!!
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
	\edef\@XeTeXTrimBoxes{\noexpand\special{pdf:put @thispage <<\@tmp>>}}
}
\AtBeginDocument{\setPDFBoxes}
\RequirePackage{atbegshi} % loaded by hyperref
\AtBeginShipout{%
	\setbox\AtBeginShipoutBox=\hbox{%
		\@XeTeXTrimBoxes
		\box\AtBeginShipoutBox
	}%
}

% TODO: use totcount package and
% \regtotcounter{chapter}\total{chapter}
% to definethe VOffset @deltay to step chapterMarks so that they are distributed over the whole textheight (if more than the amount that fits in)
% current max is 12 chapters ... 6.14in/13mm=11.99
% remove thmb on schapters (e.g. bibliography)
\newcommand{\@ULsquare}{13mm}
\newlength{\VOffset}\setlength{\VOffset}{-\@ULsquare}

\newlength{\gs@dpth}\settodepth{\gs@dpth}{\normalfont\normalsize q}
\newlength{\gs@bls}\setlength{\gs@bls}{\baselineskip}
\newcommand{\@drawGridSystem}
{
	% grid system
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
		\foreach \n in {1,...,\nRows} {
			\draw[dashed, red]
			(\mW-\trimMark-\bleedW-\bindingW-\marginI,-\marginT-\bleedH-\trimMark-\n\gs@bls+\gs@dpth)
			--
			(\trimMark+\bleedW+\marginO,-\marginT-\bleedH-\trimMark-\n\gs@bls+\gs@dpth);
		}
	\fi
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

\newcommand{\@drawPartMark}[1]
{
	\checkoddpage
	\ifoddpageoroneside
		\path[fill=#1]
		(\mW-\trimMark-\bleedW-\gridW/4,0)
		rectangle
		(\mW-\trimMark,-\mH);
	\else
		\path[fill=#1]
		(\trimMark,0)
		rectangle
		(\trimMark+\bleedW+\gridW/4,-\mH);
	\fi
}

% TODO: change VOffset to multiples of thechapter counter
\newcommand{\@drawChapterThumb}[1]
{
	\checkoddpage
	\ifoddpageoroneside
		\path[fill=#1]
		(\mW-\trimMark-\bleedW-\gridW/4,-\trimMark-\bleedH-\marginT-\VOffset)
		rectangle
		(\mW-\trimMark,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
	\else
		\path[fill=#1]
		(\trimMark,-\trimMark-\bleedH-\marginT-\VOffset)
		rectangle
		(\trimMark+\bleedW+\gridW/4,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
	\fi
}

\newcommand{\@drawChapterMark}[2]
{
	\checkoddpage
	\ifoddpageoroneside
		\path[fill=#1]
		(\mW-\trimMark-\bleedW-\@ULsquare,-\trimMark-\bleedH-\marginT-\VOffset)
		rectangle
		(\mW-\trimMark,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
		\node[#2] at
		(\mW-\trimMark-\bleedW-\@ULsquare/2,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare/2)
		{\fontsize{26}{30}\itshape\selectfont\thechapter\normalfont};
	\else
		\path[fill=#1]
		(\trimMark, -\trimMark-\bleedH-\marginT-\VOffset)
		rectangle
		(\trimMark+\bleedW+\@ULsquare, -\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
		\node[#2] at
		(\trimMark+\bleedW+\@ULsquare/2, -\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare/2)
		{\fontsize{26}{30}\itshape\selectfont\thechapter\normalfont};
	\fi
}
\newcommand{\@stepChapterThumb}
{
	\addtolength{\VOffset}{\@ULsquare}
	\global\@showChapterThumbtrue
}
\newcommand{\@hideChapterThumb}
{
	\global\@showChapterThumbfalse
}

\newif \if@showGridSystem \@showGridSystemfalse
\newif \if@showChapterThumb \@showChapterThumbfalse
\newif \if@isChapterPage \@isChapterPagefalse
\newif \if@isPartPage \@isPartPagefalse

\newcommand{\@drawBkgnd}
{
	% display trimMarks, chapterMarks and the grid system
	\begin{tikzpicture}[remember picture,overlay]
		\if@showGridSystem \@drawGridSystem \fi
		\if@press \@drawTrimMarks \fi
		\if@isPartPage \@drawPartMark{grey65} \fi
		\if@showChapterThumb
			\if@isChapterPage \@drawChapterMark{white}{P1797} \else \@drawChapterThumb{P1797} \fi
		\fi
	\end{tikzpicture}
}

\AtBeginDocument{%
	%\@showGridSystemtrue
	\backgroundsetup{
		contents=\@drawBkgnd, % Set tikz picture
		position={current page.north west}, % Select location
		opacity=1.0, % Select opacity
		angle=0.0, % Select roation of logo
		scale=1.0 % Select scale factor of logo
	}
}

% cover page design

% title, approvedby and previous publication page design
\def\metabox#1{\edef\theprevdepth{\the\prevdepth}\nointerlineskip
	\vbox to0pt{#1\vss}\prevdepth=\theprevdepth}
\newcommand{\@drawtitlepage}{%
	\thispagestyle{empty}
	\begin{centering}
		\if@slovene
			\vspace*{5\baselineskip}
			{\Large\itshape\color{P1797}\addfontfeature{Ligatures=Historic}%
				\@title@sl
			}\par
			
			\vspace*{1.5\baselineskip}
			{\large\upshape\addfontfeature{Ligatures=Historic}%
				\@author
			}\par
			
			\vspace*{1.5\baselineskip}
			{\normalsize\scshape\addfontfeature{Ligatures=Historic}%
				doktorska disertacija\\
				predana\\
				Fakulteti za računalništvo in informatiko\\
				kot del izpolnjevanja pogojev za pridobitev naziva\\
				doktor znanosti\\
				s področja\\
				računalništva in informatike
			}\par
		\else
			%\hbox{}\vfill\vfill\vfill
			\vspace*{5\baselineskip}
			% possible swap for \Huge\MakeUppercase + vfill
			{%\Huge\color{P1797}\addfontfeature{Ligatures=Historic}%
			 %	\MakeUppercase{\@title@en}
			 \Large\itshape\color{P1797}\addfontfeature{Ligatures=Historic}%
			 	\@title@en
			}\par
			
			%\vfill
			\vspace*{1.5\baselineskip}
			{\normalsize\scshape\addfontfeature{Ligatures=Historic}%
				A dissertation presented\\
				by}
			
			%\vfill
			\vspace*{1.5\baselineskip}
			{%\large\itshape\addfontfeature{Ligatures=Historic}%
			 \large\upshape\addfontfeature{Ligatures=Historic}%
				\@author}
			
			%\vfill
			\vspace*{1.5\baselineskip}
			{\normalsize\scshape\addfontfeature{Ligatures=Historic}%
				to\\
				The Faculty of Computer and Information Science\\
				in partial fulfilment of the requirements for the degree of\\
				Doctor of Philosophy\\
				in the subject of\\
				Computer and Information Science
			}\par
			%\vfill
		\fi
		
		\vfill
		\includegraphics{cc/uni-lj-min}
		
		{\@place,~\number\@year}\par				
	\end{centering}
}

% TODO: funding keyword
\newcommand{\maketitle}{
	\begingroup
		\begin{titlepage}%
			\@drawtitlepage
		\end{titlepage}%
		
		\if@funded
		\begin{titlepage}%
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
			
			\@drawTitlepage
		\end{titlepage}%
		\fi
		\setcounter{footnote}{0}%
	\endgroup
}

\newcommand{\makeapprovedby}{
	\begingroup
		\if@slovene
			\chapter*{Izjava}
		\else
			\chapter*{Approval}
		\fi
		\thispagestyle{empty}
		
		\begin{centering}
			\if@slovene
				\emph{Izjavljam, da sem avtor dela in da slednje ne vsebuje materiala, ki bi ga kdorkoli predhodno že objavil ali oddal 
					v obravnavo za pridobitev naziva na univerzi ali na drugem visokošolskem zavodu, razen v primerih, kjer so navedeni viri.}
			\else
				\emph{I hereby declare that this submission is my own work and that, to the best of my knowledge and belief, it contains 
					no material previously published or written by another person nor material which to a substantial extent has been accepted 
					for the award of any other degree or diploma of the university or other institute of higher learning, except where due 
					acknowledgement has been made in the text.}
			\fi
			
			--- \@author{} ---\\
			\if@slovene
				\ifcase\@month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
			\else
				\ifcase\@month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
			\fi 
			~\number\@year
			\vspace*{\baselineskip}
			
			\if@slovene
				\textsc{Oddajo so odobrili}
			\else
				\textsc{The submission has been approved by}
			\fi
			\vspace*{.5\baselineskip}
			
			% TODO: check count and make two column if page overflow
			\newcounter{id}
			\setcounter{id}{0}
			\whiledo {\value{id} < \value{approvedById}}
			{
				\stepcounter{id}			
				\csname @approvedBy@\Alph{id}\endcsname
				\vspace*{.5\baselineskip}
			}			
		\end{centering}
	\endgroup
}

\newcommand{\makepreviouspublication}{
	\ifnumgreater {\value{previousPublicationId}}{1}{
		\begingroup
			\if@slovene
				\chapter*{Predhodna objava}
			\else
				\chapter*{Previous publication}
			\fi
			\thispagestyle{empty}
			
			\if@slovene
				{Izjavljam, da so bili rezultati obravnavane raziskave predhodno objavljeni/sprejeti za objavo v recenzirani reviji 
					ali javno predstavljeni v naslednjih primerih:}\par
			\else
				{I hereby declare that the research reported herein was previously published/submitted for publication in peer reviewed 
					journals or publicly presented at the following occasions:}\par
			\fi
			
			\vspace*{\baselineskip}
			\begin{centering}
				\begin{minipage}{\linewidth-1em}
					{\small \raggedright
						\begin{enumerate}[{[}1{]}]
							\newcounter{id}
							\setcounter{id}{0}
							\whiledo {\value{id} < \value{previousPublicationId}}
							{
								\stepcounter{id}			
								\item \csname @previousPublicationId@\Alph{id}\endcsname
							}			
						\end{enumerate}
						\fi
					}
				\end{minipage}\par
			\end{centering}
			
			\vspace*{\baselineskip}
			\if@slovene
				{Potrjujem, da sem pridobil pisna dovoljenja vseh lastnikov avtorskih pravic, ki mi dovoljujejo vključitev zgoraj 
					navedenega materiala v pričujočo disertacijo. Potrjujem, da zgoraj navedeni material opisuje rezultate raziskav, 
					izvedenih v času mojega podiplomskega študija na Univerzi v Ljubljani.}\par
			\else
				{I certify that I have obtained a written permission from the copyright owner(s) to include the above published 
					material(s) in my thesis. I certify that the above material describes work completed during my registration 
					as graduate student at the University of Ljubljana.}\par
			\fi
		\endgroup
	}{}
}


% define chapter\section\figure\page counters and parameters
\setlength\overfullrule{0pt}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
%\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
% control floats
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

% define chapter\section\figure names
%\newcommand\chaptername{\empty}
%\newcommand\contentsname{Contents}
%\newcommand\listfigurename{List of Figures}
%\newcommand\listtablename{List of Tables}
%\newcommand\bibname{Bibliography}
\if@slovene
%\providecommand\biographyname{Biografija}
\else
%\providecommand\biographyname{Biography}
\fi
\if@slovene
%\providecommand\bibliographyname{Osebna bibliografija}
\else
%\providecommand\bibliographyname{Personal bibliography}
\fi
%\newcommand\indexname{Index}
%\newcommand\figurename{Figure}
%\newcommand\tablename{Table}
%\newcommand\partname{Part}
%\newcommand\appendixname{Appendix}
%\def\today{\ifcase\@month\or
%	January\or February\or March\or April\or May\or June\or
%	July\or August\or September\or October\or November\or December\fi
%	\space\number\day, \number\@year}


% forntmatter, mainmatter, backmatter
\newcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagenumbering{roman}}
\newcommand\mainmatter{%
	\cleardoublepage
	\@mainmattertrue
	\pagenumbering{arabic}}
\newcommand\backmatter{%
	\cleardoublepage
	\@mainmatterfalse}


% TODO
% define part/chapter/section numbering
\newcounter{part}
\renewcommand{\thepart}{\@Roman\c@part}
\newcounter{chapter}
\renewcommand \thechapter {\@arabic\c@chapter}
\newcounter{section}[chapter]
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\newcounter{subsection}[section]
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\newcounter{subsubsection}[subsection]
\renewcommand \thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\newcounter{paragraph}[subsubsection]
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\newcounter{subparagraph}[paragraph]
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

\newcommand{\chaptername}{\empty}
\newcommand{\@chapapp}{\chaptername}

%
\newcommand{\part}{
	\cleardoublepage
	\thispagestyle{empty}%
	\@hideChapterThumb	
	\secdef\@part\@spart
}

\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}%
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
	\else
		\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	\global\@isPartPagetrue
	\null
	\vfil
	{
		\begin{flushright}
			%\color{P1797}
			\large \partname\nobreakspace\thepart\par
			\fontsize{32}{32}\itshape\selectfont #2\par
			\normalcolor\normalfont
		\end{flushright}
	}%
	\newpage
	\null\vfill
	\thispagestyle{empty}
	\newpage
	\global\@isPartPagefalse
	\@afterheading
}
\def\@spart#1{%
	\markboth{}{}%
	\global\@isPartPagetrue
	\null
	\vfil
	{
		\begin{flushright}
			%\color{P1797}
			\fontsize{32}{32}\itshape\selectfont #1\par
			\normalcolor\normalfont
		\end{flushright}
	}%
	\newpage
	\null\vfill
	\thispagestyle{empty}
	\newpage
	\global\@isPartPagefalse
	\@afterheading
}

% chapter formatting
\newcommand{\chapter}{
	\cleardoublepage
	\thispagestyle{chapter}%
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter}
% TODO add toc keyword?
\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\refstepcounter{chapter}%
		\typeout{\@chapapp\space\thechapter.}%
		\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\texorpdfstring{\protect\parbox[t]{0.9\linewidth}{#1}}{#1}}%%
		%\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}		
	\else
		\addcontentsline{toc}{chapter}{\texorpdfstring{\protect\parbox[t]{0.9\linewidth}{#1}}{#1}}%
		%\addcontentsline{toc}{chapter}{#1}
	\fi
	\chaptermark{#1}
	\@makechapterhead{#2}%
	\@afterheading
}

%{\protect\numberline{\thechapter}\texorpdfstring{\protect\parbox[t]{0.9\linewidth}{#2}}{#2}}%  
%\else  
%\addcontentsline{toc}{chapter}{\texorpdfstring{\protect\parbox[t]{0.9\linewidth}{#2}}{#2}}%  
%\fi  
%\addtocontents{toc}{\protect\addvspace{0.5\baselineskip}}% Some spacing   afterwards

\def\@makechapterhead#1{%
	\global\@isChapterPagetrue
	\pagecolor{P1797} % TODO: if draft
	\@stepChapterThumb % TODO: if draft
	\null
	\vfil
	{
		\begin{flushright}
			\fontsize{26}{30}\itshape\selectfont
			\color{white} % TODO: if draft
			#1%
			\normalcolor\normalfont
		\end{flushright}
	}
	\newpage
	\global\@isChapterPagefalse
	\pagecolor{white}
}
\def\@schapter#1{%
	\@hideChapterThumb
	\@makeschapterhead{#1}%
	\@afterheading
}
\def\@makeschapterhead#1{%
	\vspace*{4\baselineskip}%
	\begin{centering}
		{\Large\scshape%
			\color{P1797}
			\@xp\uppercase\@xp{#1}
		}\par
	\end{centering}
	\vspace*{3\baselineskip}
}

\newcommand{\section}{%
	\@startsection {section}{1}{\z@}%
	{-2.5ex \@plus -1ex \@minus -.2ex}%{\baselineskip}
	{2.3ex \@plus.2ex}%{0ex}%
	{\color{P1797}\large\itshape}
}


\newcommand{\subsection}{
	\@startsection{subsection}{2}{\z@}%
	{-2.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\color{P1797}\itshape}
}
\newcommand{\subsubsection}{
	\@startsection{subsubsection}{3}{\z@}%
	{-2.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\color{P1797}\normalsize\itshape}
}
\newcommand\paragraph{
	\@startsection{paragraph}{4}{\z@}%
	{2.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\color{P1797}\normalsize\itshape}
}
\newcommand\subparagraph{
	\@startsection{subparagraph}{5}{\parindent}%
	{2.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\color{P1797}\normalsize\normalfont}
}

% ensure empty odd pages
\renewcommand{\cleardoublepage}{
	\clearpage
	\checkoddpage
	\ifoddpage
	\else
		{\hbox{}\thispagestyle{empty}\clearpage}
	\fi
}

\RequirePackage{fancyhdr}
\pagestyle{fancy}  % setup all hooks and declare \chaptermark, \sectionmark; must be called after the definition of \chapter, \section, etc.

%\show\chapter
%\show\@chapter

% TODO:  remove page number
%\fancypagestyle{chapter}{%
%	\ps@empty
%	\if@forreview
%		\fancyfoot{\hfil\if@isChapterPage\color{white}\sffamily\textbf{\today}\normalcolor\fi\hfil}
%	\fi	
%}
\def\ps@chapter{% is this required? change to fancypage style
	\ps@empty
	\if@forreview
	\def\@oddfoot{\hfil\normalfont\footnotesize\if@isChapterPage\color{white}\fi\thepage\hfil\sffamily\footnotesize\today\normalcolor}
	\else
	\def\@oddfoot{\hfil\normalfont\footnotesize\if@isChapterPage\color{white}\fi\thepage\normalcolor\hfil}
	\fi
	\let\@evenfoot\@oddfoot
}

% TODO: book redesign; change running heads, should probably change color as well (printing issues)
%	\renewcommand*{\sectionmark}[1]{ 
%	%		\PackageInfo{FRIteza}{S LM->\leftmark}
%	%		\PackageInfo{FRIteza}{S RM->\rightmark}
%	%		\markboth{\leftmark}{S ##1} 
%	}%\markboth{##1}{\if@slovene\@title@slA\else\@title@enA\fi} }%
%\renewcommand*{\chaptermark}[1]{ 
%	%		\PackageInfo{FRIteza}{C LM->\leftmark}
%	%		\PackageInfo{FRIteza}{C RM->\rightmark}
%	\markboth{\thechapter\ ##1}{\if@slovene\@title@slA\else\@title@enA\fi} 
%	}%\if@slovene\@title@slA\else\@title@enA\fi} }% { \markboth{##1}{} }%
%	\fancyhead[LE]{{\itshape\thepage\settowidth{\@tempdima}{\thepage}\addtolength{\@tempdima}{-\gridW/2}\hspace*{-\@tempdima}}%
%		\small\color{grey65}\@author@A}%
%	\fancyhead[RE]{\color{grey65}\small\leftmark}%\@author@A}
%	\fancyhead[LO]{\color{grey65}\small\rightmark}%\if@slovene\@title@slA\else\@title@enA\fi}
%   L: Author \hfill Title R: Chapter \hfill section?
%   perhaps add \iffloatpage{}{} and make float pages have no running heads, see https://www.thebookdesigner.com/2014/03/how-to-design-running-heads-for-your-book/
\fancypagestyle{FRIteza}{%
	\fancyhf{}%
	% Note the ## here. It's required because \fancypagestyle is making a macro (\ps@FRIteza).
	% If we just wrote #1, TeX would think that it's the argument to \ps@FRIteza, but
	% \ps@FRIteza doesn't take any arguments, so TeX would complain with an error message.
	% You are not expected to understand this.
	\renewcommand*{\sectionmark}[1]{ 
		\markright{\thesection\ ##1}
	}
	\renewcommand*{\chaptermark}[1]{ 
		\markboth{\thechapter\ ##1}{} 
	}
	% Increase the length of the header such that the folios
	% (typography jargon for page numbers) move into the margin
	\fancyhfoffset[LE]{\gridW/2}
	\fancyhfoffset[RO]{\gridW/2}
	% Put some space and a vertical par between the folio and the rest of the header
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	% compute length of skip: offset - width of \ssfamily\textbf{\thepage}
	\fancyhead[LE]{{\itshape\thepage\settowidth{\@tempdima}{\thepage}\addtolength{\@tempdima}{-\gridW/2}\hspace*{-\@tempdima}}%
     	\small\color{grey65}\leftmark}%
    \fancyhead[RE]{\color{grey65}\small\@author@A}
    \fancyhead[LO]{\color{grey65}\small\if@slovene\@title@slA\else\@title@enA\fi}
	\fancyhead[RO]{\itshape\thepage}%
}
\pagestyle{FRIteza}

% footnotes
\@addtoreset{footnote}{chapter}
\renewcommand{\footnoterule}{%
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@%
}
\newcommand{\@makefntext}[1]{%
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}#1%
}

% equations
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{%
	\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation%
}

% figures
\newcounter{figure}[chapter]
\renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp} % set default figure placement to t, b, p
\def\ftype@figure{1} % see https://tex.stackexchange.com/questions/32359/what-is-the-exact-purpose-of-ftypetype
\def\ext@figure{lof} % store figure captions in .lof for list of figures (.toc to be part of table of contents)
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
	{\@float{figure}}
	{\end@float}
\newenvironment{figure*}
	{\@dblfloat{figure}}
	{\end@dblfloat}

% tables
\newcounter{table}[chapter]
\renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp} % set default table placement to t, b, p
\def\ftype@table{2} % see https://tex.stackexchange.com/questions/32359/what-is-the-exact-purpose-of-ftypetype
\def\ext@table{lot} % store figure captions in .lot for list of tables (.toc to be part of table of contents)
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
	{\@float{table}}
	{\end@float}
\newenvironment{table*}
	{\@dblfloat{table}}
	{\end@dblfloat}

% captions
\newlength\abovecaptionskip\setlength\abovecaptionskip{10\p@}
\newlength\belowcaptionskip\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	{\itshape #1\hskip3.4pt\par\vskip2mm}{\RaggedRight\scriptsize #2\par}
	%{\scriptsize\sffamily \@hangfrom{{\itshape #1}\hskip3.4pt}#2 \par}
	\vskip\belowcaptionskip
}

% TODO debug
%\showthe\marginparsep
%\showthe\marginparwidth
%\showthe\leftmargin
%\showthe\rightmargin

% figure and table caption positioning
\RequirePackage{floatrow} %solve for subfigures!!!
%\DeclareCaptionSubType[alph]{figure}
%\captionsetup[subfigure]{labelformat=brace,justification=centerlast}
%\floatsetup[subfigure]{style=plain,heightadjust=object}
\DeclareColorBox{framedfigure}{\fcolorbox{grey20}{white}}
\floatsetup[figure]{%
	margins=hangoutside,
	capposition=beside,
	capbesideposition={outside,bottom},
	facing=yes,
	floatwidth=\textwidth,
	objectset=centering,
	framefit=yes,
	colorframeset=framedfigure,
	framestyle=colorbox,
	frameset={\fboxrule1pt\fboxsep2.5pt}%
}
% TODO add to documentation \includegraphics[width=\figurewidth]
\newlength{\figurewidth}\setlength{\figurewidth}{\textwidth-7pt} % save the max width of a figure taking into account the encompasing frame
\floatsetup[table]{%
	capposition=top
}

% lists
\RequirePackage{enumerate} % review use of enumerate package
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
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

% table of contents see http://mirrors.concertpass.com/tex-archive/macros/latex/contrib/tocloft/tocloft.pdf
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
	\@xp\chapter\@xp*\@xp{\contentsname \@mkboth{\contentsname}{\contentsname}}%
	\@starttoc{toc}%
}
%\RequirePackage{titletoc}
%\titlecontents{chapter} [0pt] {\addvspace{1pc}% 
%	\itshape}% 
%	{\contentsmargin{0pt}% 
%		\bfseries \makebox[0pt][r]{\huge\thecontentslabel\enspace}% 
%		\large} 
%	{\contentsmargin{0pt}% 
%		\large} 
%	{\quad\thepage} [\addvspace{.5pc}]
%	
%\contentsmargin{0pt}
%\titlecontents*{section}[3.8em]{\filright\small}{}{\contentslabel}{,~\emph{\thecontentspage}}[\quad\textbullet\quad][.]
%\titlecontents{chapter} [1em] {} {\contentslabel} {} {\titlerule*[1pc]{.}\contentspage}
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
	\fi
}
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
	\fi
}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\AtBeginDocument{%
	\setcounter{secnumdepth}{2}
	\setcounter{tocdepth}{2}
	\ps@FRIteza
	\raggedbottom
%   correct language already active
%	\if@slovene
%		\selectlanguage{slovenian}
%	\else
%		\selectlanguage{english}
%	\fi
}
\AtEndDocument{
}

%%%%
% define common macros
%%%%
\RequirePackage{xkeyval}
\ExplSyntaxOn

% switchcase command
\NewDocumentCommand \switchcase { m m m }
{
	\str_case_x:nnF { #1 } { #2 } { #3 }
}

\ExplSyntaxOff

\newcommand{\@place}{Ljubljana}
\newcommand{\@month}{\number\month}
\newcommand{\@year}{\number\year}
\newcommand{\forceDate}[2]{
	\gdef\@month{#1}
	\gdef\@year{#2}
}

\define@cmdkey{author}{A}[]{}
\renewcommand{\author}[2][]{
	\begingroup
		\setkeys{author}{#1}
		\gdef\@author{#2}
		\ifundef{\cmdKV@author@A}
			{\expandafter\gdef\expandafter\@author@A\expandafter{\@author}}
			{\expandafter\gdef\expandafter\@author@A\expandafter{\cmdKV@author@A}}
		\hypersetup{
			pdfinfo={
				Author={\@author}
			}
		}%
	\endgroup
}

\define@cmdkey{title}{A}[]{}
\define@cmdkey{title}{language}[]{}
\renewcommand{\title}[2][]{
	\begingroup
		\setkeys{title}{#1}
		\switchcase{\cmdKV@title@language}
		{
			{slovene} {
				\gdef\@title@sl{#2}
				\ifundef{\cmdKV@title@A}
					{\expandafter\gdef\expandafter\@title@slA\expandafter{\@title@sl}}
					{\expandafter\gdef\expandafter\@title@slA\expandafter{\cmdKV@title@A}}
			}
			{english} {
				\gdef\@title@en{#2}
				\ifundef{\cmdKV@title@A}
					{\expandafter\gdef\expandafter\@title@enA\expandafter{\@title@en}}
					{\expandafter\gdef\expandafter\@title@enA\expandafter{\cmdKV@title@A}}
				\hypersetup{
					pdfinfo={
						Title={\@title@enA},
						Subject={PhD thesis}
					}
				}
			}
		}{%
			\PackageError{FRIthesis}{The \protect\title\space macro must select language variant,\MessageBreak allowed slovene or english, supplied "\cmdKV@title@language"}
		}
	\endgroup
}

\define@cmdkey{keywords}{language}[]{}
\newcommand{\keywords}[2][]{
	\begingroup
		\setkeys{keywords}{#1}
		\switchcase{\cmdKV@keywords@language}
		{
			{slovene} {
				\gdef\@keywords@sl{#2}
			}
			{english} {
				\gdef\@keywords@en{#2}
				\hypersetup{
					pdfinfo={
						Keywords={\@keywords@en},
					}
				}
			}
		}{%
			\PackageError{FRIthesis}{The \protect\keywords\space macro must select language variant,\MessageBreak allowed slovene or english, supplied "\cmdKV@keywords@language"}
		}
	\endgroup
}

\newcounter{approvedById}
\define@cmdkey{approvedBy}{affiliation}[]{}
\define@cmdkey{approvedBy}{title}[]{}
\define@cmdkey{approvedBy}{role}[]{}
\newcommand{\approvedBy}[2][]{
	\begingroup
		\setkeys{approvedBy}{#1}
		\stepcounter{approvedById}
		% if more than 6 issue error
		\expandafter\xdef\csname @approvedBy@\Alph{approvedById}\endcsname{
			#2\par
			\ifundef{\cmdKV@approvedBy@title}
				{\relax}
				{\noexpand\small\noexpand\emph{\cmdKV@approvedBy@title}\par}
			\ifundef{\cmdKV@approvedBy@role}
				{\relax}
				{\noexpand\textsc{\cmdKV@approvedBy@role}\par}
			\ifundef{\cmdKV@approvedBy@affiliation}
				{\relax}
				{{\cmdKV@approvedBy@affiliation}\par}
		}
	\endgroup
}

\newcounter{previousPublicationId}
%\newcommand{\previousPublication}[1]{
%	\begingroup
%		\stepcounter{previousPublicationId}
%		\expandafter\xdef\csname @previousPublication@\Alph{previousPublicationId}\endcsname{
%			#1\par
%		}
%	\endgroup
%}

% environments
\newenvironment{titlepage}{
	\thispagestyle{empty}%
	\setcounter{page}\@ne
}{
	\cleardoublepage
}

\newenvironment{abstract}{
	\if@slovene
		\selectlanguage{english}
	\fi
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
				\emph{\@title@en}\\
			}
		\end{centering}
	}
	\@afterheading
	\@afterindentfalse
}{
	\par \vspace{10pt}
	{\noindent\emph{Key words}\quad\@keywords@en\par}
%   on exit from environment swap to main language is automatic
%	\if@slovene
%		\selectlanguage{slovenian}
%	\fi
}

\newenvironment{povzetek}{
	\if@slovene
	\else
		\selectlanguage{slovenian}
	\fi
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
				\emph{\@title@sl}\\
			}
		\end{centering}
	}
	\@afterheading
	\@afterindentfalse
}{
	\par \vspace{10pt}
	{\noindent\emph{Ključne besede}\quad\@keywords@sl\par}
%   on exit from environment swap to main language is automatic
%	\if@slovene
%	\else
%		\selectlanguage{english}
%	\fi
}

\newenvironment{acknowledgements}
{
	\if@slovene
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
}{
	\endgroup%
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

% bibliography environment [require pnas2011 style]
%\newdimen\bibindent
%\setlength\bibindent{1.5em}
%\def\bibliographystyle#1{%
%	\if@filesw\immediate\write\@auxout{\string\bibstyle{#1}}\fi
%	\def\@tempa{#1}%
%	\def\@tempb{amsplain}%
%	\def\@tempc{}%
%	\ifx\@tempa\@tempb
%	\def\@biblabel##1{##1.}%
%	\def\bibsetup{}%
%	\else
%	\def\bibsetup{\labelsep6\p@}%
%	\ifx\@tempa\@tempc
%	\def\@biblabel##1{}%
%	\def\bibsetup{\labelwidth\z@ \leftmargin24\p@
%		\itemindent-24\p@
%		\labelsep\z@ }%
%	\fi
%	\fi}
%\if@PhDp
%\def\bib@heading{%
%	\section{\bibname}%
%}
%\fi
% dummy thebibiliography environment as it is redefined by natbib
\newenvironment{thebibliography}[1]{}{}%
%	\if@PhDp
%	\section*{\bibname}%
%	\else
%	\@xp\chapter\@xp*\@xp{\bibname}%
%	\fi
%	\@mkboth{\bibname}{\bibname}
%	\vspace{18.5pt}
%	\addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
%	\labelsep .5em\relax
%	\renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
%	\list{\@biblabel{\theenumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
%		\leftmargin\labelwidth \advance\leftmargin\labelsep
%		\usecounter{enumiv}}%
%	\sloppy \clubpenalty\@M \widowpenalty\clubpenalty
%	\sfcode`\.=\@m
%	\if@PhD
%	\normalfont\footnotesize\setsinglelinespacing
%	\fi
%}{%
%	\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
%	\endlist
%}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
%\let\@openbib@code\@empty

\providecommand{\url}[1]{\href{#1}{#1}}
\providecommand{\doi}[1]{doi:~\href{http://dx.doi.org/#1}{#1}}

\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{multicol}
\renewcommand{\bibpreamble}{
	\@mkboth{\bibname}{\bibname}
	\addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
}


%%newif inappendices
%\newif\if@appendices \@appendicesfalse
%\newif\if@subappendices \@subappendicesfalse
%\newcounter{subappendices}
%\newenvironment{appendices}
%{
%	\if@subappendices 
%		\PackageError{FRIteza}{The 'appendices' environment can not be used inside the 'subappendices' environment}
%		\stop
%	\fi
%	\@appendicestrue
%	\ifnum \c@subappendices > \z@
%		\gdef\thechapter{\@Roman\c@chapter}
%	\else
%		\gdef\thechapter{\@Alph\c@chapter}
%	\fi
%%	\setcounter{@ppsavedchapter}{\value{chapter}}
%	\setcounter{chapter}{0}
%%	\setcounter{section}{0}
%%	\gdef\@chapapp{\appendixname}%
%%	\global\renewcommand\section{
%%		\@startsection{paragraph}{4}{\z@}%
%%		{2.25ex \@plus1ex \@minus.2ex}%
%%		{-1em}%
%%		{\color{P1797}\normalsize\scshape}
%%	}
%}{
%%	\setcounter{chapter}{\value{@ppsavedsection}}
%%	\gdef\@chapapp{\chaptername}%
%	\gdef\thechapter{\@arabic\c@chapter}
%}
%
%\newenvironment{subappendices}
%{
%	% start counting from 0 continue throuhh subapendices level section	
%	\if@appendices 
%		\PackageError{FRIteza}{The 'subappendices' environment can not be used inside the 'appendices' environment}
%		\stop
%	\fi
%	\@subappendicestrue
%
%	% disable numbering for section, but change numbering for subsection
%    % continue the numbering of subappendices
%	\setcounter{section}{\c@subappendices}
%	\renewcommand{\thesection}{\Alph{section}} % remove numbering force to star version
%	\renewcommand{\theHsection}{\arabic{chapter}.\Alph{section}}
%	\renewcommand{\theHsubsection}{\theHsection.\arabic{subsection}}
%	\renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}
%	\setcounter{figure}{0}
%	\renewcommand{\thefigure}{\Alph{section}.\arabic{figure}}
%	\renewcommand{\theHfigure}{\theHsection.\arabic{figure}}
%	\setcounter{table}{0}
%	\renewcommand{\thetable}{\Alph{section}.\arabic{table}}
%	\renewcommand{\theHtable}{\theHsection.\arabic{table}}
%	\setcounter{equation}{0}
%	\renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
%	\renewcommand{\theHequation}{\theHsection.\arabic{equation}}
%	% hack addtoccontents to generate star section
%%	\section{\textsc{Supplementary material}}
%}{
%	% return to old style
%	\setcounter{subappendices}{\c@section}
%}

%\newenvironment{description}{}{}
%\newenvironment{defn}{}{}
% TODO: revise
\newcommand\definitionname{Definition}
\if@slovene
	\renewcommand{\definitionname}{Definicija}
\fi
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

% hyperref and pdfsupport
% !!! probably must be loaded last as it hooks on \maketitle \chapter and others
\thispagestyle{empty}
\pagenumbering{roman} % must be provided for hyperref: pdfpagelabels to work properly
\setcounter{page}\@ne 
%\RequirePackage{hyperxmp}
%\RequirePackage[xetex,pdfa,pdfdisplaydoctitle=true,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true]{hyperref}
% TODO: highlighting
% \RequirePackage{soul} % higlighting alternative
% \RequirePackage{pdfcomment}
% TODO: authorcomments
\newcommand{\sidenote}[2]{#1}

\show\@ifstar
\show\@startsection
\show\@sect
\show\@ssect
\endinput

%%
%% End of file `FRIthesis.cls'.
