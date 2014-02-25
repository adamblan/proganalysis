\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mfcs}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{homework}{\AtBeginDocument{\homework}}
\DeclareOption{solutions}{\AtBeginDocument{\solutions}}
\DeclareOption{quiz}{\AtBeginDocument{\quiz}}
\DeclareOption{recitation}{\AtBeginDocument{\recitation}}
\DeclareOption{quickcheck}{\AtBeginDocument{\quickcheck}}
\DeclareOption{proofwriting}{\AtBeginDocument{\proofwriting}}
\DeclareOption{workshop}{\AtBeginDocument{\workshop}}
\DeclareOption{ep}{\AtBeginDocument{\ep}}
\ProcessOptions\relax

\LoadClass[11pt, letterpaper]{article}

\RequirePackage{fullpage}

\newcommand{\mfcs}{}

\usepackage{tipa}
\newcommand{\Setty}{$\{$Set\textturnt y$\}$}

\usepackage{enumerate}
\usepackage{cancel}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amstext}
\usepackage{amscd}
\usepackage{amsmath}
\usepackage{xspace}
\usepackage{theorem}
\usepackage{float}
\usepackage{graphicx}
\usepackage{ifthen}
\usepackage{versions}
\usepackage{calc}
\usepackage{multicol}
\usepackage{pdflscape}
\usepackage{tabu}
\usepackage{hyperref}
\usepackage{textcomp}
\usepackage{multicol}
\usepackage{xparse}
\usepackage{xstring}

\edef\oldtt{\ttdefault}
\usepackage[scaled]{beramono}
\usepackage[T1]{fontenc}
\renewcommand*\ttdefault{\oldtt}

\usepackage{listings}
\newcommand{\fillinlistings}{
    \lstset{ %
    language=C, numbers=left, numberstyle=\tiny, stepnumber=1,
    numbersep=4pt, showspaces=false, showstringspaces=false, tabsize=4,
    breaklines=true, breakatwhitespace=false,
    basicstyle=\normalsize\fontfamily{fvm}\selectfont, columns=flexible,
    mathescape=true, escapeinside={(*}{*)},
    %morekeywords={},
    keywordstyle=[2]\color{magenta}, keywords=[2]{FlipCoin, RollDie},
    otherkeywords={@requires, @ensures}
    }
}
\newcommand{\normallistings}{
    \lstset{ %
    language=Python, numbers=left, numberstyle=\tiny, stepnumber=1,
    numbersep=4pt, showspaces=false, showstringspaces=false, tabsize=4,
    breaklines=true, breakatwhitespace=false,
    basicstyle=\footnotesize\fontfamily{fvm}\selectfont, columns=flexible,
    mathescape=true, escapeinside={(*}{*)},
    %morekeywords={},
    keywordstyle=[2]\color{magenta}, keywords=[2]{FlipCoin, RollDie},
    otherkeywords={@requires, @ensures}
    }
}
\normallistings
\newcommand{\codefont}{\fontfamily{fvm}\selectfont}

\renewcommand{\familydefault}{\sfdefault}

\usepackage[usenames, dvipnames]{xcolor}
\definecolor{colour}{rgb}{0,0.45,0}

\usepackage{tikz}
\usetikzlibrary{arrows}
\usetikzlibrary{positioning}


\setlength{\textwidth}{6.5in}
\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{-.25in}
\setlength{\textheight}{9in}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\marginparwidth}{59pt}

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}
\setlength{\abovedisplayskip}{8pt plus 3pt minus 6pt}
\setlength{\intextsep}{15pt plus 3pt minus 6pt}

\renewcommand{\section}{\@startsection{section}{1}{0mm}%
                                  {2ex plus -1ex minus -.2ex}%
                                  {0.1ex plus .2ex}%
                                  {\normalfont\Large\bfseries}}%

%
% Default parameter values
%
\newcommand{\TechniquesQuestions}{\begin{center}\color{colour}\LARGE\textbf{\textsf{Techniques Questions}}\end{center}}
\newcommand{\ProofsQuestions}{\begin{center}\color{colour}\LARGE\textbf{\textsf{Proofs Questions}}\end{center}}
\newcommand{\TheDueDate}{Katilsday, February 31}
\newcommand{\TheNumber}{}
\newcommand{\TheDirections}{Write up carefully argued solutions to the
following problems. The first task is to be complete and correct. The more
subtle task is to keep it simple and succinct. Your solution should be
clear enough that it should explain to someone who does not already
understand the answer why it works. You may use any results proven in
lecture without proof. Anything else must be argued rigorously.  Unless
otherwise specified, all answers are expected to be given in closed form.}

\newcommand{\mfcsdate}[1]{\renewcommand{\TheDueDate}{#1}}
\newcommand{\mfcsnumber}[1]{\renewcommand{\TheNumber}{#1}}
\newcommand{\directions}[1]{\renewcommand{\TheDirections}{#1}}
\renewcommand{\labelenumi}{(\alph{enumi})}

\definecolor{colour}{rgb}{0,0.45,0}
\usepackage{todonotes}

%
% Make the homework header
%

%%%%%%%%%%%%%%%%%% Toggling of document types %%%%%%%%%%%%%%%%%%%%%%
\newcommand{\ifthen}[2]{\ifthenelse{#1}{#2}{}}

\newcommand{\TheType}{Document}
\newcommand{\TheFlavorA}{}
\newcommand{\TheFlavorB}{}
\newboolean{ShowNumbers}
\setboolean{ShowNumbers}{true}
\newboolean{ShowPoints}
\setboolean{ShowPoints}{true}
\newboolean{ShowSolutions}
\setboolean{ShowSolutions}{true}
\newboolean{ShowPurpose}
\setboolean{ShowPurpose}{true}
\newboolean{ShowDate}
\setboolean{ShowDate}{true}
\newboolean{ShowDirections}
\setboolean{ShowDirections}{true}
\newboolean{OnlyWarmup}
\setboolean{OnlyWarmup}{false}

\newcounter{ThePointValue}
\setcounter{ThePointValue}{-1}
\newcommand{\points}[1]{\setcounter{ThePointValue}{#1}}
\newcommand{\unsetPoints}{\setcounter{ThePointValue}{-1}}

\newcommand{\showNumbers}{\setboolean{ShowNumbers}{true}}
\newcommand{\hideNumbers}{\setboolean{ShowNumbers}{false}}
\newcommand{\showPoints}{\setboolean{ShowPoints}{true}}
\newcommand{\hidePoints}{\setboolean{ShowPoints}{false}}
\newcommand{\showPurpose}{\setboolean{ShowPurpose}{true}}
\newcommand{\hidePurpose}{\setboolean{ShowPurpose}{false}}
\newcommand{\showDate}{\setboolean{ShowDate}{true}}
\newcommand{\hideDate}{\setboolean{ShowDate}{false}}
\newcommand{\showDirections}{\setboolean{ShowDirections}{true}}
\newcommand{\hideDirections}{\setboolean{ShowDirections}{false}}

\newboolean{StandaloneProblem}
\setboolean{StandaloneProblem}{true}

% Default values are just a single problem by itself
\hideNumbers
\hidePoints
\hideDate
\hideDirections
\newcommand{\TheCategory}{}
\renewcommand{\TheType}{\TheCategory Problem}

\newcommand{\category}[1]{\renewcommand{\TheCategory}{#1 }}
\newboolean{CategoryInTitle}
\setboolean{CategoryInTitle}{false}
\newcommand{\categoryInTitle}{\setboolean{CategoryInTitle}{true}}

\newcommand{\VerificationQuestion}[1]{
    \points{20}
    \begin{question}{Verifications}
    For this question, you will be given \textbf{five} of your peers' proofs to review
    using ColorMyGraph.  The question you will be reviewing is \textbf{#1}.
    These verifications will be released on Friday and due with this homework assignment on Tuesday.
    If you did not submit the previous assignment, you will not receive verifications.  Verification
    scores will factor into your grade on the assignment you are verifying.
    \end{question}
}


\newcounter{TotalPoints}
\newcounter{CurrentQuestionPoints}
\newcommand{\checkPoints}[1]{%
    \AtEndDocument{%
        \ifthenelse{\equal{#1}{\arabic{TotalPoints}}}{}{
            \ifthen{\boolean{ShowPoints}}{
                \ClassError{mfcs}{%
                    The point values in your document sum to
                    \arabic{TotalPoints} of #1}{}%
            }%
        }%
    }%
}

\newcommand{\homework}{%
%    \problemDocument
    \showNumbers
    \showPoints
    \showDate
    \showDirections
    \renewcommand{\TheType}{Homework}
}

\newcommand{\studentname}{}

\newcommand{\makename}{
    \subsection*{Name:}
    \subsection*{Andrew ID:}
    \subsection*{15-151 Section (circle one): $\qquad\textsf{A}\qquad\textsf{B}\qquad\textsf{C}$}
    \subsection*{15-152 Section (circle one): $\qquad\textsf{A}\qquad\textsf{B}\qquad\textsf{C}\qquad\textsf{D}$}
}

\newcommand{\quiz}{
%    \problemDocument
    \showNumbers
    \showPoints
    \showDate
    \hideDirections
    \renewcommand{\TheType}{Quiz} 
    \renewcommand{\studentname}{\makename}
}

\newcommand{\TheTopic}{}
\newcommand{\topic}[1]{\renewcommand{\TheTopic}{#1}}

\NewDocumentCommand{\matchColon}{gg}{%
    #1\IfStrEq{#2}{\empty}{}{: #2}%
}
\NewDocumentCommand{\matchSpace}{gg}{%
    \IfStrEq{#2}{\empty}{}{#2 }#1%
}

\newcommand{\quickcheck}{
%    \problemDocument
    \showNumbers
    \hidePoints
    \showDate
    \hideDirections
    \renewcommand{\TheType}{\matchColon{QuickCheck}{\TheTopic}}
    \mfcsnumber{\!\!}
    \renewcommand{\studentname}{\makename}
}

\newcommand{\recitation}{
%    \problemDocument
    \hideNumbers
    \hidePoints
    \hideDate
    \hideDirections
    \renewcommand{\TheType}{\matchColon{Recitation}{\TheTopic}}
    \mfcsnumber{\!\!}
}


\newcommand{\workshop}{\recitation\showDate\renewcommand{\TheType}{\matchSpace{Workshop}{\TheTopic}}\mfcsnumber{\!\!}}
\newcommand{\proofwriting}{\recitation\showDate\renewcommand{\TheType}{\TheTopic}\mfcsnumber{\!\!}}

\newcommand{\ep}{
%    \problemDocument
    \showNumbers
    \hidePoints
    \hideDirections
    \hideDate
    \mfcsnumber{\!\!}
    \renewcommand{\TheType}{\TheTopic}
}


\newcommand{\TheEPGuru}{}
\newcommand{\epguru}[1]{\renewcommand{\TheEPGuru}{#1}}
\newcommand{\TheFinalQuestion}{
    \begin{question}[70]{Generalization}
    A group of two in your recitation spent the past week investigating this topic.  For the last 20 minutes of
    today's recitation, they will present their results to you.
    \end{question}
}

\newcommand{\presenter}{
    \showNumbers
    \showPoints
    \showDirections
    \showDate
    \renewcommand{\TheDirections}{%
    You have a week to prepare typeset solutions to this exploratory problem as well as a generalization of it.  You will be expected to
    present your generalization in recitation on the due date.  Please send a pdf with your solutions (both to the problems here and
    your generalization(s)) by \emph{midnight} the night before your presentation.
    }
    \renewcommand{\TheFinalQuestion}{%
        \begin{question}[70]{Generalization}
        Once you've solved all the other problems, choose at least one generalization of the topic you've just explored. 
        Construct and prove at least one theorem about your generalization.  \textbf{50} of the points for this problem are for
        constructing a suitable generalization; the other \textbf{20} points are for presenting this generalization to your
        recitation in the last 20 minutes of class.

        If you need help either coming up with a generalization or proving things about it, please contact this week's EP Guru,
        \textbf{\TheEPGuru}, or one of the instructors.  \textbf{\TheEPGuru} and the instructors will be available at various 
        times during the week to help with this project.  Do yourself a favor and ask \textbf{\TheEPGuru} if your generalization 
        is suitable at least a day before presenting.
        \end{question}

    }
}

\newcommand{\misc}{
%    \problemDocument
    \hideNumbers
    \hidePoints
    \hideDate
    \hideDirections
    \renewcommand{\TheNumber}{}
    \renewcommand{\TheType}{\TheTopic}
    \solutions
    \renewcommand{\TheFlavorB}{}
}

\newcommand{\warmup}{
%    \problemDocument
    \hideDate
    \setboolean{OnlyWarmup}{true}
    \renewcommand{\TheFlavorA}{ Warmup}
    \let\question\comment %Everything from the question environment should
                          %be suppressed, because they are all normal
                          %questions
}

\newcommand{\solutions}{
    \hideDirections
    \hideDate
    \setboolean{ShowSolutions}{true}
    \let\solution\solutionsave
    \renewcommand{\answerspace}[1]{}
    \renewcommand{\makename}{}
    \renewcommand{\TheFlavorB}{ Solutions}
}

\newenvironment{solution}[1][]{
    $ $\\\\
    \emph{Solution: }#1%
}

\let\solutionsave\solution

%\newcommand{\solution}[1]{%
%    \ifthen{\boolean{ShowSolutions}}{%
%        $ $\\\\
%        \textbf{Solution:} #1
%        %\vspace{-1.25ex}%
%        %\begin{indented}%
%        %\fbox{\begin{minipage}[c]{\linewidth}#1\end{minipage}}%
%        %\end{indented}%
%    }%
%}

\newcommand{\purpose}[1]{%
    \ifthen{\boolean{ShowPurpose}}{%
        \emph{Purpose:} #1
        $ $\\\\
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{TheQuestionNumber}
\newcounter{ThePartNumber}[TheQuestionNumber]

\NewDocumentEnvironment{question-base}{ o m }{%
    %\vspace{-3ex}%
    \textbf{%
        \textsf{%
            \section*{\color{colour}%
                \ifthen{\boolean{ShowNumbers}}%
                       {\arabic{TheQuestionNumber}. }#2%
                \ifthen{\boolean{ShowPoints}}{ (%
                    {#1 point\ifthenelse{\equal{#1}{1}}{}{s})}%
                }%
                \ifthen{\boolean{CategoryInTitle}}{ (\TheCategory\!\!)}}%
                \addtocounter{TheQuestionNumber}{1}%
                \setcounter{ThePartNumber}{0}%
        }%
    }%
}%


\newenvironment{warmup-question}{%
    \begin{question-base}{Warmup}{0}%
}{%
    \end{question-base}%
}

\NewDocumentEnvironment{question}{ o g }{%
    \ifthen{\boolean{StandaloneProblem}}{\begin{document}}%
    \setcounter{CurrentQuestionPoints}{0}
    \ifthenelse{\equal{-1}{\arabic{ThePointValue}}}{%
        \IfNoValueTF{#1}{%
             \ifthenelse{\boolean{ShowPoints}}{
                \ClassError{mfcs}{%
                    Question \arabic{TheQuestionNumber} does not have a point value.\MessageBreak
                    Give an optional argument: \protect\begin{question}[POINTS]{NAME}\MessageBreak
                    Or use the \protect\points\space command: \protect\points{POINTS}}{}
            }{%
            \begin{question-base}{\IfNoValueTF{#2}{\!\!\!}{#2}}%
            }
        }{%
            \setcounter{ThePointValue}{#1}%
            \begin{question-base}[#1]{\IfNoValueTF{#2}{\!\!\!}{#2}}%
        }%  
    }{%
     \begin{question-base}[\arabic{ThePointValue}]{#2}%
    }%
}{%
    \end{question-base}%
    \ifthen{\boolean{ShowPoints}}{
        \ifthenelse{\equal{\arabic{ThePartNumber}}{0}}{}{
        \ifthenelse{\equal{\arabic{ThePointValue}}{\arabic{CurrentQuestionPoints}}}{}{
            \ClassError{mfcs}{%
                 Question \arabic{TheQuestionNumber} has conflicting points values.\MessageBreak
                 The total given is \arabic{ThePointValue}.\MessageBreak
                 The total calculated is \arabic{CurrentQuestionPoints}}{}%
        }}%
        \ifthen{\boolean{ShowPoints}}{
            \addtocounter{TotalPoints}{\arabic{ThePointValue}}%
        }
    }%
    \unsetPoints%
    \ifthen{\boolean{StandaloneProblem}}{\stop}%
}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

\RenewDocumentEnvironment{part}{ g }{%
    \addtocounter{ThePartNumber}{1}%
    \ifthen{\boolean{ShowPoints}}{
        \IfNoValueT{#1}{%
            \ClassError{mfcs}{%
                 Part \arabic{ThePartNumber} does not have a point value.\MessageBreak
                 Give an optional argument: \protect\begin{part}{POINTS}\MessageBreak
                 Or switch to a document with no point values.\MessageBreak
                 The question total so far is \arabic{CurrentQuestionPoints}
                 out of \arabic{ThePointValue}}{}%
        }%
    }%
    \ifthen{\boolean{ShowPoints}}{
        \IfNoValueF{#1}{%
            \addtocounter{CurrentQuestionPoints}{#1}%
        }%
    }%
    \begin{indented}%
    \begin{enumerate}[(\arabic{ThePartNumber})]%
        \item\ifthen{\boolean{ShowPoints}}{[{#1} Point\ifthenelse{\equal{#1}{1}}{}{s}]}%
}{\end{enumerate}\end{indented}}

%\newcommand{\problemDocument}{
    \renewcommand{\TheNumber}{$-\infty$}
    \setboolean{StandaloneProblem}{false}
    \setboolean{ShowSolutions}{false}
    \let\solution\comment
    \setboolean{ShowPurpose}{false}
%}

    \hideNumbers
    \hidePoints
    \hideDate
    \hideDirections
    \renewcommand{\TheNumber}{}
    \renewcommand{\TheType}{\TheTopic}
    \renewcommand{\TheFlavorB}{}

\newcommand{\MakeHeader}[3]{%
{\color{colour} {\noindent \Large%
\textbf{\textsf{%
Invariant Generation for Complexity Analysis of Python Programs
}}%
} \vspace{-1ex} \\ \rule[1mm]{\textwidth}{.3mm} \\%
{\Large \noindent \textbf{\textsf{\TheType\;#1\TheFlavorA\TheFlavorB%
    \ifthen{\boolean{ShowDate}}{ (due #2)}}}}%
}\ifthen{\boolean{ShowDirections}}{\\\\%
\textsf{{\bf Directions}: {\sl#3}\\\\}}%
\studentname%
}

\AtBeginDocument{\MakeHeader{\TheNumber}{\TheDueDate}{\TheDirections}}

\DeclareDocumentCommand{\Pr}{ m g }{\ensuremath{\textsf{Pr}\left[#1\IfNoValueF{#2}{\;|\;#2}\right]}}
\DeclareDocumentCommand{\E}{ m g }{\ensuremath{\mathbb{E}}\left[#1\IfNoValueF{#2}{\;|\;#2}\right]}
\DeclareDocumentCommand{\Var}{ m g }{\textsf{Var}\left[#1\IfNoValueF{#2}{\;|\;#2}\right]}

\newcommand{\RAM}{\textbf{Repeat After Me:}\normalfont\;}
\newcommand{\BT}{\textbf{Basic Technique:}\normalfont\;}
\newcommand{\MT}{\textbf{Moment's Thought:}\normalfont\;}
\newcommand{\answerspace}{\vspace}


\renewcommand{\documentclass}{}
