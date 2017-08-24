setlocal indentexpr=    " diable auto indentation
set dictionary=/usr/share/dict/words
set complete+=k
set spell
setlocal omnifunc=syntaxcomplete#Complete

inoremap ;it <ESC>o\item<Space>
inoremap ;e <Space>\emph{}<ESC>i
inoremap ;b <Space>\textbf{}<ESC>i
inoremap ;i <Space>\textit{}<ESC>i

noremap sec <ESC>o\section{}<ESC>i
noremap secb <ESC>o\subsection{}<ESC>i
noremap subb <ESC>o\subsubsection{}<ESC>i
