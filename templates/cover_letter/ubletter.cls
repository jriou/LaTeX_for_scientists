% File ubletter.cls, Package: ubletter
% Version 1.2 2016-06-24

% In diesem File wird das Layout des Briefes definiert.
% Normalerweise sind hier keine Änderungen nötig!

%Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ubletter}[2016/06/14 v1.2 Letter Class for University of Bern]

% author: Martin Schmid (ITP), schmidm@itp.unibe.ch
% adjustments: Thomas Schweizer (IMSV), thomas@imsv.unibe.ch
% further enhancements by Marco Robertini (ID), robertini@id.unibe.ch
% updates Tobias Oetiker (O+P), tobi@oetiker.ch

\typeout{Document class 'ubletter' for official letters in the layout of}
\typeout{the University of Bern}

%Initialization
%Remark: The Package ifthen is required by the command \newboolean
\RequirePackage{ifthen}
\newboolean{@color}
\setboolean{@color}{false}
\newboolean{@faxmode}
\setboolean{@faxmode}{false}
\newdimen\leftfield
\newdimen\rightfield
\newdimen\openleftfield
\newdimen\openrightfield
\newdimen\leftfootfield
\newdimen\rightfootfield
\newdimen\fullwidthopen
\newdimen\fullwidthcont
\newdimen\boxseparation
\newcommand{\@letterlang}{0}
\newcommand{\@letteruser}{0}

%Declaration

\DeclareOption{english}{\renewcommand{\@letterlang}{0}}
\DeclareOption{german}{\renewcommand{\@letterlang}{1}}
\DeclareOption{french}{\renewcommand{\@letterlang}{2}}
\DeclareOption{italian}{\renewcommand{\@letterlang}{3}}
\DeclareOption{personal}{\renewcommand{\@letteruser}{0}}
\DeclareOption{institute}{\renewcommand{\@letteruser}{1}}
\DeclareOption{color}{\setboolean{@color}{true}}
\DeclareOption{fax}{\setboolean{@faxmode}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

%Execution
\ProcessOptions

%Needed additional files
\LoadClass[a4paper]{letter}
\RequirePackage{graphicx}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{iftex}
\RequirePackage{moreverb}
\RequirePackage{calc}

\ifPDFTeX
    \RequirePackage[utf8]{inputenc}
\fi

\renewcommand{\familydefault}{phv}

\newif\ifWriteUbletter
\IfFileExists{ubletter.clo}{\WriteUbletterfalse}{\WriteUblettertrue}

\ifWriteUbletter
\begin{verbatimwrite}{ubletter.clo}
% File: ubletter.clo, Package: ubletter
% Version 1.2 2016-06-24

%%% REMOVE THE FOLLOWING LINE AFTER CUSTOMIZIG
\PackageError{ubletter}{You have not customized ubletter.clo}{Edit ubletter.clo to your taste and then remove this error message.}
%%%

% Personal settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\person{Mein Name}

\newcommand{\letterPersonal}{
  \def\mystreet{Strasse}
  \def\telnum{+41 31 NNN NN NN}
  \def\mobilenum{+41 79 NNN NN NN}
  \def\email{mail@mail.unibe.ch}
  \def\web{www.server.unibe.ch/person}
  \def\plz{3012}
}

% Lab settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\letterInstitute}{
  \def\mystreet{Strasse}
  \def\telnum{+41 31 NNN NN NN}
  \def\email{institut@server.unibe.ch}
  \def\web{www.server.unibe.ch}
  \def\plz{3012}
}

% Language sensitive settings %%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\letterGerman}{
   \def\faculty{Meine Fakultät}
   \def\dept{Mein Departement}
   \def\institute{Mein Institut}
   \def\location{Bern}
   \def\addressline{\dept, \institute, \mystreet, \plz \ \location}
   \def\job{Meine Funktion}
   \def\sign{Meine Unterschrift}
}

\newcommand{\letterEnglish}{
    \def\faculty{My Faculty}
    \def\dept{My Department}
    \def\institute{My Lab}
    \def\location{Bern}
    \def\addressline{\dept, \institute, \mystreet, \plz \ \location}
    \def\job{My Job}
    \def\sign{My Signature}
}

\newcommand{\letterFrench}{
    \def\faculty{Ma Faculté}
    \def\dept{Mon Departement}
    \def\institute{Ma Laboratoire}
    \def\location{Bern}
    \def\addressline{\dept, \institute, \mystreet, \plz \ \location}
    \def\job{Ma Fonction}
    \def\sign{Ma Signature}
}

\newcommand{\letterItalian}{
    \def\faculty{Mia Facoltà}
    \def\dept{Mio Diparimento}
    \def\institute{Mio Instituto}
    \def\location{Berna}
    \def\addressline{\dept, \institute, \mystreet, \plz \ \location}
    \def\job{La mia Funzione}
    \def\sign{La mia Firma}
}
\end{verbatimwrite}
\fi

\input{ubletter.clo}

% -- Main part --

\def\privaddr#1{\def\@addr{#1}}
\def\@addr{\mystreet\\ \plz \  \location}
\def\privtel#1{\def\@tel{#1}}
\def\@tel{\telephonenum}
\def\privmail#1{\def\@email{#1}}
\def\@fax{\fax}
\def\@email#1{\@inet{#1}}
\def\@inet{}

%selection of user
\ifcase \@letteruser
    \letterPersonal
\or
    \letterInstitute
\fi

\def\subjectname{}
\def\faxname{FAX}

%selection of the language
\ifcase \@letterlang
    \RequirePackage[USenglish]{babel}
    \def\ub@phone{Phone~}
    \def\ub@mobile{Mobile~}
    \def\ub@fax{Fax~}
    \def\ub@pages{Pages (including cover sheet)~}
    \def\ub@from{From~}
    \def\ub@date{Date~}
    \def\ub@ch{Switzerland}
    \letterEnglish
\or
    \RequirePackage[german]{babel}
    \def\ub@phone{Telefon~}
    \def\ub@mobile{Mobile~}
    \def\ub@fax{Fax~}
    \def\ub@pages{Seiten (inkl.~Deckblatt)~}
    \def\ub@from{Von~}
    \def\ub@date{Datum~}
    \def\ub@ch{Schweiz}
    \letterGerman
\or
    \RequirePackage[french]{babel}
    \def\ub@phone{Tél~}
    \def\ub@mobile{Mobil~}
    \def\ub@fax{Fax~}
    \def\ub@pages{Pages (compris couverture)~}
    \def\ub@from{De~}
    \def\ub@date{Date~}
    \def\ub@ch{Suisse}
    \letterFrench
\or
    \RequirePackage[italian]{babel}
    \def\ub@phone{tel.~}
    \def\ub@mobile{mob.~}
    \def\ub@fax{fax.~}
    \def\ub@pages{pagines (con copertina)~}
    \def\ub@from{di~}
    \def\ub@date{data~}
    \def\ub@ch{Svizzera}

    \letterItalian
\fi

% Variable conversion to letter class
\ifthenelse{\@letteruser=0}{\name\person}{}
\telephone{\telnum}
\signature{\sign}
\renewcommand*{\@inet}{\email}

% Set paper size according to letter size
\setlength{\textwidth}{155mm}
\setlength{\oddsidemargin}{30mm}
\setlength{\evensidemargin}{30mm}
\setlength{\marginparwidth}{22.5mm}

% Other measures to be defined
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\leftfield}{70mm}
\setlength{\rightfield}{45mm}
\setlength{\openleftfield}{70mm}
\setlength{\openrightfield}{45mm}
\setlength{\leftfootfield}{40mm}
\setlength{\rightfootfield}{93mm}
\setlength{\fullwidthopen}{168mm}
\setlength{\fullwidthcont}{160.4mm}
\setlength{\textheight}{225mm}
\setlength{\headsep}{0mm}
\setlength{\topskip}{0mm}
\setlength{\footskip}{12mm}
\boxseparation=\fullwidthopen
   \advance\boxseparation by -\leftfield
   \advance\boxseparation by -\rightfield

\newcommand{\@specmail}{}
\newcommand{\specmail}[1]{\renewcommand{\@specmail}{#1}}
\newcommand*{\@subject}{}
\newcommand*{\subject}[1]{\renewcommand*{\@subject}{\fontfamily{phv}\ifthenelse{\boolean{@faxmode}}{\fontsize{9}{10}}{\fontsize{8}{10}}\selectfont\subjectname\bfseries#1}}
\newcommand{\to@label}[2]{\parbox[t][39mm][t]{\leftfield}{%
    \ifthenelse{\equal{\@specmail}{}}{#1\\#2}
    {\underline{\@specmail}\\[1ex]#1\\#2}}}

\let\address\@undefined
\let\fromaddress\@undefined
%ensure the layout of the header
\let\@texttop=\relax
\def\fullrule#1{\rule{\fullwidthopen}{#1}}

% Definition of elements used in both private and official letter version
\newcommand{\refbox}{%
  \fontsize{9}{10}\selectfont
  \newbox\ubEmpty
  \setbox\ubEmpty\vbox{\makebox[\fullwidthopen][l]{}}
  \ifthenelse{\lengthtest{\ht0>\z@}}{%
    \vspace{.5\parskip}\vbox{\ubEmpty\vspace{-5mm}\fullrule{0.2pt}\par\noindent\vspace{9mm}\@subject}%
  }{%
    \vbox{\@subject}%
  }%
}

\def\mainfoot{}

\def\conthead{}

\def\contfoot{\fontfamily{phv}\fontsize{8}{10}\selectfont\raggedright\pagename\
  \thepage}

\def\mainhead{%
  \setlength{\unitlength}{1mm}
  \begin{picture}(-2,0)
    \ifthenelse{\boolean{@faxmode}}{
        \put(-1,28){\fontfamily{phv}\fontsize{24}{24}\selectfont\textbf{Fax}}
    }{}
    \put(0,-212){\parbox[t][24mm][t]{\fullwidthopen}{%
        \fontfamily{phv}\ifthenelse{\boolean{@faxmode}}{\fontsize{8.0}{10.0}}{\fontsize{6.7}{8.43}}\selectfont
        \ifthenelse{\boolean{@faxmode}}{\vspace*{-6mm}}{}
        \raggedleft
        \parbox[t][24mm][t]{45mm}{%
          \ifx\fromname\@empty \else \fromname\\ \fi
          {\ifthenelse{\@letteruser=0}
              {\ifx\job\@empty \else \job\\ \fi}
              {}
          }
          \mystreet\\
          \plz \  \location\\
          \ub@ch
        }%
        \hspace{3mm}%
        \parbox[t][24mm][t]{45mm}{%
          \ifx\telephonenum\@empty \else \ub@phone \telephonenum\\ \fi
          \ifx\mobilenum\@empty \else \ub@mobile \mobilenum\\ \fi
          \ifx\@inet\@empty \else \@inet\\ \fi
          \ifx\web\@empty \else \web \fi
        }
      }
    }
  \end{picture}
  \parbox[b][44mm][t]{\fullwidthopen}{%
    \parbox[t][41mm][t]{\leftfield}{\ifthenelse{\boolean{@faxmode}}{~}{%
      \fontfamily{phv}\fontsize{7.0}{7.0}\selectfont
      \underline{\addressline}
    }}%
    \hspace{\boxseparation}%
    \parbox[t][44mm][t]{\rightfield}{%
      \ifthenelse{\boolean{@faxmode}}{\vspace*{-9mm}}{}
      \ifthenelse{\boolean{@color}}
        {\includegraphics[width=45mm]{ub_16pt-cmyk}}
        {\includegraphics[width=45mm]{ub_16pt-bl}}
    }
  }
}

% to-adress box
\def\openleftbox{%
  \parbox[t][][t]{\openleftfield}{
    \vspace{-3mm}
    \fontfamily{phv}\fontsize{8.0}{11.0}\selectfont
    \to@label \toname\toaddress
    \par
    \location, \@date
  }
}

\def\openleftboxFax{%
  \parbox[t][][t]{\openleftfield}{
    \vspace{-8.5mm}
    \fontfamily{phv}\fontsize{9.0}{19.0}\selectfont
    \to@label \toname\toaddress
    \par
    \vspace{6.5mm}
    \parbox[t][][t]{\openleftfield}{
        \textbf{\ub@date} \location, \@date \\
        \textbf{\ub@pages} \underline{\hspace*{1cm}}\par\vspace*{1cm}
    }%
    \makebox[0pt]{\hspace{7.9cm}\parbox[t][][t]{\openleftfield}{
      \ifx\person\@empty\else\textbf{\ub@from} \person\\ \fi
      \textbf{\ub@phone} \telnum
    }}
  }\hspace*{\boxseparation}%
}

\def\openrightbox{%
  \parbox[t][][t]{\openrightfield}{%
    \ifthenelse{\boolean{@faxmode}}{\vspace{-9mm}}{\vspace{+2mm}}
    \fontfamily{phv}\fontsize{8.0}{10.0}\selectfont
    \faculty\par\vspace{+5pt}
    \ifx\dept\@empty \else \dept\par\vspace{+5pt} \fi
    \raggedright\bfseries\institute
   }
}

\def\conthead{%
  \parbox[b][42mm][t]{\fullwidthcont}{
    \raggedleft{
      \ifthenelse{\boolean{@color}}%
        {\includegraphics[width=37.4mm]{ub_16pt-cmyk}}
        {\includegraphics[width=37.4mm]{ub_16pt-bl}}
    }
  }
}

% layout of the first page
\def\ps@firstpage{%
  \def\@oddhead{\hbox to\textwidth{\mainhead\hss}}
  \def\@oddfoot{\hbox to\textwidth{\mainfoot\hss}}
  \setlength{\topmargin}{21mm}
  \setlength{\headheight}{44mm}
}

% layout of the following pages
\def\ps@headings{%
  \def\@oddhead{\hbox to\textwidth{\conthead\hss}}
  \def\@oddfoot{\hbox to\textwidth{\contfoot\hss}}
  \let\@evenhead=\@oddhead
  \let\@evenfoot=\@oddfoot
  \setlength{\topmargin}{8mm}
  \setlength{\headheight}{42mm}
}

\ps@headings

% Definition of conserved quantities not being part of the header
\def\date#1{\def\@date{#1}}
\def\@date{\today}

\def\opening#1{%
  \thispagestyle{firstpage}
  \hbox to\textwidth{\hbox
  to\fullwidthopen{\vbox{\ifthenelse{\boolean{@faxmode}}{\openleftboxFax}{\openleftbox\hspace{\boxseparation}}\openrightbox\par
      \vspace{11mm}
      \vspace{-10pt}
      \refbox}}\hss}
  \vspace{11mm} % letter body
  \vspace{-20pt}\fontfamily{phv}\fontsize{10}{14.85}\selectfont#1\par
  \vspace{\parskip}\nobreak\pagegoal198mm
}

\long\def\closing#1{%
  \par\nobreak\vspace{\parskip}
  \stopbreaks \noindent
  \parbox{\openleftfield}{\raggedright
  \ignorespaces #1\\[4\medskipamount]
  \ifthenelse{\equal{\fromsig}{}}{\name}{\fromsig}
  \strut}\par
}

\RequirePackage{enumitem}
\RequirePackage{amssymb}
\newlist{checklist}{itemize}{2}
\setlist[checklist]{label=$\square$,leftmargin=2.2ex,after=\vspace{4ex}}
\RequirePackage{pifont}
\newcommand{\pickThis}{\rlap{$\square$}{\raisebox{2pt}{\large\hspace{1pt}\ding{51}}}\hspace{-2.5pt}}

% end
