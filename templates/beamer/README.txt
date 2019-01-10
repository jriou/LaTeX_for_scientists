Uni Bern Beamer Style
---------------------

A style for the LaTeX Beamer Class that allows you to create presentations
following the Uni Bern CD.

Installation
------------
Copy the files beamerthemeUniBern.sty and ublogo.pdf into the same
directory as your presentation. 

Notes
-----
Since the normal Beamer styles and Uni Bern CC design are rather different,
your Beamer presentations may need some re-working to look good with this
style. Especially the available vertical space is smaller than with most
other Beamer styles.

If you come up with some cool additions, please let us know, so that they
can be integrated in the default distribution.

Example Use
-----------
NOTE: The UniBern styl assumes your input to be in UTF8 encoding

-----
\documentclass[10pt]{beamer}
\usetheme{UniBern}
% default color is 'screen'
% use 'print' to get a white background

\title{Titel der Präsentation}
\subtitle{Untertitel}
\author{Tobias Oetiker}
\institute{Institut XY\\Universität Bern}
\date{Datum, Titel der Veranstaltung}
\begin{document}

\begin{frame}
\maketitle
\end{frame}

\begin{frame}
\frametitle{Hello World}
\begin{itemize}
\item Item One
\begin{itemize}
\item Item Sub
\end{itemize}
\end{itemize}
\end{frame}

\end{document}
------

you may also want to try the three example presentations: 
unibern-demo.tex 


Tobias Oetiker <tobi@oetiker.ch>
OETIKER+PARTNER AG
www.oetiker.ch

2018-09-06

Kontakt Uni Bern: ulrich.zwahlen@kommunikation.unibe.ch

*EOF*
