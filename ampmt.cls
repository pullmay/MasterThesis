%%
%% ampmt.cls: 京都大学大学院情報学研究科数理工学専攻修士論文 クラスファイル
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ampmt}[2019/04/01 Master's Thesis Class for KUAMP]

\def\amp@ptsize{11pt}

\newif\if@amp@chapter
\newif\if@amp@english

\newcount\amp@tempcnta
\newdimen\amp@tempdima
\newdimen\amp@spinetitlemaxwidth
\newdimen\wdspine
\newbox\amp@tempboxa

\DeclareOption{8pt}{\def\amp@ptsize{8pt}}
\DeclareOption{9pt}{\def\amp@ptsize{9pt}}
\DeclareOption{10pt}{\def\amp@ptsize{10pt}}
\DeclareOption{chapter}{\@amp@chaptertrue}
\DeclareOption{english}{\@amp@englishtrue}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
  \PassOptionsToClass{\CurrentOption}{article}%
  \PassOptionsToClass{\CurrentOption}{jsbook}%
  \PassOptionsToClass{\CurrentOption}{jsarticle}}
\ProcessOptions\relax

\if@amp@english
    \if@amp@chapter
        \LoadClass[a4paper,\amp@ptsize]{report}
    \else
        \LoadClass[a4paper,\amp@ptsize]{article}
    \fi
\else
\if@amp@chapter
    \LoadClass[report,\amp@ptsize]{jsbook}
\else
    \LoadClass[\amp@ptsize]{jsarticle}
\fi
\fi

\RequirePackage{geometry}
\RequirePackage{graphicx}

\def\Kansuji#1{% 藤田先生の tkokugo.sty とほぼ同じ
  \ifcase#1\or 一\or 二\or 三\or 四\or 五\or 六\or 七\or 八\or 九\or 十
  \or 十一\or 十二\or 十三\or 十四\or 十五\or 十六\or 十七\or 十八\or 十九\or 二十
  \or 二十一\or 二十二\or 二十三\or 二十四\or 二十五\or 二十六\or 二十七\or 二十八\or 二十九\or 三十
  \or 三十一\or 三十二\or 三十三\or 三十四\or 三十五\or 三十六\or 三十七\or 三十八\or 三十九\or 四十
  \or 四十一\or 四十二\or 四十三\or 四十四\or 四十五\or 四十六\or 四十七\or 四十八\or 四十九\or 五十
  \or 五十一\or 五十二\or 五十三\or 五十四\or 五十五\or 五十六\or 五十七\or 五十八\or 五十九\or 六十
  \or 六十一\or 六十二\or 六十三\or 六十四\or 六十五\or 六十六\or 六十七\or 六十八\or 六十九\or 七十
  \else\@ctrerr\fi\relax
}

\newcommand{\nengetsu}[2]{%
  \begingroup
  \ifydir\let\Kansuji\relax\fi
  \ifnum#1>2019\relax 令和\Kansuji{\the\numexpr#1-2018}年\Kansuji{#2}月\fi
  \ifnum#1=2019\relax \ifnum#2>4\relax 令和元年\Kansuji{#2}月\fi\fi
  \ifnum#1=2019\relax \ifnum#2<5\relax 平成\Kansuji{31}年\Kansuji{#2}月\fi\fi
  \ifnum#1<2019\relax 平成\Kansuji{\the\numexpr#1-1988}年\Kansuji{#2}月\fi
  \endgroup
}

\newcommand{\jaytogengou}[1]{%
  \ifnum#1>2019\relax 令和\,\,\rotatebox[origin=c]{90}{\the\numexpr#1-2018}\,\,年度\fi
  \ifnum#1=2019\relax 令和元年度\fi
  \ifnum#1<2019\relax 平成\,\,\rotatebox[origin=c]{90}{\the\numexpr#1-1988}\,\,年度\fi
}

\if@amp@english
    \def\inv@mag{1}
    \def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \null\thispagestyle{empty}\newpage\if@twocolumn\null\newpage\fi\fi\fi}
\fi

\if@amp@english
    \def\headfont{\rmfamily\bfseries}
    \def\acknowledgmentname{Acknowledgments}
    \frenchspacing
\else
\def\abstractname{摘要}
\def\acknowledgmentname{謝辞}
\fi

\if@amp@english
    \renewcommand{\title}[2][]{%
      \def\amp@title{#2}
      \def\amp@titleforspine{#1}
      \ifx\amp@titleforspine\@empty
      \def\amp@titleforspine{#2}
      \fi}
    \renewcommand{\author}[1]{\def\amp@author{#1}}
\else
\renewcommand{\title}[3]{%
  \def\amp@titlefirst{#1}\def\amp@titlesecond{#2}\def\amp@titlethird{#3}%
  \def\amp@title{#1#2#3}}
\renewcommand{\author}[2]{\def\amp@authorfamily{#1}\def\amp@authorfirst{#2}}
\fi
\newcommand{\supervisors}[6]{\def\amp@svfirstname{#1}\def\amp@svfirsttitle{#2}%
  \def\amp@svsecondname{#3}\def\amp@svsecondtitle{#4}%
  \def\amp@svthirdname{#5}\def\amp@svthirdtitle{#6}}
\newcommand{\entrancedate}[2]{\def\amp@entranceyear{#1}\def\amp@entrancemonth{#2}}
\newcommand{\submissiondate}[2]{%
  \def\amp@submissionyear{#1}\def\amp@submissionmonth{#2}}

\long\def\abstract#1{\long\def\amp@abstract{#1}}

\newif\ifoutputbody
\outputbodytrue
\newif\ifoutputcover
\outputcovertrue
\newif\ifoutputabstractforsubmission
\outputabstractforsubmissiontrue

\def\setxpt{% from size10.clo
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
}

\newcommand{\@makecover}{%
  \if@amp@english
  \begingroup
  \setxpt
  \vspace*{1cm}
  \begin{center}
    \setlength{\baselineskip}{.8cm}
    {\Large Master's Thesis}
    \vspace*{1.4cm}
    \\
    {\LARGE \amp@title}

    \vspace*{1.5cm}

    {\large Guidance} \vspace*{.5cm}

    {\large
      \begin{tabular}{rl}
        \amp@svfirsttitle & \amp@svfirstname\\
        \amp@svsecondtitle & \amp@svsecondname\\
        \amp@svthirdtitle & \amp@svthirdname
      \end{tabular}
    }
    \vspace*{2.0cm}

    {\LARGE \amp@author} \vspace*{1.0cm}

    {\large \quad}                                         \\ \vspace*{.2cm}
    {\large \quad}                                         \\ \vspace*{.2cm}
    {\large Department of Applied Mathematics and Physics}  \\ \vspace*{.2cm}
    {\large Graduate School of Informatics}                 \\ \vspace*{.2cm}
    {\large Kyoto University}                               \\ \vspace*{.5cm}
    \vspace*{2.1cm}
    \vspace*{-2.1cm}\includegraphics[width=2cm]{logo.pdf}\\
    \vspace*{.2cm}
    {\Large \amp@submissionmonth{} \amp@submissionyear}
  \end{center}
  \endgroup
  \else
  \vspace*{1cm}
  \begin{center}
    \setlength{\baselineskip}{1.1cm}
    {\Large 修士論文}
    \vspace*{1.4cm}
    \\
      {\LARGE
        \ifx\amp@titlefirst\@empty　\else\amp@titlefirst\fi\\
        \ifx\amp@titlesecond\@empty　\else\amp@titlesecond\fi\\
        \ifx\amp@titlethird\@empty　\else\amp@titlethird\fi\\}

    \vspace*{2.5cm}

    {\Large
      \begin{tabular}{rcl}
        指導教員&~~~&\amp@svfirstname　\amp@svfirsttitle\\
        　　　　&~~~&\amp@svsecondname　\amp@svsecondtitle\\
        　　　　&~~~&\amp@svthirdname　\amp@svthirdtitle
      \end{tabular}
    }
    \vspace*{2.5cm}

    {\huge \amp@authorfamily　\amp@authorfirst} \vspace*{1.0cm}

    {\Large 京都大学大学院情報学研究科}\\ \vspace*{.1cm}
    {\Large 数理工学専攻}\\ \vspace*{.1cm}
    {\Large 　}\\ \vspace*{.5cm}
    \vspace*{2.1cm}
    \vspace*{-2.1cm}\includegraphics[width=2cm]{logo.pdf}\\
    \vspace*{.2cm}
            {\LARGE\nengetsu{\amp@submissionyear}{\amp@submissionmonth}}
  \end{center}
  \fi
}

\newcommand{\makecover}{%
\makeinsidecover
}

\newcommand{\makeinsidecover}{%
  \clearpage
  \newgeometry{hmargin=2truecm,vmargin=3truecm}
  \thispagestyle{empty}
  \begin{center}
    \scalebox{\inv@mag}{
      \begin{tabular}{p{144mm}}
        \@makecover
        \\
    \end{tabular}}
  \end{center}
  \cleardoublepage
  \restoregeometry}

\amp@spinetitlemaxwidth=150mm
\newcommand{\@makespine}{%
  \if@amp@english
  \begingroup
  \setxpt
  \rotatebox{270}{%
    \fbox{%
      \parbox[c][\wdspine]{273mm}{\large
        \hspace{10mm}%
        \parbox{153mm}{\centering\amp@titleforspine}%
        \parbox{76mm}{\centering\amp@author}%
        \parbox{34mm}{\amp@submissionmonth{} \amp@submissionyear}%
  }}}
  \endgroup
  \else
  %% 題目が長すぎて背表紙のタイトルが2行になったり，氏名の部分まではみ出たりする
  %% ことを防ぐために，タイトルの長さを調べて必要があれば \scalebox で縮小する．
  \let\amp@scalespinetitle\@undefined
  \setbox\amp@tempboxa\hbox{\large\amp@title}%
  \amp@tempdima\wd\amp@tempboxa
  \ifdim\amp@tempdima>\amp@spinetitlemaxwidth
  \edef\amp@tempa{%
    \the\numexpr\number\amp@spinetitlemaxwidth *100/\number\amp@tempdima}%
  \ifnum\amp@tempa=100\else
  \edef\amp@scalespinetitle{.\amp@tempa}% 本当は \amp@tempa<10 の場合の処理が必要
                                        % だが，その場合はそもそも読めないので
                                        % 考慮しない．
  \fi\fi
  \fbox{%
    \parbox[c][\wdspine]{273mm}{
      \hspace{10mm}%
      \parbox{153mm}{\tate\scalebox{\ifx\amp@scalespinetitle\@undefined 1\else\amp@scalespinetitle\fi}{\large\amp@title}\hfill}%
      \parbox{76mm}{\tate\hspace{20mm}{\large\amp@authorfamily　\amp@authorfirst}\hfill}%
      \parbox{34mm}{\tate
                     {\large\nengetsu{\amp@submissionyear}{\amp@submissionmonth}}%
                    \hfill}%
    }}%
\fi
}

\newcommand{\makespine}[1][1]{%
  \clearpage
  \amp@tempcnta=#1\relax
  \newgeometry{hmargin=3truecm,vmargin=.75truecm}
  \thispagestyle{empty}
  \scalebox{\inv@mag}{%
    \if@amp@english\else
    \tate
    \fi
    \parbox{\if@amp@english14cm\else27.67cm\fi}{
      \loop
      \@makespine
      \if@amp@english\else
      \vspace{.75cm}\par
      \fi
      \advance\amp@tempcnta-1\relax
      \ifnum\amp@tempcnta>0\repeat}}
  \cleardoublepage
  \restoregeometry}

\newcommand{\makeabstract}{%
  \clearpage
  \thispagestyle{empty}
  \null\vfill
  \begin{center}
    \headfont\abstractname
  \end{center}

  \if@amp@english\noindent\fi
  \amp@abstract
  \vfill\vfill\vfill
  \cleardoublepage
}

\newcommand{\makeabstractforsubmission}{%
  \clearpage
  \thispagestyle{empty}
  \begin{center}
    \setlength{\baselineskip}{.8cm}
    {\LARGE
      \if@amp@english
      \amp@title
      \else
      \ifx\amp@titlefirst\@empty\else\amp@titlefirst\\\fi
      \ifx\amp@titlesecond\@empty\else\amp@titlesecond\\\fi
      \ifx\amp@titlethird\@empty\else\amp@titlethird\\\fi
      \fi
    }

    \vspace{7mm}

    {\Large
      \if@amp@english
      \amp@author
      \else
      \amp@authorfamily　\amp@authorfirst
      \fi
    }

    \vspace{7mm}

    {\headfont\abstractname}
  \end{center}

  \if@amp@english\noindent\fi
  \amp@abstract
  \cleardoublepage
}

\newcommand{\maketoc}{%
  \clearpage
  \begingroup
  \pagestyle{empty}
  \tableofcontents
  \thispagestyle{empty}
  \cleardoublepage
  \endgroup}

\newcommand{\acknowledgment}{%
  \if@amp@chapter
  \addcontentsline{toc}{chapter}{\acknowledgmentname}
  \chapter*{\acknowledgmentname}
  \else
  \section*{\acknowledgmentname}
  \fi}

\endinput
