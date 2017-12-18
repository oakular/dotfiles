" blocks
nnoremap <Leader>inc ^i{include file=""}<Esc>^ci"
nnoremap <Leader>php ^i{php}<Enter>{/php}<Esc>O

" control flow
nnoremap <Leader>if ^i{if}<Enter>{/if}<Esc>O
nnoremap <Leader>elif ^i{if}<Enter>{elif}<Enter>{/if}<Esc>2kffli

" declarations
nnoremap <Leader>sconfv i{$smarty.config}<Esc>Tgi
