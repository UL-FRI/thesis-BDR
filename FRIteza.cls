%%
%% This is file `FRIteza.cls'
%%
%% (c) 2005-2018 Iztok Lebar Bajec
%%

% Options of the FRI thesis document class:
% - language=english for writing in english as main language [default]
% - language=slovene for writing in slovene as main language
%
% - funding=logo.pdf for a funded doctoral thesis - doktorska disertacija MR iz gospodarstva
%
% - stage=pre-alpha for early drafts - no chapter thumbs, smaller page size, which leads to increased font sizes when printed on A4 fit to page [seeks for images in directories /img_LQ, /img]
% - stage=alpha for first review by advisor - no chapter thumbs, smaller page size, which leads to increased font sizes when printed on A4 fit to page [seeks for images in directories /img_LQ, /img]
% - stage=beta for seminar 5 - no chapter thumbs, smaller page size, which leads to increased font sizes when printed on A4 fit to page [seeks for images in directories /img_LQ, /img]
% - stage=gamma for senate approval - no chapter thumbs, TODO: includes notes showing reviewer comments (and author response) [seeks for images in directories /img_LQ, /img]
% - stage=gold for final approved version - notes not displayed, chapter pages in colour, chapter thumbs [seeks for images in directories /img_LQ, /img]
% - stage=press for print version - gold with trim marks [seeks for images in directories /img_HQ, /img]


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{FRIteza}[v2.20190305
                        XeLaTeX doctoral dissertation class]

\RequirePackage{ifxetex}
\RequireXeTeX

%\newwrite\finder
%\immediate\openout\finder=\jobname.fnd
%\RequirePackage{filehook,currfile}
%
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
%
%\searchmacro\theabspage

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

%TODO: instructions
%TODO: check \texttt and \textsf for rm, it, bf, bfit

\RequirePackage{xkeyval} % key=value command parameters
\RequirePackage{expl3, xparse} % LaTeX3 code
% enter LaTeX3 code
\ExplSyntaxOn

% switchcase command
\NewDocumentCommand \switchcase { m m m }
{
  \str_case_x:nnF { #1 } { #2 } { #3 }
}

\ExplSyntaxOff

% TODO: swap to etoolbox bool definitions
\newif \if@dev \@devfalse
\newif \if@press \@pressfalse
\newif \if@funded \@fundedfalse
\newif \if@slovene \@slovenefalse
\newif \if@mainmatter \@mainmattertrue


\DeclareOptionX{language}{%
  \switchcase{#1}
  {
    {slovene} {\@slovenetrue}
    {english} {\@slovenefalse}
  }{%
    \ClassError{FRIteza}{The FRIteza class supports only the\MessageBreak slovene and english language variant,\MessageBreak supplied "#1"}{}
  }
}
\DeclareOptionX{funding}[]{%
  \global\@fundedtrue
  \gdef\@companyLogo{#1}
}
\DeclareOptionX{stage}{%
 \@ifundefined{stage}{
    \switchcase{#1}
    {
      {pre-alpha} {\@devtrue}
      {alpha} {\@devtrue}
      {beta} {\@devtrue}
      {gamma} {\@devtrue}
      {gold} {\@devfalse}
      {press} {\@devfalse \@presstrue}
    }{%
      \ClassError{FRIteza}{The FRIteza class supports stages\MessageBreak pre-alpha, alpha, beta, gamma, gold and press,\MessageBreak supplied "#1"}{}
    }
  }{%
    \switchcase{\stage}
    {
      {pre-alpha} {\@devtrue}
      {alpha} {\@devtrue}
      {beta} {\@devtrue}
      {gamma} {\@devtrue}
      {gold} {\@devfalse}
      {press} {\@devfalse \@presstrue}
    }{%
      \ClassError{FRIteza}{The FRIteza class supports stages\MessageBreak pre-alpha, alpha, beta, gamma, gold and press,\MessageBreak supplied "\stage"}{}
    }
  }
}

\DeclareOptionX*{\ClassWarning{FRIteza}{`\CurrentOption' ignored}}
\ExecuteOptionsX{language=english,stage=pre-alpha}
\ProcessOptionsX*

\@twosidetrue
\@mparswitchtrue

%
\special{pdf:minorversion 7}

%%%%
%% load typography related packages
%%%%
% TODO test with just two font sizes 12 & 8 as optical size, compute best font size based on width of body text; see vaignelli cannon & memoire.pdf
% https://pearsonified.com/2011/12/golden-ratio-typography.php
% http://ftp.math.purdue.edu/mirrors/ctan.org/info/memdesign/memdesign.pdf pg 48
\input{FRIteza.clo} % TODO: font sizes, convert to bp [check use of all fontsizes and declare appropriately, headers, footnotes, captions, etc.]

%\RequirePackage{ebgaramond}
%\RequirePackage{ebgaramond-maths} % should this be included for proper microtype?

\RequirePackage{microtype}
% patch for microtype to stop producing Unknown slot number warnings,
% see discussion at https://tex.stackexchange.com/questions/373594/microtype-producing-dozens-of-unknown-slot-number-warnings/
\@ifpackagelater{microtype}{2017/07/07} %
{
  % no need to pach
}
{
  \ClassInfo{FRIteza}{Patching microtype pre-v2.7 2017/07/07 to to stop producing Unknown slot number warnings}
  \def\MT@is@composite#1#2\relax{%
    \ifx\\#2\\\else
      \expandafter\def\expandafter\MT@char\expandafter{\csname\expandafter
        \string\csname\MT@encoding\endcsname
        \MT@detokenize@n{#1}-\MT@detokenize@n{#2}\endcsname}%
      % 3 lines added:
      \ifx\UnicodeEncodingName\@undefined\else
        \expandafter\expandafter\expandafter\MT@is@uni@comp\MT@char\iffontchar\else\fi\relax
      \fi
      \expandafter\expandafter\expandafter\MT@is@letter\MT@char\relax\relax
      \ifnum\MT@char@ < \z@
        \ifMT@xunicode
          \edef\MT@char{\MT@exp@two@c\MT@strip@prefix\meaning\MT@char>\relax}%
            \expandafter\MT@exp@two@c\expandafter\MT@is@charx\expandafter
              \MT@char\MT@charxstring\relax\relax\relax\relax\relax
        \fi
      \fi
    \fi
  }
  % new:
  \def\MT@is@uni@comp#1\iffontchar#2\else#3\fi\relax{%
    \ifx\\#2\\\else\edef\MT@char{\iffontchar#2\fi}\fi
  }
}

\RequirePackage{realscripts} % for textsubscripts and textsuperscripts
\RequirePackage{amsmath} % must be loaded before unicode-math to avoid conflicts
\RequirePackage{amssymb}
% TODO: % add note to documentation about mathbf, mathrm, symbf, symrm;
% see http://mirrors.rit.edu/CTAN/macros/latex/contrib/unicode-math/unicode-math.pdf pg 5
\RequirePackage[math-style=french,bold-style=upright]{unicode-math} % TODO ,mathrm=sym,mathbf=sym ... causes issues with \siunitx [uppercase numerals in text] TODO: sans serif greek!!!
\RequirePackage{ragged2e} % for flushleft justification with hyphenation turned on

\setmainfont{EBGaramond}[ % https://github.com/georgd/EB-Garamond
  Path=fonts/EBGaramond/,
  Ligatures={TeX,Discretionary},
  Extension=.otf,
  UprightFont=EBGaramond12-Regular,
  UprightFeatures={
    SizeFeatures={
      {Size=-8, Font={*08-Regular}},% Numbers={Lining}},
      {Size= 8-, Font={*12-Regular}}
    }
  },
  ItalicFont=EBGaramond12-Italic,
  ItalicFeatures={
    SizeFeatures={
      {Size=-8, Font={*08-Italic}},% Numbers={Lining}},
      {Size= 8-, Font={*12-Italic}}
    }
  },
%	BoldFont={EBGaramond12-Italic.otf},
%	BoldFeatures={
%		SizeFeatures={
%			{Size=-8, Font={EBGaramond08-Italic.otf}},% Numbers={Lining}},
%			{Size= 8-, Font={EBGaramond12-Italic.otf}}
%		}
%	},
  Mapping=tex-text,
  Numbers={OldStyle},
  AutoFakeBold=1.5
]

\setsansfont{SourceSansPro}[ % https://github.com/adobe-fonts/source-sans-pro, 2.020R-ro/1.075R-it
  Path=fonts/SourceSansPro/,
  Extension=.otf,
  Mapping=tex-text,
  Ligatures={TeX},
  Numbers={OldStyle},
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt,
  Scale=MatchLowercase
]

\setmonofont{SourceCodePro}[ % https://github.com/adobe-fonts/source-code-pro, 2.030R-ro/1.050R-it
  Path=fonts/SourceCodePro/,
  Extension=.otf,
  Mapping=tex-text,
  Ligatures={TeX},
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt,
  Numbers={OldStyle},
  Scale=MatchLowercase
]

%\setmathfont[Scale=MatchLowercase]{XITS Math} % base math font
%\setmathfont{Asana Math} % base font until v1.2.20170526
%\setmathfont{EB Garamond} % To use in the future?
% TODO: check printed
% base math font to use in the future? [override only bold and bolditalic, greek italic!!]
\setmathfont{Garamond-Math}[ % https://github.com/YuanshengZhao/Garamond-Math
  Path=fonts/Garamond-Math/,
  Extension=.otf,
  StylisticSet={1,4} % Garamond based blackboard, Semibold, SemiboldItalic
]

% override math sans serif fonts
%\setmathfont{SourceSansPro-Regular.otf}[
%	Path=./fonts/SourceSansPro/,
%	range=\mathsfup/{num,latin,Latin},
%	Script=Latin,
%	Scale=MatchLowercase,
%]
%\setmathfont{SourceSansPro-It.otf}[
%	Path=./fonts/SourceSansPro/,
%	range=\mathsfit/{latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]
%\setmathfont{SourceSansPro-Semibold.otf}[
%	Path=./fonts/SourceSansPro/,
%	range=bfsfup/{num,latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]
%\setmathfont{SourceSansPro-SemiboldIt.otf}[
%	Path=./fonts/SourceSansPro/,
%	range=bfsfit/{latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]
%
%% override math mono fonts
%\setmathfont{SourceCodePro-Regular.otf}[
%	Path=./fonts/SourceCodePro/,
%	range=ttup/{num,latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]
%\setmathfont{SourceCodePro-It.otf}[
%	Path=./fonts/SourceCodePro/,
%	range=ttit/{num,latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]
%\setmathfont{SourceCodePro-Semibold.otf}[
%	Path=./fonts/SourceSansPro/,
%	range=bfttup/{num,latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]
%\setmathfont{SourceCodePro-SemiboldIt.otf}[
%	Path=./fonts/SourceCodePro/,
%	range=bfttit/{num,latin,Latin,greek,Greek},
%	Script=Latin,
%	Scale=MatchLowercase
%]

%\setmathfont{EBGaramond-Medium.otf}[
%	Path=fonts/EBGaramond12/,
%	range=\mathup/{num,latin,Latin,greek,Greek},
%	Numbers={Lining},
%	Script=Latin
%]

%\setmathfont{EBGaramond-MediumItalic.otf}[
%	Path=fonts/EBGaramond12/,
%	range=\mathit/{latin,Latin,greek,Greek},
%	Numbers={Lining},
%	Script=Latin
%]

%\setmathfont{EBGaramond12-Regular.otf}[
%	Path=fonts/EBGaramond/,
%	range=\mathup/{num,latin,Latin,greek,Greek},
%	Ligatures={TeX},
%	Numbers={Lining}, % force lining numbers for math
%	Script=Latin, % force the use of Latin script (suppresses fontspec warning 'Math'->'Latin' script)
%	SizeFeatures={ % optical sizes, this overrides (s)script-font/-features
%		{Size=-8, Font={EBGaramond08-Regular.otf}, Numbers={Lining}}, % force lining numbers for (s)scripts
%		{Size= 8-, Font=*}
%	}
%]

%\setmathfont{EBGaramond12-Regular.otf}[
%	Path=fonts/EBGaramond/,
%	range=\mathbfup/{num,latin,Latin,greek,Greek},
%	Ligatures={TeX},
%	Numbers={Lining},
%	Script=Latin,
%	version=bold,
%	FakeBold=1.5,
%	SizeFeatures={
%		{Size=-8, Font={EBGaramond08-Regular.otf}, Numbers={Lining}},
%		{Size= 8-, Font=*}
%	}
%]

%\setmathfont{EBGaramond12-Italic.otf}[
%	Path=fonts/EBGaramond/,
%	range=\mathit/{latin,Latin,greek,Greek},
%	Ligatures={TeX},
%	Numbers={Lining},
%	Script=Latin,
%	SizeFeatures={
%		{Size=-8, Font={EBGaramond08-Italic.otf}, Numbers={Lining}},
%		{Size= 8-, Font=*}
%	}
%]

%\setmathfont{EBGaramond12-Italic.otf}[
%	Path=fonts/EBGaramond/,
%	range=\mathbfit/{latin,Latin,greek,Greek},
%	Ligatures={TeX},
%	Numbers={Lining},
%	Script=Latin,
%	version=bold,
%	FakeBold=1.5,
%	SizeFeatures={
%		{Size=-8, Font={EBGaramond08-Italic.otf}, Numbers={Lining}},
%		{Size= 8-, Font=*}
%	}
%]

% TODO patch \textbf and \bfseries commands to disable use of bold in body text
%\ClassInfo{FRIteza}{Patching textbf and bfseries to force textit and itshape}
%\let\@textbf\textbf
%\let\@bfseries\bfseries
%\renewcommand{\textbf}{\textit}
%\renewcommand{\bfseries}{\itshape}

% patch MakeUppercase to use lining numbers as uppercase numbers,
% see discussion at https://www.quora.com/Why-don’t-lowercase-and-uppercase-numbers-exist
\ClassInfo{FRIteza}{Patching MakeUppercase to force Uppercase numbers}
\let\@MakeUppercase\MakeUppercase
\renewcommand{\MakeUppercase}[1]{\begingroup\addfontfeature{Numbers=Uppercase}\@MakeUppercase{#1}\endgroup}

% macro for Historic dropcaps
\RequirePackage{lettrine}
\RequirePackage{xstring}
\newcommand{\EBLettrineBackColor}{P1797}
\newcommand{\EBLettrineFrontColor}{black}
\newcommand{\EBLettrineBackFont}{\fontspec{EBGaramond-InitialsF1}[Path=fonts/EBGaramond/, Extension=.otf]}
\newcommand{\EBLettrineFrontFont}{\fontspec{EBGaramond-InitialsF2}[Path=fonts/EBGaramond/, Extension=.otf]}
\newcommand{\EBlettrine}[1]{%
  \StrRemoveBraces{#1}[\str]
  \StrSplit{\str}{1}{\first}{\rest}
  \renewcommand{\LettrineFontHook}{\EBLettrineBackFont}%
  \lettrine[lines=4,loversize=0.13,lraise=-.08,findent=2pt,nindent=0pt]{%
    \rlap{\color{\EBLettrineBackColor} \first}%
    {\EBLettrineFrontFont\color{\EBLettrineFrontColor} \first}%
  }%
  \rest%
}

% load language related packages
\RequirePackage{translator}
\RequirePackage{polyglossia}
\if@slovene
  \setmainlanguage{slovenian}
  \setotherlanguage[variant=uk]{english}
  \RequirePackage[locale=DE,abbreviations]{siunitx} % load siunitx package for printing numers and units
\else
  \setmainlanguage[variant=uk]{english}
  \setotherlanguage{slovenian}
  \RequirePackage[locale=UK,abbreviations]{siunitx} % load siunitx package for printing numers and units
\fi
\sisetup{detect-all, math-rm=\symup, math-sf=\symsf, math-tt=\symtt} % make siunitx detect mode (math, text, sans, typewriter, bold, and force use of symrm instead of mathrm to get uppercase numerals in math mode)

% language specific special keyword translations
\addto\captionsenglish{%
  \def\keywordsname{Keywords}
  \def\definitionname{Definition}
  \def\acknowledgementsname{Acknowledgements}

  \def\bbland{\&}
  \def\bbletal{et~al.}
  \def\bbleds{eds.}
  \def\bbled{ed.}
  \def\bbledby{edited by}
  \def\bbledn{edition}
  \def\bblvol{vol.}
  \def\bblof{of}
  \def\bblno{no.}
  \def\bblin{in}
  \def\bblpp{pp.}
  \def\bblp{p.}
  \def\bblchap{ch.}
  \def\bbltechrep{Tech Rep}
  \def\bblmthesis{Master's thesis}
  \def\bblphdthesis{Doctoral dissertation}
  \def\bbllecture{Lecture}
  \def\bbleidpp{eid}
  \def\bblfirsto{\MakeUppercase{1}\textsuperscript{st}}
  \def\bblsecondo{\MakeUppercase{2}\textsuperscript{nd}}
  \def\bblthirdo{\MakeUppercase{3}\textsuperscript{rd}}
  \def\bblfourtho{\MakeUppercase{4}\textsuperscript{th}}
  \def\bblfiftho{\MakeUppercase{5}\textsuperscript{th}}
  \def\bblst{\textsuperscript{st}}
  \def\bblnd{\textsuperscript{nd}}
  \def\bblrd{\textsuperscript{rd}}
  \def\bblth{\textsuperscript{th}}

  \def\bbljan{Jan}
  \def\bblfeb{Feb}
  \def\bblmar{Mar}
  \def\bblapr{Apr}
  \def\bblmay{May}
  \def\bbljun{Jun}
  \def\bbljul{Jul}
  \def\bblaug{Aug}
  \def\bblsep{Sep}
  \def\bbloct{Oct}
  \def\bblnov{Nov}
  \def\bbldec{Dec}
}
\addto\captionsslovenian{%
  \def\keywordsname{Ključne besede}
  \def\definitionname{Definicija}
  \def\acknowledgementsname{Zahvala}

  % http://www.informatika.bf.uni-lj.si/akad_okrajsave.htm
  \def\bbland{\&}
  \def\bbletal{in sod.}
  \def\bbleds{ur.}
  \def\bbled{ur.}
  \def\bbledby{uredil(i)}
  \def\bbledn{izdaja}
  \def\bblvol{zv.}
  \def\bblof{od}
  \def\bblno{št.}
  \def\bblin{v}
  \def\bblpp{str.}
  \def\bblp{s.}
  \def\bblchap{ch.}
  \def\bbltechrep{Poročilo}
  \def\bblmthesis{Magistrsko delo}
  \def\bblphdthesis{Doktorska disertacija}
  \def\bbllecture{Predavanje}
  \def\bbleidpp{eid}
  \def\bblfirsto{\MakeUppercase{1}.}
  \def\bblsecondo{\MakeUppercase{2}.}
  \def\bblthirdo{\MakeUppercase{3}.}
  \def\bblfourtho{\MakeUppercase{4}.}
  \def\bblfiftho{\MakeUppercase{5}.}
  \def\bblst{.}
  \def\bblnd{.}
  \def\bblrd{.}
  \def\bblth{.}

  % http://www.lektorsko-drustvo.si/jezikovni-pogovori/pisanje-datumov-v-slovenscini
  \def\bbljan{jan.}
  \def\bblfeb{feb.}
  \def\bblmar{mar.}
  \def\bblapr{apr.}
  \def\bblmay{maj.}
  \def\bbljun{jun.}
  \def\bbljul{jul.}
  \def\bblaug{avg.}
  \def\bblsep{sep.}
  \def\bbloct{okt.}
  \def\bblnov{nov.}
  \def\bbldec{dec.}
}

% command for introducing hyphenation/syllabization patterns
\newcommand{\sethyphenation}[2]{%
  \AtBeginDocument{%
    \begin{#1}\hyphenation{#2}\end{#1}%
  }%
}

% enter LaTeX3 code
\ExplSyntaxOn

% declare macro for vulgar fractions that take advantage of OpenType features
% code copied from xltxtra v0.6, 2016/01/21
\newcommand*\vfrac[2]{
  \fontspec_if_fontspec_font:TF
  {
    \fontspec_if_opentype:TF
    {
      {\addfontfeature{VerticalPosition=Numerator}#1}
      \textfractionsolidus
      {\addfontfeature{VerticalPosition=Denominator}#2}
    }
    {
      {\addfontfeature{VerticalPosition=Superior}#1}
      \textfractionsolidus
      {\addfontfeature{VerticalPosition=Inferior}#2}
    }
  }
  {
    \ClassError {FRIteza}
    { \string\vfrac\space~can~only~be~used~with~fontspec~fonts }
    { Nothing~more~to~tell. }
  }
}

\AtBeginDocument{ % these patch needs to be called last, after preamble finishes, i.e. at begin document
  \ClassInfo{FRIteza}{Patching\space siunitx\space package\space for\space correct\space printing\space of\space minus\space sign}
  \@ifpackagelater{siunitx}{2018/05/18}{
    \ClassWarning{FRIteza}{Applying\space patch\space developed\space for\space siunitx\space 2018/05/17\space v2.7s,\space
    detected\space siunitx\space \csname ver@siunitx.sty \endcsname}
  }{}
  % patch for siunitx package so than the minus sign gets printed in math and text mode
  \tl_gset:Nn \c__siunitx_minus_tl { \ensuremath{ - } }

  \ClassInfo{FRIteza}{Patching\space realscript\space package\space for\space correct\space subscript\space font\space feature\space +sinf}{}
  \@ifpackagelater{realscript}{2016/02/14}{
    \ClassWarning{FRIteza}{Applying\space patch\space developed\space for\space realscript\space 2016/02/13\space v0.3d,\space
    detected\space realscript\space \csname ver@realscript.sty \endcsname}
  }{}
  % patch for realscript package so that proper subscripts get printed with EBGaramond
  % EBGaramond (+subs) are closer to (+dnom) than typical subscripts, see also https://glyphsapp.com/tutorials/superscript-and-subscript-figures
  \DeclareDocumentCommand \realsubscript {m} {
    \fontspec_if_fontspec_font:TF {
      \fontspec_if_opentype:TF
      { \fontspec_if_feature:nTF {+sinf}
        { {\addfontfeature{VerticalPosition=ScientificInferior}#1} }
        { \fontspec_if_feature:nTF {+subs}
          { {\addfontfeature{VerticalPosition=Inferior}#1} }
          { \fakesubscript{#1} }
        }
      }
      { \fontspec_if_aat_feature:nnTF {10} {2}
        { {\addfontfeature{VerticalPosition=Inferior}#1} }
        { \fakesubscript{#1} }
      }
    }
    { \fakesubscript{#1} }
  }
}
\ExplSyntaxOff
% end of LaTeX3 code

% TODO: patch to force superscripts and subscripts to be smaller (closer match to \textsubscript \textsuperscript)
%\def\defaultscriptratio{.56} ??? necessary
%\def\defaultscriptscriptratio{.4} ??? necessary
%\calculate@math@sizes ?? necessary
%\DeclareMathSizes{9bp}{9bp}{5bp}{4bp} [for text font size 9bp choose math 9bp with subscripts of size 5bp and subsubscripts of 4bp]
%\DeclareMathSizes{12bp}{12bp}{7bp}{6bp} %[for text font size 12pt choose math 12pt with subscripts of size 7pt and subsubscripts of 6pt; 1pt in tex = 1/72.27", 1bp = 1/72" ]
%\check@mathfonts

% TODO ?\setkeys{Gin}{width=\figurewidth} to force all figures to \figurewidth
% load graphics and color related packages and setup colors
\RequirePackage{graphicx}
\if@press
  \graphicspath{{./img_HQ/}{img/}} % search path for graphics files
\else
  \graphicspath{{./img_LQ/}{img/}} % search path for graphics files
\fi
\DeclareGraphicsExtensions{.pdf,.png,.jpg} % graphics file extensions listed in order of preference

\RequirePackage{xcolor} % TODO {colortbl} for color tables, {colorspace} for pantone http://ctan.ijs.si/tex-archive/macros/latex/contrib/colorspace/colorspace.pdf
\RequirePackage{tikz}
\RequirePackage[all]{background} % required for chaptermarks based on TikZ

\definecolor{grey65}{cmyk}{0,0,0,.65}
\definecolor{grey50}{cmyk}{0,0,0,.50}
\definecolor{grey40}{cmyk}{0,0,0,.40}
\definecolor{grey20}{cmyk}{0,0,0,.20}
\definecolor{grey05}{cmyk}{0,0,0,.05}
\definecolor{PCG3M}{cmyk}{.20,.15,.14,0}
\definecolor{PCG9M}{cmyk}{.48,.39,.37,.03}
\definecolor{P654M}{cmyk}{1,.87,.32,.19}
\definecolor{P1797}{cmyk}{0,.94,.94,.06}
\definecolor{gold}{cmyk}{.15,.20,.80,.05}

%P424
%P654M
%P1797U 0, 100, 99, 4
%P1797C 0, 100, 100, 0

%%%%
% setup page layout and page spread graphical elements
%%%%
\RequirePackage{calc} % length calculations
\RequirePackage{scrextend} % required for oddpage checks
\RequirePackage{ifthen} % required for whiledo loops
\RequirePackage{etoolbox} % required for package patches

\newlength{\pageW}\setlength{\pageW}{6.14in}
\newlength{\pageH}\setlength{\pageH}{9.21in}
\newlength{\gridW}\setlength{\gridW}{\pageW/9}
\newlength{\gridH}\setlength{\gridH}{\pageH/9}%\setlength{\pageH}{8\gridH}
\newlength{\marginI}\setlength{\marginI}{\gridW}
\newlength{\marginO}\setlength{\marginO}{2\gridW}
\newlength{\marginT}\setlength{\marginT}{\gridH}
\newlength{\marginB}\setlength{\marginB}{2\gridH}%\setlength{\marginB}{\gridH}

\newlength{\bindingW}\setlength{\bindingW}{0mm}
\newlength{\bleedH}\setlength{\bleedH}{0mm}
\newlength{\bleedW}\setlength{\bleedW}{0mm}
\newlength{\trimMark}\setlength{\trimMark}{0mm}

\if@dev % crop pages so that with fit to page one achieves a larger font size for pre-alpha, alpha, beta, gamma
  \setlength{\pageW}{\pageW-\gridW}
  \setlength{\pageH}{\pageH-2\gridH}
  \setlength{\marginI}{\marginI-.75\gridW}
  \setlength{\marginO}{\marginO-.25\gridW}
  \setlength{\marginT}{\marginT-\gridH/2}
  \setlength{\marginB}{\marginB-3\gridH/2}
\fi

\if@press
  \setlength{\bindingW}{16mm} % widden up each page by 7.5mm / 6mm due to binding
  \setlength{\bleedH}{5mm}
  \setlength{\bleedW}{5mm}
  \setlength{\trimMark}{5mm}
\fi

\newlength{\mW}\setlength{\mW}{\trimMark+\bleedW+\bindingW+\pageW+\bleedW+\trimMark} % media width
\newlength{\mH}\setlength{\mH}{\trimMark+\bleedH+\pageH+\bleedH+\trimMark} % media height

\setlength{\columnsep}{\gridW/4} % must be declared as floatrow by default sets capbesidesep=columnsep
\setlength{\columnseprule}{0mm}
\setlength{\marginparsep}{\gridW/4}
\setlength{\marginparwidth}{5\gridW/4}
\setlength{\headheight}{\baselineskip}
\newlength{\gs@dpth}\settodepth{\gs@dpth}{\normalfont\normalsize q} % get font depth (normalsize)
\newlength{\gs@bls}\normalfont\normalsize\setlength{\gs@bls}{\baselineskip} % get baselineskip (normalsize)
\setlength{\headsep}{\gridH/4-\baselineskip}
\setlength{\footskip}{\headsep+\headheight}

\pgfmathsetlengthmacro{\bO}{\bindingW+\bleedW+\trimMark}
\pgfmathsetlengthmacro{\mI}{\marginI}
\pgfmathsetlengthmacro{\mO}{\marginO+\trimMark+\bleedW}
\pgfmathsetlengthmacro{\mT}{\marginT+\trimMark+\bleedH}
\pgfmathsetlengthmacro{\mB}{\marginB+\trimMark+\bleedH}

% NOTE: intersting layout with mB=gH, mO=3gW+gW/8, mpw=2gW-gW/8 and raggedright typesetting
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
\RequirePackage{atbegshi} % loaded also by hyperref
\AtBeginShipout{%
  \setbox\AtBeginShipoutBox=\hbox{%
    \@XeTeXTrimBoxes
    \box\AtBeginShipoutBox
  }%
}

% TODO: use totcount package and \regtotcounter{chapter}\total{chapter}
% TODO: to definethe VOffset @deltay to step chapterMarks so that they are distributed over the whole textheight (if more than the amount that fits in)
% current max is 12 chapters ... 6.14in/13mm=11.99
\newcommand{\@ULsquare}{13mm}
\newlength{\VOffset}\setlength{\VOffset}{-\@ULsquare}

\newcommand{\@drawGridSystem}{
  % grid system
  \ifthispageodd{%
    \foreach \n in {1,...,8} {
      \draw[dashed, color=lightgray]
      (\trimMark+\bleedW+\bindingW+\n\gridW,-\bleedH-\trimMark)
      --
      (\trimMark+\bleedW+\bindingW+\n\gridW,-\mH+\bleedH+\trimMark);
      \draw[dashed, color=lightgray]
      (\trimMark+\bleedW+\bindingW,-\n\gridH-\bleedH-\trimMark)
      --
      (\mW-\bleedW-\trimMark,-\n\gridH-\bleedH-\trimMark);
    }
    \draw[dashed, color=black]
    (\trimMark+\bleedW+\bindingW,-\bleedH-\trimMark)
    --
    (\trimMark+\bleedW+\bindingW,-\mH+\bleedH+\trimMark);
  }{%
    \foreach \n in {1,...,8} {
      \draw[dashed, color=lightgray]
      (\mW-\trimMark-\bleedW-\bindingW-\n\gridW,-\trimMark-\bleedH)
      --
      (\mW-\trimMark-\bleedW-\bindingW-\n\gridW,-\mH+\trimMark+\bleedH);
      \draw[dashed, color=lightgray]
      (\mW-\trimMark-\bleedW-\bindingW,-\n\gridH-\bleedH-\trimMark)
      --
      (\trimMark+\bleedW,-\n\gridH-\bleedH-\trimMark);
    }
    \draw[dashed, color=black]
    (\mW-\trimMark-\bleedW-\bindingW,-\trimMark-\bleedH)
    --
    (\mW-\trimMark-\bleedW-\bindingW,-\mH+\bleedH+\trimMark);
  }
}

\newcommand{\@drawTextAreas}{
  \ifthispageodd{%
    \draw[color=orange] % body text area
    (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT)
    rectangle
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth,-\trimMark-\bleedH-\marginT-\textheight);
    \draw[color=orange] % marginpar text area
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth+\marginparsep,-\trimMark-\bleedH-\marginT)
    rectangle
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth+\marginparsep+\marginparwidth,-\trimMark-\bleedH-\marginT-\textheight);
    \draw[color=orange] % header text area
    (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT+\headsep+\headheight)
    rectangle
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth+\marginparsep+\marginparwidth,-\trimMark-\bleedH-\marginT+\headsep);
    \draw[color=orange] % footer
    (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT-\textheight-\footskip-\gs@dpth+\gs@bls)
    rectangle
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth,-\trimMark-\bleedH-\marginT-\textheight-\footskip-\gs@dpth);
  }{%
    \draw[color=orange] % body text area
    (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\trimMark-\bleedH-\marginT)
    rectangle
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth,-\trimMark-\bleedH-\marginT-\textheight);
    \draw[color=orange] % marginpar text area
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth-\marginparsep,-\trimMark-\bleedH-\marginT)
    rectangle
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth-\marginparsep-\marginparwidth,-\trimMark-\bleedH-\marginT-\textheight);
    \draw[color=orange] % header text area
    (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\trimMark-\bleedH-\marginT+\headsep+\headheight)
    rectangle
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth-\marginparsep-\marginparwidth,-\trimMark-\bleedH-\marginT+\headsep);
    \draw[color=orange] % footer text area
    (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\trimMark-\bleedH-\marginT-\textheight-\footskip-\gs@dpth+\gs@bls)
    rectangle
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth,-\trimMark-\bleedH-\marginT-\textheight-\footskip-\gs@dpth);
  }%
}

\newcommand{\@drawTextAreaBaselines}{
  \pgfmathsetmacro{\nRows}{round(6*\gridH/\gs@bls)}
  \ifthispageodd{%
    \foreach \n in {1,...,\nRows} { % body text
      \draw[dashed, color=cyan]
      (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT-\n\gs@bls+\gs@dpth)
      --
      (\trimMark+\bleedW+\bindingW+\marginI+\textwidth,-\trimMark-\bleedH-\marginT-\n\gs@bls+\gs@dpth);
    }
    \draw[dashed, color=cyan] % header
    (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT+\headsep+\gs@dpth+1pt)
    --
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth+\marginparsep+\marginparwidth,-\trimMark-\bleedH-\marginT+\headsep+\gs@dpth+1pt);
    \draw[color=cyan] % header
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth+\marginparsep,-\trimMark-\bleedH-\marginT+\headsep)
    --
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth+\marginparsep,-\trimMark-\bleedH-\marginT+\headsep+\headheight);
    \draw[dashed, color=cyan] % footer
    (\trimMark+\bleedW+\bindingW+\marginI,-\trimMark-\bleedH-\marginT-\textheight-\footskip)
    --
    (\trimMark+\bleedW+\bindingW+\marginI+\textwidth,-\trimMark-\bleedH-\marginT-\textheight-\footskip);
  }{%\else
    \foreach \n in {1,...,\nRows} {
      \draw[dashed, color=cyan]
      (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\marginT-\bleedH-\trimMark-\n\gs@bls+\gs@dpth)
      --
      (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth,-\marginT-\bleedH-\trimMark-\n\gs@bls+\gs@dpth);
    }
    \draw[dashed, color=cyan] % header
    (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\trimMark-\bleedH-\marginT+\headsep+\gs@dpth+1pt)
    --
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth-\marginparsep-\marginparwidth,-\trimMark-\bleedH-\marginT+\headsep+\gs@dpth+1pt);
    \draw[color=cyan] % header
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth-\marginparsep,-\trimMark-\bleedH-\marginT+\headsep)
    --
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth-\marginparsep,-\trimMark-\bleedH-\marginT+\headsep+\headheight);
    \draw[dashed, color=cyan] % footer
    (\mW-\trimMark-\bleedW-\bindingW-\marginI,-\trimMark-\bleedH-\marginT-\textheight-\footskip)
    --
    (\mW-\trimMark-\bleedW-\bindingW-\marginI-\textwidth,-\trimMark-\bleedH-\marginT-\textheight-\footskip);
  }%
}

\newcommand{\@drawTrimMarks}{
  % trimmarks
  \draw[color=black, line width=0.25pt]
  (\trimMark+\bleedW,0)
  --
  (\trimMark+\bleedW,-\trimMark);
  \draw[color=black, line width=0.25pt]
  (\trimMark+\bleedW,-\mH)
  --
  (\trimMark+\bleedW,-\mH+\trimMark);
  \draw[color=black, line width=0.25pt]
  (\mW-\trimMark-\bleedW,0)
  --
  (\mW-\trimMark-\bleedW,-\trimMark);
  \draw[color=black, line width=0.25pt]
  (\mW-\trimMark-\bleedW,-\mH)
  --
  (\mW-\trimMark-\bleedW,-\mH+\trimMark);
  \draw[color=black, line width=0.25pt]
  (0,-\trimMark-\bleedH)
  --
  (\trimMark,-\trimMark-\bleedH);
  \draw[color=black, line width=0.25pt]
  (\mW-\trimMark,-\trimMark-\bleedH)
  --
  (\mW,-\trimMark-\bleedH);
  \draw[color=black, line width=0.25pt]
  (0,-\mH+\trimMark+\bleedH)
  --
  (\trimMark,-\mH+\trimMark+\bleedH);
  \draw[color=black, line width=0.25pt]
  (\mW-\trimMark,-\mH+\trimMark+\bleedH)
  --
  (\mW,-\mH+\trimMark+\bleedH);
}

\newcommand{\@drawPartMark}[1]{
  \ifthispageodd{%
    \path[fill=#1]
    (\mW-\trimMark-\bleedW-\gridW/4,0)
    rectangle
    (\mW-\trimMark,-\mH);
  }{%
    \path[fill=#1]
    (\trimMark,0)
    rectangle
    (\trimMark+\bleedW+\gridW/4,-\mH);
  }%
}

% TODO: change VOffset to multiples of thechapter counter
\newcommand{\@chapterThumbColourA}{white}
\newcommand{\@chapterThumbColourB}{P1797}
\newcommand{\@drawChapterThumb}[2]{
  \ifthispageodd{%
    \if@isChapterPage
      \path[fill=#1]
      (\mW-\trimMark-\bleedW-\@ULsquare,-\trimMark-\bleedH-\marginT-\VOffset)
      rectangle
      (\mW-\trimMark,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
      \node[#2] at
      (\mW-\trimMark-\bleedW-\@ULsquare/2,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare/2)
      {\fontsize{26}{30}\itshape\selectfont\thechapter\normalfont};
    \else
      \path[fill=#2]
      (\mW-\trimMark-\bleedW-\gridW/4,-\trimMark-\bleedH-\marginT-\VOffset)
      rectangle
      (\mW-\trimMark,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
    \fi
  }{%
    \if@isChapterPage
      \path[fill=#1]
      (\trimMark, -\trimMark-\bleedH-\marginT-\VOffset)
      rectangle
      (\trimMark+\bleedW+\@ULsquare,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
      \node[#2] at
      (\trimMark+\bleedW+\@ULsquare/2,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare/2)
      {\fontsize{26}{30}\itshape\selectfont\thechapter\normalfont};
    \else
      \path[fill=#2]
      (\trimMark,-\trimMark-\bleedH-\marginT-\VOffset)
      rectangle
      (\trimMark+\bleedW+\gridW/4,-\trimMark-\bleedH-\marginT-\VOffset-\@ULsquare);
    \fi
  }%
}
\newcommand{\@stepChapterThumb}{
  \addtolength{\VOffset}{\@ULsquare}
  \global\VOffset=\VOffset % force global update of VOffset, see https://tex.stackexchange.com/questions/119730/global-scope-or-permanent-length-or-savebox
  \if@dev
    \global\@showChapterThumbfalse
  \else
    \global\@showChapterThumbtrue
  \fi
}
\newcommand{\@hideChapterThumb}{
  \global\@showChapterThumbfalse
}

\newif \if@showGridSystem \@showGridSystemfalse
\newif \if@showTextAreas \@showTextAreasfalse
\newif \if@showTextAreaBaselines \@showTextAreaBaselinesfalse
\newif \if@showChapterThumb \@showChapterThumbfalse
\newif \if@isChapterPage \@isChapterPagefalse
\newif \if@isPartPage \@isPartPagefalse

\newcommand{\@drawBkgnd}{
  % display trimMarks, chapterMarks and the grid system
  \begin{tikzpicture}[remember picture,overlay]
    \if@showGridSystem \@drawGridSystem \fi
    \if@showTextAreas \@drawTextAreas \fi
    \if@showTextAreaBaselines \@drawTextAreaBaselines \fi
    \if@press \@drawTrimMarks \fi
    \if@isPartPage \@drawPartMark{grey65} \fi
    \if@showChapterThumb \@drawChapterThumb{\@chapterThumbColourA}{\@chapterThumbColourB} \fi
    \if@dev
      \ifthispageodd{%
        \node[black, rotate=90, anchor=east] at
        (\mW-\trimMark-\bleedW-\@ULsquare/8,-\trimMark-\bleedH-\marginT-\@ULsquare/2)
        {\fontsize{5bp}{6bp}\textsf{\textenglish{\today}~|~built with \expandafter\csname ver@FRIteza.cls\endcsname}};
      }{}%
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

%%%%
% cover and title page design, and frontmatter chapters
%%%%
% title, approvedby and previous publication page design
\def\metabox#1{\edef\theprevdepth{\the\prevdepth}\nointerlineskip
  \vbox to0pt{#1\vss}\prevdepth=\theprevdepth}
\newcommand{\@drawtitlepage}{%
  \begin{centering}
    \if@slovene
      \hbox{}\vfill
      { \LARGE\scshape\color{P1797}\addfontfeature{Ligatures=Historic}{%
        \@title@sl
        }\par
      }

      \vfill
      { \Large\scshape\addfontfeature{Ligatures=Historic}{%
        \@author
        }\par
      }

      \vfill
      { \normalsize\scshape\addfontfeature{Ligatures=Historic}{%
        doktorska disertacija\\
        predana\\
        Fakulteti za računalništvo in informatiko\\
        kot del izpolnjevanja pogojev za pridobitev naziva\\
        doktor znanosti\\
        s področja\\
        računalništva in informatike
        }\par
      }
      \vfill
    \else
      \hbox{}\vfill
      { \LARGE\scshape\color{P1797}\addfontfeature{Ligatures=Historic}{%
        \@title@en
        }\par
      }

      \vfill
      { \normalsize\scshape\addfontfeature{Ligatures=Historic}{%
        A dissertation presented\\
        by%
        }\par
      }

      \vfill
      { \Large\scshape\addfontfeature{Ligatures=Historic}{%
        \@author
        }\par
      }

      \vfill
      { \normalsize\scshape\addfontfeature{Ligatures=Historic}{%
        to\\
        The Faculty of Computer and Information Science\\
        in partial fulfilment of the requirements for the degree of\\
        Doctor of Science\\
        in\\
        Computer and Information Science%
        }\par
      }
      \vfill
    \fi

    \vfill\vfill
    \hspace*{1.2mm}\includegraphics{cc/ul-fri-micro}

    {\@place,~\number\@year}\par
  \end{centering}
}

% generate book cover
\newcommand{\@paperCaliper}{.120mm}

\newcommand*{\@showCoverAnnotations}{NO}
\newcommand{\showCoverAnnotations}[1]
{
  \renewcommand{\@showCoverAnnotations}{#1}
}

% generate cover page when in press mode
\newcommand{\makecoverpage}{%
  \if@press
    \begingroup
    \disablehyphenation
    \thispagestyle{empty}
    % save current geometry: media size, margins, bleed and slug area
    \savegeometry{G}

    \newlength{\@lmW}\setlength{\@lmW}{\mW}
    \newlength{\@lmH}\setlength{\@lmH}{\mH}
    \newlength{\@lbW}\setlength{\@lbW}{\bleedW}
    \newlength{\@lbH}\setlength{\@lbH}{\bleedH}

    % compute cover spine width, page, coverspine, front/back and media size
    \pgfmathsetlengthmacro{\spineW}{(round(\@spine@pages/2)*\@paperCaliper+0*.5mm+6mm)}
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
    \ifthenelse{\equal{\@cover@image}{\@empty}}{}{
      \node at
      ([shift={(-\CIc,0)}]current page.east)
      {\includegraphics[height=\ciH,width=\ciW]{\@cover@image}};
      % --- include single figure centered
      %  \node at
      %      ([shift={(-\ULc,0)}]current page.east)
      %      {\includegraphics[height=\ciH]{\@coverImage}};
    }
    \ifthenelse{\equal{\@cover@title@loc}{SE}}{
      \node[\@cover@title@colour, anchor=south east] at
      ([shift={(\TE,\TS)}]current page.south east)
      { \begin{minipage}{6\gridW}
        \begin{flushright}
          \fontsize{18}{19}\selectfont
          \@author\\
          \vspace{30bp}
          \fontsize{24}{24.5}\selectfont
          \emph{\@cover@title}
        \end{flushright}
        \end{minipage}
      };
    }{}
    \ifthenelse{\equal{\@cover@title@loc}{SW}}{
      \node[\@cover@title@colour, anchor=south west] at
      ([shift={(\TW,\TS)}]current page.south)
      { \begin{minipage}{6\gridW}
        \begin{flushleft}
          \fontsize{18}{19}\selectfont
          \@author\\
          \vspace{30bp}
          \fontsize{24}{24.5}\selectfont
          \emph{\@cover@title}
        \end{flushleft}
        \end{minipage}
      };
    }{}
    \ifthenelse{\equal{\@cover@title@loc}{NE}}{
      \node[\@cover@title@colour, anchor=north east] at
      ([shift={(\TE,\TN)}]current page.north east)
      { \begin{minipage}{6\gridW}
        \begin{flushright}
          \fontsize{24}{24.5}\selectfont
          \emph{\@cover@title}\\
          \vspace{30bp}
          \fontsize{18}{19}\selectfont
          \@author
        \end{flushright}
        \end{minipage}
      };
    }{}
    \ifthenelse{\equal{\@cover@title@loc}{NW}}{
      \node[\@cover@title@colour, anchor=north west] at
      ([shift={(\TW,\TN)}]current page.north)
      { \begin{minipage}{6\gridW}
        \begin{flushleft}
          \fontsize{24}{24.5}\selectfont
          \emph{\@cover@title}\\
          \vspace{30bp}
          \fontsize{18}{19}\selectfont
          \@author
        \end{flushleft}
        \end{minipage}
      };
    }{}

    % back
    \path[fill=P1797]
    ([shift={(-\csW,-\trimMark)}]current page.north)
    rectangle
    ([shift={(\trimMark,\trimMark)}]current page.south west);
    \node at
    ([shift={(\ULc,0)}]current page.west)
    {\includegraphics{cc/ul-max-slo}};

    % spine
    \path[fill=grey65]
    ([shift={(-\csW,-\trimMark)}]current page.north)
    rectangle
    ([shift={(\csW,\trimMark)}]current page.south);
    \path[fill=P1797]
    ([shift={(-\sW,\trimMark+\bleedH+\@ULsquare)}]current page.south)
    rectangle
    ([shift={(\sW,\trimMark)}]current page.south);
    \node[white] at
    ([shift={(0,\trimMark+\bleedH+\@ULsquare/2)}]current page.south)
    {\texttt{\fontsize{10}{11}\selectfont{\addfontfeatures{RawFeature=-onum}\textbf{\@spine@id}}}};
    \node[white] at
    ([shift={(0,\trimMark+\bleedH+1.5*\@ULsquare)}]current page.south)
    {\begin{minipage}{\textwidth}\fontsize{10.5bp}{11bp}\selectfont\centering\texttt{\textbf{FRI}\\BDR}\end{minipage}};
    \node[white] at
    ([shift={(0,\trimMark+\bleedH+2.5*\@ULsquare)}]current page.south)
    {\color{grey20}\fontsize{8bp}{9bp}\selectfont\texttt{\addfontfeatures{RawFeature=-onum}\textbf{\number\@year}}};
    \node[white, anchor=west, rotate=270] at
    ([shift={(0,-\trimMark-\bleedH-1.5*\@ULsquare)}]current page.north)
    {\fontsize{14}{15}\selectfont{\@spine@title}};

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
    {\fontsize{8}{8}\selectfont{\textsf{\@spine@pages\,p}}};

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
    \enablehyphenation
    \thispagestyle{empty}
    \hbox{}\vfill
    \begin{center}
      --- \emph{this page is not to be printed} --- \\
      {\fontsize{8}{8}\textsf{\textbf{\jobname}~|~\textsf{\@spine@pages\,p}~|~\textenglish{\today}~|~built with \expandafter\csname ver@FRIteza.cls\endcsname}}
    \end{center}
    \vfill
    \newpage
    \endgroup
  \fi
}

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

      \@drawtitlepage
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

      --- \@author{} ---\par
      \if@slovene
        \ifcase\@month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
      \else
        \ifcase\@month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
      \fi
      ~\number\@year
      \vspace*{\baselineskip}

      \if@slovene
        \textsc{Oddajo so odobrili}\par
      \else
        \textsc{The submission has been approved by}\par
      \fi
      \vspace*{.5\baselineskip}

      \newcounter{aid}
      \setcounter{aid}{0}
      \ifthenelse{\value{approvedById} > 4}
        { \ifthenelse{\isodd{\value{approvedById}}}
            { \noindent\begin{minipage}[t]{\columnwidth}%
                \centering\@approvedBy@A
                \vspace{\baselineskip}
              \end{minipage}
              \setcounter{aid}{1}
            }
            { \setcounter{aid}{0} }
          \setlength\multicolsep{0pt}
          \raggedcolumns
          \setcounter{unbalance}{0}
          \begin{multicols}{2}
            \newcounter{aids}
            \newcounter{aidO}
            \newlength{\@ht}
            \newlength{\@htO}
            \whiledo {\value{aid} < \value{approvedById}}
            { \stepcounter{aid}
              \ifthenelse{\value{aid} > \value{approvedById}/2 + (\value{approvedById} - \value{approvedById}/2) }
                { \setcounter{aidO}{\value{aid}-\value{approvedById}/2} }
                { \setcounter{aidO}{\value{aid}+\value{approvedById}/2} }
              \settototalheight{\@ht}{%
                \noindent\begin{minipage}[t]{\columnwidth}%
                  \centering\csname @approvedBy@\Alph{aid}\endcsname
                  \vspace{\baselineskip}
                \end{minipage}          
              }
              \settototalheight{\@htO}{%
                \noindent\begin{minipage}[t]{\columnwidth}%
                  \centering\csname @approvedBy@\Alph{aidO}\endcsname
                  \vspace{\baselineskip}
                \end{minipage}          
              }
              \ifthenelse{\lengthtest{\@htO > \@ht}}
                { \setlength{\@ht}{\@htO} }
                {}        
              \noindent\begin{minipage}[t][\@ht]{\columnwidth}%
                \centering\csname @approvedBy@\Alph{aid}\endcsname
                \vspace{\baselineskip}
              \end{minipage}
            }%
          \end{multicols}
        }
        { \par\setcounter{aid}{0}
          \whiledo {\value{aid} < \value{approvedById}}
          { \stepcounter{aid}
            \noindent\begin{minipage}[t]{\columnwidth}%
              \centering\csname @approvedBy@\Alph{aid}\endcsname
              \vspace{\baselineskip}
            \end{minipage}\par
          }
        }
    \end{centering}
  \endgroup
}

\newcommand{\makepreviouspublication}[1]{
  \ifnumgreater {\value{previousPublicationId}}{0}{
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
      {%
        \renewcommand{\bibsection}{}
        \renewcommand{\bibpreamble}{
          \begingroup
            \footnotesize\RaggedRight
        }
        \renewcommand{\bibpostamble}{
            \normalsize
          \endgroup
        }

        \newcounter{pid}
        \setcounter{pid}{0}
        \whiledo {\value{pid} < \value{previousPublicationId}}
        {
          \stepcounter{pid}
          \expandafter\nociteself\expandafter{\csname @previousPublication@\Alph{pid}\endcsname}
        }
        \bibliographystyleself{FRIteza}
        %\filename@parse{#1}
        %\typeout{\filename@area, \filename@base, \filename@ext}
        \bibliographyself{#1}
      }

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

%%%%
% headings
%%%%
% define chapter\section\figure\page counters and parameters
\hfuzz=1.6pt % ignore overfulls up to 1.6pt
\setlength\overfullrule{\marginparwidth} % TODO: draft mode -> overfullrule{30pt} % show markers for overfull boxes
%\showthe\lineskiplimit
\setlength\lineskip{0pt} % spacing between two consecutive lines of text (bottom of last to top of next) -- see https://github.com/Khan/KaTeX/issues/531 If the distance between adjacent rows is less than \lineskiplimit, then instead of using \baselineskip as the distance between baselines, TeX will use \lineskip as the distance between the line boxes.
%\showthe\normallineskiplimit
\setlength\normallineskip{0pt}
%\renewcommand\baselinestretch{} % https://en.wikibooks.org/wiki/LaTeX/Lengths
\setlength\parskip{0pt plus 1pt} % paragraph skip 0 + 1pt (if needed)
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
% control floats
\setcounter{topnumber}{2}
\renewcommand\topfraction{.8} %.7
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.2} %.3
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.8} %.5
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

%\setlength{\@fptop}{0pt} force floats on float page to appear at top https://tex.stackexchange.com/questions/66252/placing-the-figure-exactly-at-the-top-of-the-page-in-latex

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

\newcommand{\@chapapp}{\chaptername}

% TODO: check if everything works as it should with parts
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

% chapter title formatting
\newcommand{\chapter}{
  \cleardoublepage
  \thispagestyle{chapter}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
% TODO add toc keyword to chapter macro?
\def\@chapter[#1]#2{%
  \thispagestyle{empty}
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{=== \@chapapp\space\thechapter.}%
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}
  \@makechapterhead{#2}%
  \@afterheading
}

% TODO: correct issues with improper alignment of fist line and other lines in multiline items e.g. pg 24 in TOC of demo-bypub, see also \section and \@chapter
%{\protect\numberline{\thechapter}\texorpdfstring{\protect\parbox[t]{0.9\linewidth}{#2}}{#2}}%
%\else
%\addcontentsline{toc}{chapter}{\texorpdfstring{\protect\parbox[t]{0.9\linewidth}{#2}}{#2}}%
%\fi
%\addtocontents{toc}{\protect\addvspace{0.5\baselineskip}}% Some spacing   afterwards

\def\@makechapterhead#1{%
  \global\@isChapterPagetrue
  \if@dev
  \else
    \pagecolor{P1797}
  \fi
  \@stepChapterThumb
  \null
  \vfil
  {
    \begin{flushright}
      \fontsize{26}{30}\itshape\selectfont
      \if@dev
        \color{P1797}\thechapter\quad
      \else
        \color{white}
      \fi
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

\newlength{\preskipS}\setlength{\preskipS}{2\baselineskip - 2ex}
\newlength{\preskipSS}\setlength{\preskipSS}{\baselineskip - 1ex}
% section formatting, see also appendix and subappendix environments
\newcommand{\section}{%
  \@startsection {section}{1}{\z@}%
  {-\preskipS}%
  {2ex}%
  %{-2.5ex \@plus -1ex \@minus -.2ex}%
  %{2.3ex \@plus.2ex}
  {\color{P1797}\large\itshape}%
}
% subsection formatting, see also appendix and subappendix environments
\newcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {-\preskipSS}%
  {1ex}%
  %{-2.25ex\@plus -1ex \@minus -.2ex}%
  %{1.5ex \@plus .2ex}%
  {\color{P1797}\itshape}%
}
% subsubsection formatting, see also appendix and subappendix environments
\newcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{\z@}%
  {\baselineskip}%
  {-1em}%
  %{-2.25ex\@plus -1ex \@minus -.2ex}%
  %{1.5ex \@plus .2ex}%
  {\color{P1797}\normalsize\itshape}%
}
% paragraph formatting, see also appendix and subappendix environments
\newcommand\paragraph{% TODO: decide based on use
  \@startsection{paragraph}{4}{\z@}%
  {\baselineskip}%
  %{2.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\color{P1797}\normalsize\scshape}%
}
% subparagraph formatting, see also appendix and subappendix environments
\newcommand\subparagraph{%
  \@startsection{subparagraph}{5}{\parindent}%
  {\baselineskip}%
  %{2.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\color{P1797}\normalsize\normalfont}%
}

% TODO: paragraph for long titles, see TODO in definition of \@chapter
% patch for appendices and subappendices to work as desired
% (i.e. not printing numbers for section, subsection and subsubsection
% and forcing small caps of subappendix sections in TOC)
% code copied from http://www.tug.org/texlive/Contents/live/texmf-dist/doc/latex/base/source2e.pdf pg. 364
\newif\if@addsectionstotoc \@addsectionstotoctrue
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let \@svsec \@empty
  \else
    \refstepcounter {#1}%
    \if@insubappendices
      \ifnum #2=1
        \let \@svsec \@empty
      \else
        \protected@edef \@svsec {\@seccntformat {#1}\relax}
      \fi
    \else
      \protected@edef \@svsec {\@seccntformat {#1}\relax}
    \fi
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa >\z@
    \begingroup
      #6{%
        \@hangfrom {\hskip #3\relax \@svsec}%
        \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname {#7}%
    \if@addsectionstotoc
      \addcontentsline {toc}{#1}{%
        \if@insubappendices
          \ifnum #2=1
            \scshape
          \else
            \ifnum #2>\c@secnumdepth
            \else
              \protect \numberline {\csname the#1\endcsname }
            \fi
          \fi
        \else
          \ifnum #2>\c@secnumdepth
          \else
            \protect \numberline {\csname the#1\endcsname }
          \fi
        \fi #7}
    \fi
  \else
    \def \@svsechd {#6{\hskip #3\relax \@svsec #8}%
    \csname #1mark\endcsname {#7}
    \if@addsectionstotoc
      \addcontentsline {toc}{#1}{%
        \if@insubappendices
          \ifnum #2=1
            \scshape
          \else
            \ifnum #2>\c@secnumdepth
            \else
              \protect \numberline {\csname the#1\endcsname }
            \fi
          \fi
        \else
          \ifnum #2>\c@secnumdepth
          \else
            \protect \numberline {\csname the#1\endcsname }
          \fi
        \fi #7}%
    \fi
    }
  \fi
  \@xsect {#5}%
}

\RequirePackage{fancyhdr}
\pagestyle{fancy}  % setup all hooks and declare \chaptermark, \sectionmark; must be called after the definition of \chapter, \section, etc.

\fancypagestyle{chapter}{%
  \fancyhf{} % clear footer and header fields
  \fancyhfoffset[LE]{0pt}
  \fancyhfoffset[RO]{0pt}
  \fancyheadoffset[LE,RO]{\marginparwidth+\marginparsep}
  \fancyfootoffset[LE,RO]{0pt}
  \fancyfoot[C]{\normalfont\footnotesize\if@isChapterPage\color{white}\fi\thepage}%
}

% TODO: should probably change color as well (printing issues)
\fancypagestyle{FRIteza}{%
  \fancyhf{} % clear footer and header fields
  % Note the ## here. It's required because \fancypagestyle is making a macro (\ps@FRIteza).
  % If we just wrote #1, TeX would think that it's the argument to \ps@FRIteza, but
  % \ps@FRIteza doesn't take any arguments, so TeX would complain with an error message.
  % You are not expected to understand this.
  \renewcommand*{\sectionmark}[1]{ % ignore section marks
  }
  \renewcommand*{\chaptermark}[1]{
    \markboth{\iflanguage{slovenian}{\@title@slA}{\@title@enA}}{##1}
  }
  % Increase the length of the header such that the folios
  % (typography jargon for page numbers) move into the margin
  \fancyheadoffset[LE,RO]{\marginparwidth+\marginparsep}
  \fancyfootoffset[LE,RO]{0pt}
  % Put some space and a vertical par between the folio and the rest of the header
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  % compute length of skip: offset - width of \itshape{\thepage}
  % use \iffloatpage{}{} for different pagestyle on floatpages
  \fancyhead[LE]{\begin{minipage}[t]{\marginparwidth}\hfill\itshape\thepage\end{minipage}%
    \hspace*{\marginparsep}\small\color{grey65}\@author@A}%
  \fancyhead[RE]{\color{grey65}\small\leftmark}
  \fancyhead[LO]{\color{grey65}\small\rightmark}
  \fancyhead[RO]{\begin{minipage}[t]{\marginparwidth}\itshape\thepage\hfill\end{minipage}}%
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

% captions
% setup dummy caption formatting based on article.sty to suppress unsupported package error issued by the caption package,
% see https://tex.stackexchange.com/questions/341680/package-caption-warning-unsupported-document-class
\newlength\abovecaptionskip\setlength\abovecaptionskip{\f@size\p@}
\newlength\belowcaptionskip\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip%
}


\RequirePackage{floatrow} % TODO: integrate example with subfigures
\DeclareColorBox{framedfigure}{\fcolorbox{grey20}{white}}
\DeclareFloatSeparators{marginparsep}{\hskip\marginparsep}

\DeclareNewFloatType{figure}{fileext=lof,within=chapter} % use fileext=toc to insert into table of contents
\floatsetup[figure]{%
  margins=hangoutside,
  capposition=beside,
  capbesidesep=marginparsep,
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
% save the max width of a figure that takes into account the encompasing frame
% (\linewidth=\textwidth-7pt for figure)
% (\linewidth=\textwidth+\marginparsep+\marginparwidth-7pt for figure*)
\newcommand{\figurewidth}{\linewidth}
\newcommand{\infigurecaption}[1]{%
  \vskip3.5pt
  \begin{minipage}{\linewidth}
    \scriptsize
    \sffamily
    #1%\par
  \end{minipage}%
}

\DeclareNewFloatType{table}{fileext=lot,within=chapter} % use fileext=toc to insert into table of contents
\floatsetup[table]{%
  capposition=top
}
\RequirePackage{booktabs} % load to enhance quality of tables
\setlength\tabcolsep{6\p@} % setup tabular, tabbing and array environment parameters
\setlength\arraycolsep{5\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}

\DeclareNewFloatType{video}{fileext=lov,name=Video,within=chapter} % use fileext=toc to insert into table of contents
\renewcommand{\videoname}{Video}
\floatsetup[video]{%
  margins=hangoutside,
  capposition=beside,
  capbesidesep=marginparsep,
  capbesideposition={outside,bottom},
  facing=yes,
  floatwidth=\textwidth,
  objectset=centering,
  framefit=yes,
  colorframeset=framedfigure,
  framestyle=colorbox,
  frameset={\fboxrule1pt\fboxsep2.5pt}%
}

\DeclareMarginSet{widehang}{\setfloatmargins*
  {\hskip\leftskip}{\hskip-\gridW\hskip\rightskip}%
}
% declare starred version of floats
\captionsetup[widefloat]{%
  %margin={0pt,\marginparwidth+\marginparsep}, % keep caption in text area for hangoutside
  %margin={0pt,\gridW}, % keep caption in text area for widehang
  labelfont=up,
  textfont={RaggedRight,scriptsize,it}
}
\floatsetup[widefloat]{%
  facing=yes,
  margins=widehang,
  capposition=bottom
}
\floatsetup[widetable]{%
  capposition=top
}

% declare large figure extend text area
% TODO: largetable check package longtable
\newenvironment{largefigure}[1][\gridH/2]{
  \clearpage % finish last page flush previous floats
  \newgeometry{bindingoffset=\bO, left=\mI, top=\mT, right=\mO, bottom=\mB-#1}
  \setlength{\@fptop}{0pt} % force float to top of page
  \begin{figure}[p]
}{
  \end{figure}
  \clearpage
  \restoregeometry
  % these lines reset next page \@floatplacement to normal, i.e. keep floats on next page in appropriate position
  \global\@colht\textheight % reset \@colht
  \global\@colroom\textheight % reset \@colroom
  \@floatplacement
  \setlength{\@fptop}{0pt plus 1fill}
}


% caption positioning
\RequirePackage[style=base]{caption}
\DeclareCaptionLabelSeparator{br}{\par\vspace*{2\p@}}
\captionsetup{singlelinecheck=off,labelsep=br,labelfont=it,textfont={RaggedRight,scriptsize}}
% subcaptions
\RequirePackage{subcaption}
\captionsetup[sub]{subrefformat=parens}
\captionsetup[sub]{format=plain,labelformat=parens,labelsep=space,font={normalfont,scriptsize},labelfont=up,hypcap=true}

%%%% % debug code
%%%% \ExplSyntaxOn
%%%% % https://tex.stackexchange.com/a/123283/5764
%%%% \DeclareExpandableDocumentCommand { \printlengthas } { m m }
%%%% { \dim_to_decimal_in_unit:nn {#1} { 1 #2 } #2 }
%%%% \ExplSyntaxOff
%%%%
%%%% \let\@xxx\includegraphics
%%%% \def\includegraphics{\@tempdima=\figurewidth\advance\@tempdima-\textwidth\advance\@tempdima7pt
%%%% 	\ifdim\@tempdima=0pt
%%%% 	\else
%%%% 	\typeout{%
%%%% 		***** linewidth =\printlengthas{\linewidth}{mm}^^J%
%%%% 		***** textwidth =\printlengthas{\textwidth}{mm}^^J%
%%%% 		***** figurewidth =\printlengthas{\figurewidth}{mm}^^J%
%%%% 		===== difference =\printlengthas{\@tempdima}{mm}^^J%
%%%% 	}\fi\@xxx}

% Patch floatrow package so that it works properly even with pagenumbering style changes
% patch assumes zref-abspage package is loaded and theabspage is defined
\ClassInfo{FRIteza}{Patching floatrow package to support pagenumbering style changes}
\@ifpackagelater{floatrow}{2008/08/03}{
  \ClassWarning{FRIteza}{Applying\space patch\space developed\space for\space floatrow\space 2008/08/02\space v0.3b,\space
  detected\space floatrow\space \csname ver@floatrow.sty \endcsname}
}{}
\patchcmd{\flrow@FB}{\thepage}{\theabspage}{\ClassInfo{FRIteza}{\string\flrow@FB\space successfully patched}}{\ClassInfo{FRIteza}{failed to patch \string\flrow@FB}}
\patchcmd{\flrow@FC}{\thepage}{\theabspage}{\ClassInfo{FRIteza}{\string\flrow@FC\space successfully patched}}{\ClassInfo{FRIteza}{failed to patch \string\flrow@FC}}
\patchcmd{\@@@floatbox}{\thepage}{\theabspage}{\ClassInfo{FRIteza}{\string\@@@floatbox\space successfully patched}}{\ClassInfo{FRIteza}{failed to patch \string\@@@floatbox}}
\patchcmd{\FR@floatbox}{\thepage}{\theabspage}{\ClassInfo{FRIteza}{\string\FR@floatbox\space successfully patched}}{\ClassInfo{FRIteza}{failed to patch \string\FR@floatbox}}
\patchcmd{\FB@writeaux}{\thepage}{\theabspage}{\ClassInfo{FRIteza}{\string\FB@writeaux\space successfully patched}}{\ClassInfo{FRIteza}{failed to patch \string\FB@writeaux}}

% lists
\newenvironment{description}{}{} % dummy description environemt; redefined by enumitem
\RequirePackage{enumitem} % review use of enumitem package
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
\renewcommand\theenumi{\@arabic\c@enumi} % this assumes that when enumeratating items a lowercase initial is used, see https://www.quora.com/Why-don’t-lowercase-and-uppercase-numbers-exist
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

% TODO correct issues with improper alignment of fist line and other lines in multiline items e.g. pg 24 in TOC of demo-bypub, see also \section and \@chapter
% table of contents see http://mirrors.concertpass.com/tex-archive/macros/latex/contrib/tocloft/tocloft.pdf
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand{\tableofcontents}{%
  \@xp\chapter\@xp*\@xp{\contentsname \chaptermark{\contentsname}}%
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
      { \leavevmode
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

\newcommand{\@place}{Ljubljana}
\newcommand{\@month}{\number\month}
\newcommand{\@year}{\number\year}
\newcommand{\forceDate}[2]{
  \if@dev
  \else
    \gdef\@month{#1}
    \gdef\@year{#2}
  \fi
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
            Subject={doctoral disertation}
          }
        }
      }
    }{%
      \ClassError{FRIteza}{The \protect\title\space macro must select language variant,\MessageBreak allowed slovene or english, supplied "\cmdKV@title@language"}{}
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
      \ClassError{FRIteza}{The \protect\keywords\space macro must select language variant,\MessageBreak allowed slovene or english, supplied "\cmdKV@keywords@language"}{}
    }
  \endgroup
}

\define@cmdkey{cover}{title}[]{}
\define@cmdkey{cover}{loc}[]{}
\define@cmdkey{cover}{colour}[]{}
\newcommand{\cover}[2][]{
  \begingroup
    \setkeys{cover}{#1}
    \gdef\@cover@image{#2}
    \ifundef{\cmdKV@cover@title}
      {\expandafter\gdef\expandafter\@cover@title\expandafter{\if@slovene\@title@sl\else\@title@en\fi}}
      {\expandafter\gdef\expandafter\@cover@title\expandafter{\cmdKV@cover@title}}
    \ifundef{\cmdKV@cover@loc}
      {\expandafter\gdef\expandafter\@cover@title@loc\expandafter{NE}}
      {\expandafter\gdef\expandafter\@cover@title@loc\expandafter{\cmdKV@cover@loc}}
    \ifundef{\cmdKV@cover@colour}
      {\expandafter\gdef\expandafter\@cover@title@colour\expandafter{P1797}}
      {\expandafter\gdef\expandafter\@cover@title@colour\expandafter{\cmdKV@cover@colour}}
  \endgroup
}

\define@cmdkey{spine}{title}[]{}
\define@cmdkey{spine}{pages}[]{}
\newcommand{\spine}[2][]{
  \begingroup
    \setkeys{spine}{#1}
    \gdef\@spine@id{%
      \pgfmathsetbasenumberlength{3}%
      \pgfmathdectoBase\mynumber{#2}{16}\mynumber
    }
    \ifundef{\cmdKV@spine@title}
      {\expandafter\gdef\expandafter\@spine@title\expandafter{\if@slovene\@title@slA\else\@title@enA\fi}}
      {\expandafter\gdef\expandafter\@spine@title\expandafter{\cmdKV@spine@title}}
    \ifundef{\cmdKV@spine@pages}
      % on first run warn LastPage label used; subtract 2 due to cover followed by a non printable jobinfo page
      {\expandafter\gdef\expandafter\@spine@pages\expandafter{\expandafter\the\numexpr\zref@extract{LastPage}{abspage}-2\relax}}
      {\expandafter\gdef\expandafter\@spine@pages\expandafter{\cmdKV@spine@pages}}
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
    % TODO: if more than 6 issue error
    \expandafter\xdef\csname @approvedBy@\Alph{approvedById}\endcsname{
      #2\noexpand\par
      \begingroup
        \ifundef{\cmdKV@approvedBy@title}
          {\relax}
          {\noexpand\small\noexpand\emph{\cmdKV@approvedBy@title}\noexpand\par}
        \ifundef{\cmdKV@approvedBy@role}
          {\relax}
          {\noexpand\textsc{\cmdKV@approvedBy@role}\noexpand\par}
        \ifundef{\cmdKV@approvedBy@affiliation}
          {\relax}
          {{\cmdKV@approvedBy@affiliation}\noexpand\par}
      \endgroup
    }
  \endgroup
}

\newcounter{previousPublicationId}
\newcommand{\citePreviousPublication}[1]{
  \begingroup
    \stepcounter{previousPublicationId}
    \expandafter\gdef\csname @previousPublication@\Alph{previousPublicationId}\endcsname{%
      #1%
    }
  \endgroup
}

\define@cmdkey{chapterAbstract}{keywords}[]{}
\define@cmdkey{chapterAbstract}{published}[]{}
\newcommand{\chapterAbstract}[2][]{
  \begingroup
    \setkeys{chapterAbstract}{#1}
    \ifundef{\cmdKV@chapterAbstract@published}
      {\relax}
      {\fcolorbox{grey20}{white}{\includegraphics[width=\textwidth-7pt]{\cmdKV@chapterAbstract@published}}
      \newpage}

    \noindent%
    \begin{minipage}{\textwidth}
      \small
      \sffamily
      {\color{grey20}\rule{\textwidth}{0.4pt}}

      {\textsc{\abstractname.}\quad #2}

      \ifundef{\cmdKV@chapterAbstract@keywords}
        {\relax}
        {\vspace{.5\baselineskip}
        \textsc{\keywordsname.}\quad\cmdKV@chapterAbstract@keywords}

      {\color{grey20}\rule{\textwidth}{0.4pt}}
    \end{minipage}
    \vspace{.5\baselineskip}

  \endgroup
}

\define@cmdkey{chapterAcknowledgements}{language}[]{}
\newcommand{\chapterAcknowledgements}[2][]{
  \begingroup
    \setkeys{chapterAcknowledgements}{#1}
    \ifundef{\cmdKV@chapterAcknowledgements@language}
      {\if@slovene\newcommand{\chackname}{Zahvala}\else\newcommand{\chackname}{Acknowledgements}\fi}
      { \switchcase{\cmdKV@keywords@language}
        {
          {slovene} {\newcommand{\chackname}{Zahvala}}
          {english} {\newcommand{\chackname}{Acknowledgements}}
        }
      }

    \vspace{\baselineskip}
    \noindent\begin{minipage}{\textwidth}
      \sffamily
      \paragraph{\textsc{\chackname}}
      \footnotesize
      \emph{#2}\par
    \end{minipage}
    \vspace{.5\baselineskip}

  \endgroup
}

% environments
\newenvironment{titlepage}{
  \thispagestyle{empty}%
}{
  \cleardoublepage
}

\newif\if@abstract \@abstractfalse
\newenvironment{abstract}{
  \if@slovene
    \if@povzetek
      \ClassError{FRIteza}{With class option language=english the 'abstract'\MessageBreak
        environment must precede the 'povzetek' enviornment}{}
    \fi
    \selectlanguage{english}
  \fi
  \chapter*{\abstractname}
  \chaptermark{\abstractname}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\abstractname}
  \metabox{
    \vspace{-9\baselineskip}%
    \begin{centering}
      { \setlength{\@tempdima}{\baselineskip}
        \fontsize{8bp}{9bp}\selectfont
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
  {\noindent\emph{\keywordsname}\quad\@keywords@en\par} % text with \textsc{\MakeLowercase{\@keywords@en}}
  \global\@abstracttrue
%   on exit from environment swap to main language is automatic
%	\if@slovene
%		\selectlanguage{slovenian}
%	\fi
}

\newif\if@povzetek \@povzetekfalse
\newenvironment{povzetek}{
  \if@slovene
  \else
    \if@abstract
      \ClassError{FRIteza}{With class option language=english the 'povzetek'\MessageBreak
        environment must precede the 'abstract' enviornment}{}
    \fi
    \selectlanguage{slovenian}
  \fi
%	\chapter*{Izvleček} % izvleček should be max 300 words long
%	\chaptermark{Izvleček}
%	\addcontentsline{toc}{chapter}{\protect\numberline{}Izvleček}
  \chapter*{\abstractname}
  \chaptermark{\abstractname}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\abstractname}
  \metabox{
    \vspace{-9\baselineskip}%
    \begin{centering}
      { \setlength{\@tempdima}{\baselineskip}
        \fontsize{8bp}{9bp}\selectfont
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
  {\noindent\emph{\keywordsname}\quad\@keywords@sl\par}
  \global\@povzetektrue
%   on exit from environment swap to main language is automatic
%	\if@slovene
%	\else
%		\selectlanguage{english}
%	\fi
}

\newenvironment{acknowledgements}
{
  \chapter*{\acknowledgementsname}
  \chaptermark{\acknowledgementsname}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\acknowledgementsname}
  \begingroup
  %\itshape\addfontfeatures{ItalicFeatures{Ligatures={TeX,Discretionary,Rare,Historic},Numbers={OldStyle},Style={Swash}}}
  \fontspec{EBGaramond}[
    Path=fonts/EBGaramond/,
    Extension=.otf,
    UprightFont={*08-Italic},
    Ligatures={TeX,Discretionary,Rare,Historic},
    Mapping=tex-text,
    Numbers={OldStyle},
    Style={Swash}]
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

\newif\if@inrazsirjeniPovzetek \@inrazsirjeniPovzetekfalse
\newenvironment{razsirjeniPovzetek}
{
  % error if main language slovene
  % error if inappendices
  % error if insubappendices
  % TODO: error if not last chapter?
  \if@slovene
    \ClassError{FRIteza}{The 'razsirjeniPovzetek' environment can not be used\MessageBreak with 'slovene' as primary language}{}
  \fi
  \if@inappendices
    \ClassError{FRIteza}{The 'razsirjeniPovzetek' environment can not be used\MessageBreak inside the 'appendices' environment}{}
  \fi
  \if@insubappendices
    \ClassError{FRIteza}{The 'razsirjeniPovzetek' environment can not be used\MessageBreak inside the 'subappendices' environment}{}
  \fi
  \@inrazsirjeniPovzetektrue

  \selectlanguage{slovenian}

  \cleardoublepage
  \thispagestyle{empty}
  \global\@isChapterPagetrue
  \if@dev
    \newcommand{\rp@colorA}{P1797}
    \newcommand{\rp@color}{black}
    \newcommand{\rp@logo}{cc/ul-fri-micro}
  \else
    \pagecolor{grey65}
    \newcommand{\rp@colorA}{white}
    \newcommand{\rp@color}{white}
    \newcommand{\rp@logo}{cc/ul-fri-micro-white}
  \fi
  \@stepChapterThumb
  \global\@showChapterThumbfalse
  \begin{centering}
    \hbox{}\vfill
    { \LARGE\scshape\color{\rp@colorA}\addfontfeature{Ligatures=Historic}{%
      \@title@sl
      }\par
    }

    \vfill
    { \Large\scshape\color{\rp@color}\addfontfeature{Ligatures=Historic}{%
      \@author
      }\par
    }

    \vfill
    { \normalsize\scshape\color{\rp@color}\addfontfeature{Ligatures=Historic}{%
      doktorska disertacija\\
      predana\\
      Fakulteti za računalništvo in informatiko\\
      kot del izpolnjevanja pogojev za pridobitev naziva\\
      doktor znanosti\\
      s področja\\
      računalništva in informatike
      }\par
    }

    \vfill
    { \normalsize\itshape\color{\rp@colorA}\addfontfeature{Ligatures=Historic}{%
      razširjeni povzetek
      }\par
    }

    \vfill\vfill
    \hspace*{1.2mm}\includegraphics{\rp@logo}

    {\color{\rp@color}\@place,~\number\@year}\par
  \end{centering}
  \refstepcounter{chapter}
  \typeout{=== Razsirjeni povzetek.}%
  \chaptermark{Razširjeni povzetek}
  \addcontentsline{toc}{chapter}{\protect\numberline{}Razširjeni povzetek}%
  \clearpage
  \global\@isChapterPagefalse
  \if@dev
  \else
    % chapter thumb color to grey65, thumb start at 0ft
    \renewcommand{\@chapterThumbColourB}{grey65}
    \global\setlength{\VOffset}{0pt}
    \global\@showChapterThumbtrue
  \fi
  \pagecolor{white}

  % disable numbering for section, subsection and subsubsection,
  \setcounter{secnumdepth}{0}
  % change formatting of section, subsection and subsubsection titles
  \renewcommand\section{
    \@startsection{section}{1}{\z@}%
    %		{\baselineskip}%
    %		{-1em}%
    {2.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\color{P1797}\normalsize\scshape}
  }
  \renewcommand\subsection{
    \@startsection{subsection}{2}{\z@}%
    %		{\baselineskip}%
    %		{-1em}%
    {2.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\color{P1797}\normalsize\itshape}
  }
  \renewcommand\subsubsection{
    \@startsection{subsubsection}{3}{\z@}%
    %		{\baselineskip}%
    %		{-1em}%
    {2.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\color{P1797}\normalsize}
  }
  % disable adding sections, subsections, and subsubsections to the toc
  \@addsectionstotocfalse
  % change numbering for figure, table, equation, video, definition
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
  \renewcommand{\thevideo}{\arabic{video}}
  \renewcommand{\theequation}{\arabic{equation}}
  \renewcommand{\thedefinition}{\arabic{definition}}
  \@afterheading
  \@afterindentfalse
}
{
  \clearpage
  \@inrazsirjeniPovzetekfalse
  \setcounter{secnumdepth}{2}
}

% bibliography environment [require FRIteza style]
% dummy thebibiliography environment; redefined by natbib
\newenvironment{thebibliography}[1]{}{}%
% dummy newblock macro; redefined by natbib
\newcommand\newblock{}

\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{multicol}
\renewcommand{\bibsection}{
  \chapter*{\bibname}
  \chaptermark{\bibname}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
}
\renewcommand{\bibpreamble}{
  \setlength\multicolsep{0pt}
  \raggedcolumns
  \setcounter{unbalance}{0}
  \begin{multicols}{2}
    \begingroup
    \scriptsize\RaggedRight
}
\renewcommand{\bibpostamble}{
    \normalsize
  \endgroup
  \end{multicols}
}
% set FRIteza bibstyle as default
\bibliographystyle{FRIteza}

% Patch natbib thebibliography environment, to take into account variable width font, which causes issues with item identation (based on cmr10)
% https://tex.stackexchange.com/questions/304010/how-does-bibtex-know-the-widest-label
\ClassInfo{FRIteza}{Patching natbib package to support variable width font in bibitem labels}
\newcounter{NAT@bibcount}
\patchcmd{\thebibliography}
  {#1}
  {\arabic{NAT@bibcount}}
  {\ClassInfo{FRIteza}{\string\thebibliography\space successfully patched, step 1}}
  {\ClassInfo{FRIteza}{failed to patch \string\thebibliography, step 1}}
\patchcmd{\thebibliography}
  {\bibsection}
  {%
    \expandafter\setcounter{NAT@bibcount}{#1*10}
    \bibsection
  }
  {\ClassInfo{FRIteza}{\string\thebibliography\space successfully patched, step 2}}
  {\ClassInfo{FRIteza}{failed to patch \string\thebibliography, step 2}}
%\renewcommand\@biblabel[1]{\begingroup\normalsize\addfontfeature{Numbers=Monospaced}[#1]\endgroup} % force monospaced numbers in bibitem, but not avail in scriptsize

% patch natbib warnings with extra info to support multibib disjoint bibs
\patchcmd{\NAT@citexnum}
  {Citation `\@citeb'}
  {Citation\@extra@b@citeb\space `\@citeb'}
  {\ClassInfo{FRIteza}{\string\NAT@citexnum\space successfully patched}}
  {\ClassInfo{FRIteza}{failed to patch \string\NAT@citexnum}}
\patchcmd{\NAT@citex}
  {Citation `\@citeb'}{Citation\@extra@b@citeb\space `\@citeb'}
  {\ClassInfo{FRIteza}{\string\NAT@citex\space successfully patched}}
  {\ClassInfo{FRIteza}{failed to patch \string\NAT@citex}}
\patchcmd{\NAT@test}
  {Author undefined for citation`\@citeb'}
  {Author undefined for citation\@extra@b@citeb\space `\@citeb'}
  {\ClassInfo{FRIteza}{\string\NAT@test\space successfully patched, step 1}}
  {\ClassInfo{FRIteza}{failed to patch \string\NAT@test, step 1}}
\patchcmd{\NAT@test}
  {Year undefined for citation`\@citeb'}
  {Year undefined for citation\@extra@b@citeb\space `\@citeb'}
  {\ClassInfo{FRIteza}{\string\NAT@test\space successfully patched, step 2}}
  {\ClassInfo{FRIteza}{failed to patch \string\NAT@test, step 2}}
\patchcmd{\NAT@alias}
  {citation `\@citeb'}{citation\@extra@b@citeb\space `\@citeb'}
  {\ClassInfo{FRIteza}{\string\NAT@alias\space successfully patched}}
  {\ClassInfo{FRIteza}{failed to patch \string\NAT@alias}}
\patchcmd{\nocite}
  {Citation `\@citeb'}{Citation\@extra@b@citeb\space `\@citeb'}
  {\ClassInfo{FRIteza}{\string\nocite\space successfully patched}}
  {\ClassInfo{FRIteza}{failed to patch \string\nocite}}
\patchcmd{\bibcite}
  {Citation `#1'}
  {Citation\@extra@binfo\space `#1'}
  {\ClassInfo{FRIteza}{\string\bibcite\space successfully patched}}
  {\ClassInfo{FRIteza}{failed to patch \string\bibcite}}
\patchcmd{\endthebibliography}
  {Empty `thebibliography'}
  {Empty `thebibliography\@extra@b@citeb'}
  {\ClassInfo{FRIteza}{\string\endthebibliography\space successfully patched}}
  {\ClassInfo{FRIteza}{failed to patch \string\endthebibliography}}

% memorize natbib \thebibiliography environment, redefined by multibib AtBeginDocument,
% done AtBeginDocument to keep any changes that occur from here on
\AtBeginDocument{
  \let\natbib@thebibliography\thebibliography
  \let\natbib@endthebibliography\endthebibliography
}

% load multibib for previousPublication bibliography list
\RequirePackage[resetlabels]{multibib}

% patch multibib for resetlabels and disjointbib support
\ClassInfo{FRIteza}{Patching multibib package to support resetlabels and disjointbibs}
\@ifpackagelater{multibib}{2008/12/11}{
  \ClassWarning{FRIteza}{Applying\space patch\space developed\space for\space multibib\space 2008/12/10\space v1.4,\space
  detected\space multibib\space \csname ver@multibib.sty \endcsname}
}{}

\RequirePackage{regexpatch}

% patch \newcites command
\xpatchcmd{\newcites}
  {\noexpand\csname\@citename\endcsname}
  {%
    \noexpand\gdef\noexpand\@extra@b@citeb{@\@suffix}
    \noexpand\csname\@citename\endcsname%
  }
  {\ClassInfo{FRIteza}{\string\newcites\space successfully patched, step 1}}
  {\ClassInfo{FRIteza}{failed to patch \string\newcites, step 1}}
\xpatchcmd{\newcites}
  {\noexpand\nocite{##1}}
  {%
    \noexpand\gdef\noexpand\@extra@b@citeb{@\@suffix}
    \noexpand\nocite{##1}
    \noexpand\gdef\noexpand\@extra@b@citeb{}
  }
  {\ClassInfo{FRIteza}{\string\newcites\space successfully patched, step 2}}
  {\ClassInfo{FRIteza}{failed to patch \string\newcites, step 2}}
\xpatchcmd{\newcites}
  {\noexpand\bibliography{##1}}
  {%
    \noexpand\gdef\noexpand\@extra@b@citeb{@\@suffix}
    \noexpand\if@filesw \noexpand\immediate\noexpand\write\noexpand\@auxout
      {\noexpand\string\noexpand\gdef\noexpand\string\noexpand\@extra@binfo{@\@suffix}}
    \noexpand\fi
    \noexpand\bibliography{##1}
    \noexpand\if@filesw \noexpand\immediate\noexpand\write\noexpand\@auxout
      {\noexpand\string\noexpand\gdef\noexpand\string\noexpand\@extra@binfo{}}
    \noexpand\fi
    \noexpand\gdef\noexpand\@extra@b@citeb{}
  }
  {\ClassInfo{FRIteza}{\string\newcites\space successfully patched, step 3}}
  {\ClassInfo{FRIteza}{failed to patch \string\newcites, step 3}}

% declare cite*self for use in previous publication
\newcites{self}{Previous publication}

\AtBeginDocument{
  % patch mb@@citex to reset suffix, must be done AtBeginDocument
  \makeatletter
  \xpatchcmd{\mb@@citex}
    {\let\@citex\std@@citex}
    {%
      \let\@citex\std@@citex
      \gdef\@extra@b@citeb{}%
    }
    {\ClassInfo{FRIteza}{\string\mb@@citex\space successfully patched}}
    {\ClassInfo{FRIteza}{failed to patch \string\mb@@citex}}
  \makeatother

  % Patch multibib \std@thebibliography, \thebibliography, and \bibliography environments, must perform AtBeginDocument as multibib does so
  \let\std@thebibliography\natbib@thebibliography
  \let\thebibliography\natbib@thebibliography
  \let\endthebibliography\natbib@endthebibliography
  \makeatletter
  \xpatchcmd{\std@thebibliography}
    {\global\c@NAT@ctr\z@} % search for first occurance of
    {\usecounter{NAT@ctr}} % swap for
    {\ClassInfo{FRIteza}{\string\std@thebibliography\space successfully patched}}
    {\ClassInfo{FRIteza}{failed to patch \string\std@thebibliography}}
  \makeatother

  \def\thebibliography#1{%
    \@isnumber{#1}{
      \ifnum\mb@biblabelwidth=0
        \@tempcnta\c@NAT@ctr %% changed here to c@NAT@ctr
        \ifcontinuouslabels
          \advance\@tempcnta#1%
          \std@thebibliography{\@arabic\@tempcnta}%
        \else % if not continuous restart from 0 and run thebibliography as normal
          \setcounter{NAT@ctr}{0}
          \std@thebibliography{#1}%
        \fi
      \else
        \std@thebibliography{\@arabic\mb@biblabelwidth}%
        \global\mb@biblabelwidth 0
      \fi
    }{
      \std@thebibliography{#1}
    }%
  }
  \ClassInfo{FRIteza}{\string\thebibliography\space successfully patched}
}

\newcounter{savedchapter}
\newcounter{appendices}
\newif\if@inappendices \@inappendicesfalse
\newenvironment{appendices}
{
  \if@inappendices
    \ClassError{FRIteza}{The 'appendices' environment can not be used\MessageBreak inside the 'appendices' environment}{}
  \fi
  \if@insubappendices
    \ClassError{FRIteza}{The 'appendices' environment can not be used\MessageBreak inside the 'subappendices' environment}{}
  \fi
  \if@inrazsirjeniPovzetek
    \ClassError{FRIteza}{The 'appendices' environment can not be used\MessageBreak inside the 'razsirjeniPovzetek' environment}{}
  \fi
  \@inappendicestrue

  % change numbering for chapters
  \ifnum \c@subappendices > \z@
    \renewcommand{\thechapter}{\Roman{chapter}}
    \renewcommand{\theHchapter}{\Roman{chapter}}
  \else
    \renewcommand{\thechapter}{\Alph{chapter}}
    \renewcommand{\theHchapter}{\Alph{chapter}}
  \fi
  \setcounter{savedchapter}{\c@chapter}
  \setcounter{chapter}{\c@appendices}
  % disable numbering for section, subsection and subsubsection
  \setcounter{secnumdepth}{0}
  \gdef\@chapapp{\appendixname}%
  % disable adding sections, subsections, and subsubsections to the toc
  %	\@addsectionstotocfalse
  % change formatting of section, subsection and subsubsection titles
  \renewcommand\section{
    \@startsection{section}{1}{\z@}%
%		{\baselineskip}%
%		{-1em}%
    {2.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\color{P1797}\normalsize\scshape}
  }
  \renewcommand\subsection{
    \@startsection{subsection}{2}{\z@}%
%		{\baselineskip}%
%		{-1em}%
    {2.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\color{P1797}\normalsize\itshape}
  }
  \renewcommand\subsubsection{
    \@startsection{subsubsection}{3}{\z@}%
%		{\baselineskip}%
%		{-1em}%
    {2.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\color{P1797}\normalsize}
  }
}{
  \setcounter{appendices}{\c@chapter}
  \setcounter{chapter}{\c@savedchapter}
  \gdef\@chapapp{\chaptername}
  \gdef\thechapter{\@arabic\c@chapter}
  \setcounter{secnumdepth}{2}
}

\newcounter{subappendices}
\newif\if@insubappendices \@insubappendicesfalse
\newenvironment{subappendices}
{
  \if@inappendices
    \ClassError{FRIteza}{The 'subappendices' environment can not be used\MessageBreak inside the 'appendices' environment}{}
  \fi
  \if@insubappendices
    \ClassError{FRIteza}{The 'subappendices' environment can not be used\MessageBreak inside the 'subappendices' environment}{}
  \fi
  \@insubappendicestrue

  % continuous numbering of subappendices regardless of chapter
  \setcounter{section}{\c@subappendices}
  % disable numbering for section, but change numbering for subsection
  \renewcommand{\thesection}{\alph{section}} % remove numbering force to star version
  \renewcommand{\theHsection}{\arabic{chapter}.\alph{section}}
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}
  \renewcommand{\theHsubsection}{\theHsection.\arabic{subsection}}
  % change numbering for figure, table, equation, video, definition
  \setcounter{figure}{0}
  \renewcommand{\thefigure}{\textsc{\thesection}.\arabic{figure}}
%	\renewcommand{\theHfigure}{\theHsection.\arabic{figure}} TODO: necessary??
  \setcounter{table}{0}
  \renewcommand{\thetable}{\textsc{\thesection}.\arabic{table}}
%	\renewcommand{\theHtable}{\theHsection.\arabic{table}} TODO: necessary??
  \setcounter{equation}{0}
  \renewcommand{\theequation}{\textsc{\thesection}.\arabic{equation}}
%	\renewcommand{\theHequation}{\theHsection.\arabic{equation}} TODO: necessary??
  \setcounter{video}{0}
  \renewcommand{\thevideo}{\textsc{\thesection}.\arabic{video}}
%	\renewcommand{\theHvideo}{\theHsection.\arabic{video}} TODO: necessary??
  \renewcommand{\thedefinition}{\textsc{\thesection}.\arabic{definition}}
%	\renewcommand{\theHdefinition}{\theHsection.\arabic{definition}} TODO: necessary??
  % change formatting of section titles
  \renewcommand{\section}{%
    \@startsection {section}{1}{\z@}%
    %{-\preskipS}%
    %{2ex}
    {-2.5ex \@plus -1ex \@minus -.2ex}
    {2.3ex \@plus.2ex}
    {\color{P1797}\large\scshape}%
  }
}{
  % remember last subappendice number and return to old style
  \setcounter{subappendices}{\c@section}
}

% theorem envionrments
\RequirePackage{ntheorem}
\theoremheaderfont{\normalfont\itshape}
\theorembodyfont{\normalfont}
\theoremseparator{:}
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremstyle{plain}

% declare definition theorem like environment
\newcommand\definitionname{Definition}
\newtheorem{definition}{\definitionname}[chapter]

\usepackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\tcolorboxenvironment{definition}{
  enhanced, boxrule=0pt, sharp corners, frame hidden, %drop lifted shadow,
  breakable,
% TODO: definition.wide
%	enlarge right by=-\gridW,%\marginparwidth-\marginparsep,
%	toggle enlargement=evenpage,
%	width=\textwidth+\gridW,%\marginparwidth+\marginparsep,
  left=.5\parindent,
  right=.5\parindent,
  before skip=.5\baselineskip,
  after skip=.5\baselineskip, % TODO skip of theorem
  enlargepage flexible=\baselineskip,
  colback=grey05,
  borderline horizontal={1pt}{0pt}{grey20},
}

% hyperref and pdfsupport
% !!! probably must be loaded last as it hooks on \maketitle \chapter and others
\setcounter{page}{1}
\pagenumbering{alph}
\thispagestyle{empty}
\RequirePackage{hyperxmp}
\RequirePackage[xetex,unicode,pdfa,pdfdisplaydoctitle=true,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true]{hyperref}

% format hyperlinks
\urlstyle{same}
\providecommand{\url}[1]{\href{#1}{\urlstyle{same}\nolinkurl{#1}}}
\providecommand{\urlprefix}{\textsc{url:}\,}
\providecommand{\doi}[1]{\href{https://doi.org/#1}{\urlstyle{same}\nolinkurl{#1}}}
\providecommand{\doiprefix}{\textsc{doi:}\,}
\providecommand{\arxiv}[1]{\href{https://arxiv.org/abs/#1}{\urlstyle{same}\nolinkurl{#1}}}
\providecommand{\arxivprefix}{\textsc{arXiv:}\,}
% show cobbiss fields
%\providecommand{\cobiss}[1]{\href{https://plus.si.cobiss.net/opac7/bib/#1}{\urlstyle{same}\nolinkurl{#1}}}
%\providecommand{\cobissprefix}{\textsc{cobiss:}\,}
% gobble cobiss fields
\providecommand{\cobissprefix}{}
\providecommand{\cobiss}[1]{\@gobble}

% declare pdf transforms for unsupported commands
% i.e. commands that issue hyperref warning "Token not allowed in a PDF string (Unicode)"
% see https://tex.stackexchange.com/questions/10555/hyperref-warning-token-not-allowed-in-a-pdf-string
\pdfstringdefDisableCommands{%
  \def\\{}%
  \def\newline{}%
%	\def\texttt#1{<#1>}%
}



% TODO: highlighting, \hl{\ang{150}} has issues!!!! soul <-> siuntx
%\RequirePackage{easyReview} % higlighting alternative [soul, proofread, changes, ]
\RequirePackage{marginnote, soul}
% \RequirePackage{pdfcomment}
% TODO: authorcomments, versonotes?, marginnote from tcolorbox (N,U,??, match coloring to reviewers)
%\renewcommand\marginnotevadjust{-.5\baselineskip}
\newcommand{\sidenote}[2]{#1}%{{\color{P1797}#1}\xspace\hl{[!]}\marginnote{\sffamily\bfseries\RaggedRight\scriptsize\color{P1797}#2}}

% TODO implement notes like marginnote from tcolorbox; highlight affected text (reviewer intials date, eg: FHH 05-04-2005) and on opposite page (verso for recto pages, recto for verso pages) the note + any answer.

%\show\FB@writeaux
%\show\FB@readaux
%\show\thepage
%

%\show\@starsection
\endinput

%%
%% End of file `FRIteza.cls'.
