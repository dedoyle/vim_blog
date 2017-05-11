```
if has("win32")
    " Maximize GVim window size
    autocmd GUIEnter * simalt ~x

    " windows7 tabline number fix
    let g:spacevim_buffer_index_type = 4
endif

" global settings {{{

" save everything on focus lost
:au FocusLost * :wa

filetype plugin indent on
syntax enable
setlocal foldmethod=indent
let b:javascript_fold=1 " open folding
let javascript_enable_domhtmlcss=1 " enable dom html css highlight
let g:spacevim_max_column = 80
let mapleader = "\,"
let g:spacevim_unite_leader = "<F4>"
let g:spacevim_enable_vimfiler_welcome = 0
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^\.svn$', '^\.idea', 'node_modules']


map 0 ^
map <F5> :VimFilerBufferDir -explorer<cr>
" }}}

" project directory {{{
exec 'cd ' . fnameescape('d:\wamp\www')
set autochdir
" }}}

" layer {{{
call SpaceVim#layers#load('lang#javascript')
" }}}

" plugins {{{

" custom
"let g:spacevim_custom_plugins = [
"              \ ['plasticboy/vim-markdown', 'on_ft' : 'markdown'],
"              \ ['wsdjeg/GitHub.vim'],
"              \ ]
let g:spacevim_custom_plugins = [
              \ ['sts10/vim-zipper'],
              \ ]

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,less EmmetInstall

" jsctags
let g:tagbar_ctags_bin = 'C:\ctags58\ctags.exe'
set tags=d:\tags
map <C-F12> :!ctags -R -f d:\tags d:\wamp\www\static\javascripts\modules<CR>

" js beautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" javascript libraries syntax
"let g:used_javascript_libs = 'jquery,angular,angularuirouter,requirejs,underscore'

" }}}
```
