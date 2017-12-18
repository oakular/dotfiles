" Text Formatting
inoremap ;p <p></p><Esc>F<i
inoremap ;em <em></em><Esc>F<i
inoremap ;b <b></b><Esc>F<i
inoremap ;i <i></i><Esc>F<i

" Lists
inoremap ;ol <ol><Enter></ol><Esc>F<O
inoremap ;ul <ul><Enter></ul><Esc>F<O
inoremap ;li <li></li><Esc>F<i

" Links
inoremap ;a <a href=""></a><Esc>F"i
inoremap ;at <a href=""></a><Esc>F<i

" HTML Headings
inoremap ;h1 <h1></h1><Esc>F<i
inoremap ;h2 <h2></h2><Esc>F<i
inoremap ;h3 <h3></h3><Esc>F<i
inoremap ;h4 <h4></h4><Esc>F<i
inoremap ;h5 <h5></h5><Esc>F<i
inoremap ;h6 <h6></h6><Esc>F<i

" Scripting Languages
inoremap ;sc <script><Enter></script><Esc>F<O
inoremap ;php <?php ?><Esc>Tpi

" Boilerplate
inoremap ;boil <!DOCTYPE html><Enter><Enter><html><Enter><Enter><head><Enter><title>Boilerplate</title><Enter><meta charset="UTF 8"><Enter><Esc>i</head><Enter><Enter><body><Enter></body><Esc>gg^
