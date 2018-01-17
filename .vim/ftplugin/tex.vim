set spell

" Document outline
nnoremap <leader>doc ^i\begin{document}<Enter><Enter>\end{document}<Esc>k

" Sectioning
inoremap ;s1 <Esc>^i\section{}<Esc>i
inoremap ;s2 <Esc>^i\subsection{}<Esc>i
inoremap ;s3 <Esc>^i\subsubsection{}<Esc>i

" Text Formatting
inoremap ;bo }<Esc>bi{<Esc>i\textbf<Esc>f}a
inoremap ;i }<Esc>bi{<Esc>i\textit<Esc>f}a
inoremap ;em }<Esc>bi{<Esc>i\emph<Esc>f}a

" Lists
nnoremap <Leader>bul ^i\begin{itemize}<Enter>\item<Esc>o\end{itemize}<Esc>kA<Space>
inoremap ;numl <Esc>^i\begin{enumerate}<Enter>\item<Esc>o\end{enumerate}<Esc>kA<Space>

" Tables
inoremap ;tab <Esc>^i\begin{tabular}{}<Enter>\hline<Enter><Enter>\hline<Enter><Esc>I\end{tabular}<Esc>?begin<Enter>2f{a
inoremap ;tabc <Esc>^i\begin{center}<Enter>\begin{tabular}{}<Enter>\hline<Enter><Enter>\hline<Enter><Esc>I\end{tabular}<Enter>\end{center}<Esc>?begin<Enter>2f{a

" Packages
nnoremap <Leader>pac /documentclass/+1<Enter>o\usepackage{}<Esc>i
