let g:vimtex_view_method = 'zathura'

" Use latexmk for compilation.
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Enable automatic compilation on save.
let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \],
    \}
