set nocompatible

" --------------------------------------------------
" Detect OS
"
let s:is_osx = has('macunix')

let s:is_linux = has('unix') && !has('macunix') && !has('win32unix')

let s:is_windows = has('win16') || has('win32') || has('win64')
" --------------------------------------------------
" Theme
"
if has('gui_running')
    set guioptions-=m " Hide menu bar.
    set guioptions-=T " Hide toolbar
    set guioptions-=L " Hide left-hand scrollbar
    set guioptions-=r " Hide right-hand scrollbar
    set guioptions-=b " Hide bottom scrollbar
    set showtabline=0 " Hide tabline

    if s:is_windows
        " please install the font in 'Dotfiles\font'
        set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI
    elseif s:is_osx
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
    else
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
    endif
endif

" Automatic installation
if !s:is_windows
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" Use English for anything in vim
if s:is_windows
    silent exec 'lan mes en_US.UTF-8'

    " vim menu 乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "exec 'cd ' . fnameescape('d:\wamp\www')
elseif s:is_osx
    silent exec 'language en_US'
else
    let s:uname = system('uname -s')
    if s:uname ==# "Darwin\n"
        " in mac-terminal
        silent exec 'language en_US'
    elseif s:uname ==# "SunOS\n"
        " in Sun-OS terminal
        silent exec 'lan en_US.UTF-8'
    else
        " in linux-terminal
        silent exec 'lan en_US.utf8'
    endif
endif

" try to set encoding to utf-8
if s:is_windows
    " Be nice and check for multi_byte even if the config requires
    " multi_byte support most of the time
    if has('multi_byte')
        " Windows cmd.exe still uses cp850. If Windows ever moved to
        " Powershell as the primary terminal, this would be utf-8
        set termencoding=utf-8
        " Let Vim use utf-8 internally, because many scripts require this
        set encoding=utf-8
        set fileencoding=utf-8
        " Windows has traditionally used cp1252, so it's probably wise to
        " fallback into cp1252 instead of eg. iso-8859-15.
        " Newer Windows files might contain utf-8 or utf-16 LE so we might
        " want to try them first.
        set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
    endif
else
    " set default encoding to utf-8
    set encoding=utf-8
    set termencoding=utf-8
endif

" Enable 256 colors
" if $COLORTERM ==# 'gnome-terminal'
"     set t_Co=256
" endif

" --------------------------------------------------
" Vim-Plugs
"

" Check if npm installed
let g:isNpmInstalled = executable('npm')

" Specify a directory for Plugins
if s:is_windows
    call plug#begin('~/vimfiles/Plugged')
else
    call plug#begin('~/.vim/Plugged')
endif


" ------------------------------
" Mapleader
noremap <Space> <Nop>
let g:mapleader = "\<Space>"

" Make sure you use single quotes
"
" On-demand loading
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }

" Some support functions used by delimitmate, and snipmate
Plug 'vim-scripts/tlib'

" Denite resolves Unite's problems
Plug 'Shougo/denite.nvim'

" plugin for fuzzy file search, most recent files list and much more
Plug 'Shougo/unite.vim'

" This plugin provides a start screen for Vim and Neovim.
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

Plug 'editorconfig/editorconfig-vim'

" Snippets engine with good integration with neocomplcache
Plug 'Shougo/neosnippet'

" Default snippets
Plug 'honza/vim-snippets'

" Code complete
Plug 'Shougo/neocomplcache.vim'

" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it,
Plug 'Raimondi/delimitMate'

" Most recent files source for unite
Plug 'Shougo/neomru.vim'

" Yank history for unite
Plug 'Shougo/neoyank.vim'

" Exporlorer
Plug 'Shougo/vimfiler.vim'

" Undo Tree
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

" The silver searcher
Plug 'rking/ag.vim'

" colorschemes
Plug 'ajmwagar/vim-deus'

" prettier https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }


" ale
Plug 'w0rp/ale'

" TODO: Path to eslint if it not installed, then use local installation
if g:isNpmInstalled
    if !executable('eslint')
        silent ! echo 'Installing eslint' && npm -g i eslint
    endif
    if !executable('prettier-eslint')
        silent ! echo 'Installing prettier-eslint-cli' && npm -g i prettier-eslint-cli
    endif
    if !executable('jsonlint')
        silent ! echo 'Installing jsonlint' && npm -g i jsonlint
    endif
    if !executable('stylelint')
        silent ! echo 'Installing stylelint' && npm -g i stylelint
    endif
    if !executable('htmlhint')
        silent ! echo 'Installing htmlhint' && npm -g i htmlhint
    endif
endif

" Toggle comment https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim'

" Fix-up dot command behavior
Plug 'tpope/vim-repeat'

" Nice statusline/ruler for vim
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Front end Plugins
"
" Provide smart autocomplete results for javascript, and some usefull commands
if g:isNpmInstalled
    " install tern and node dependencies for tern
    " 提供强大的 JavaScript omnifunc
    Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
endif

" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Add support for vue
Plug 'posva/vim-vue', { 'for': 'vue' }

" https://github.com/mxw/vim-jsx
" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" Improved json syntax highlighting
Plug 'elzr/vim-json'

" Vim emmet https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim', { 'for':  ['html', 'css', 'less', 'sass'] }

" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Plug 'othree/html5.vim', { 'for': 'html' }

" Highlights the matching HTML tag when the cursor is positioned on a tag.
Plug 'gregsexton/MatchTag', { 'for': 'html' }

" Improve less syntax highlighting, indenting and autocompletion
Plug 'groenewege/vim-less', { 'for': 'less' }

" Add support for taltoad/vim-jadeumarkdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" quick run for py sh
Plug 'thinca/vim-quickrun', { 'for': 'python'}

Plug 'lilydjwg/colorizer'

" Initialize Plugin system
call plug#end()


" --------------------------------------------------
"  Plugins
" ------------------------------

" Hotkey for open window with most recent files
nnoremap <silent><leader>m :<C-u>Denite file_mru<CR>

nnoremap <silent><leader>h :Denite neoyank<CR>

nnoremap <silent><leader>r :Denite -resume<CR>

" Unite-grep
nnoremap <silent><leader>/ :Denite grep<CR>

" Change mappings.
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)

" Change matchers.
call denite#custom#source(
            \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
            \ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
            \ 'file/rec', 'sorters', ['sorter/sublime'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
            \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" ------------------------------
" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
endif

" let g:airline_theme='wombat'
" let g:airline_theme='deus'

" Tabline
let g:airline#extensions#tabline#enabled=1
" Display only filename in tab
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

" delete current windows
nnoremap <silent> <leader><leader> :<C-u>bd<CR>

" ------------------------------
" Prettier
" Disable auto formatting of files that have @format tag
" let g:prettier#autoformat = 0
"
" " max line lengh that prettier will wrap on
" let g:prettier#config#print_width = 80
"
" " number of spaces per indentation level
" " let g:prettier#config#tab_width = 2
" let g:prettier#config#tab_width = 4
"
" " use tabs over spaces
" let g:prettier#config#use_tabs = 'false'
"
" " print semicolons
" "let g:prettier#config#semi = 'false'
" let g:prettier#config#semi = 'true'
"
" " single quotes over double quotes
" let g:prettier#config#single_quote = 'true'
"
" " none|es5|all
" let g:prettier#config#trailing_comma = 'none'

nnoremap <silent><c-f> :PrettierAsync<CR>

" ------------------------------
" ale
" show errors or warnings in airline
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'json': ['jsonlint'],
            \'css': ['stylelint'],
            \'less': ['stylelint'],
            \'html': ['htmlhint'],
            \}
let g:ale_fixers = {
           \'javascript': ['prettier-eslint'],
           \}

nmap <silent> ]] <Plug>(ale_previous_wrap)
nmap <silent> [[ <Plug>(ale_next_wrap)


" ------------------------------
" Vimfiler

let g:vimfiler_as_default_explorer = 1

call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 40,
            \ 'winminwidth' : 40,
            \ 'toggle' : 1,
            \ 'columns' : 'type',
            \ 'auto_expand': 1,
            \ 'direction' : 'rightbelow',
            \ 'parent': 0,
            \ 'explorer_columns' : 'type',
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
            \ })

let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.svn$', '\.ppt$',
            \ '^\.DS_Store$', 'node_modules']

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

if s:is_windows
    " Use trashbox.
    " Windows only and require latest vimproc.
    let g:unite_kind_file_use_trashbox = 1
endif

nnoremap <silent> <F3> :<C-u>VimFilerBufferDir -split -simple -no-quit<CR>
nnoremap <silent> <F2> :<C-u>VimFilerBufferDir -split -simple -no-quit<CR>
nnoremap <silent> <F4> :<C-u>VimFilerBufferDir -split -simple -no-quit<CR>


" ------------------------------
"  Startify
let g:startify_custom_header_quotes = [
    \ ["曾经沧海难为水，除却巫山不是云。","","----元稹《离思五首·其四》"],
    \ ["溪云初起日沉阁，山雨欲来风满楼。","","----许浑《咸阳城东楼 / 咸阳城西楼晚眺 / 西门》"],
    \ ["行到水穷处，坐看云起时。","","----王维《终南别业 / 初至山中 / 入山寄城中故人》"],
    \ ["云想衣裳花想容，春风拂槛露华浓。","","----李白《清平调·其一》"],
    \ ["天平山上白云泉，云自无心水自闲。","","----白居易《白云泉》"],
    \ ["纸上得来终觉浅，绝知此事要躬行。","","----陆游《冬夜读书示子聿》"],
    \ ["枕上诗书闲处好，门前风景雨来佳。","","----李清照《摊破浣溪沙·病起萧萧两鬓华》"],
    \ ["夜月一帘幽梦，春风十里柔情。","","----秦观《八六子·倚危亭》"],
    \ ["黄河远上白云间，一片孤城万仞山。","","----王之涣《凉州词二首·其一》"],
    \ ["卧看满天云不动，不知云与我俱东。","","----陈与义《襄邑道中》"],
    \ ["乱花渐欲迷人眼，浅草才能没马蹄。","","----白居易《钱塘湖春行》"],
    \ ["远上寒山石径斜，白云生处有人家。","","----杜牧《山行》"],
    \ ["闲云潭影日悠悠，物换星移几度秋。","","----王勃《滕王阁序》"],
    \ ["月下飞天镜，云生结海楼。","","----李白《渡荆门送别》"],
    \ ["只在此山中，云深不知处。","","----贾岛《寻隐者不遇 / 孙革访羊尊师诗》"],
    \ ["人面不知何处去，桃花依旧笑春风。","","----崔护《题都城南庄》"],
    \ ["春悄悄，夜迢迢。碧云天共楚宫遥。","","----晏几道《鹧鸪天·小令尊前见玉箫》"],
    \ ["云无心以出岫，鸟倦飞而知还。","","----陶渊明《归去来兮辞·并序》"],
    \ ]

let g:startify_custom_footer =
            \ ['', "   多喝水", "   选班次", "   要打卡", "   写周报", '']

map <leader>s :SSave<CR>
map <leader>d :SDelete<CR>

" ------------------------------
"  Undo Tree
nnoremap <silent> <F5> :UndotreeToggle<CR>

" ------------------------------
" neocomplcache

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1

" Max items in code-complete
let g:neocomplcache_max_list = 10

" Max width of code-complete window
let g:neocomplcache_max_keyword_width = 80

" Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1

" Auto select first item in code-complete
let g:neocomplcache_enable_auto_select = 1

" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1

" Smart tab Behavior
function! CleverTab()
    " If autocomplete window visible then select next item in there
    if pumvisible()
        return "\<C-n>"
    endif
    " If it's begining of the string then return just tab pressed
    let l:substr = strpart(getline('.'), 0, col('.') - 1)
    let l:substr = matchstr(l:substr, '[^ \t]*$')
    if strlen(l:substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " If not begining of the string, and autocomplete popup is not visible
        " Open this popup
        return "\<C-x>\<C-u>"
    endif
endfunction

inoremap <expr><TAB> CleverTab()

" Undo autocomplete (a little weird)
inoremap <expr><C-e> neocomplcache#undo_completion()

" For cursor moving in insert mode
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" disable preview in code complete
set completeopt-=preview


" ------------------------------
" delimitMate
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
au FileType mail let b:delimitMate_autoclose = 0


" ------------------------------
" Tern_for_vim

let tern_show_signature_in_pum = 1

" Find all refs for variable under cursor
nmap <silent> <leader>tr :TernRefs<CR>

" Smart variable rename
nmap <silent> <leader>tn :TernRename<CR>

" ------------------------------
" neosnippets

" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
if s:is_windows
    let g:neosnippet#snippets_directory='~/vimfiles/plugged/vim-snippets/snippets'
else
    let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
endif

" Disables standart snippets. We use vim-snippets bundle instead
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" Expand snippet and jimp to next snippet field on Enter key.
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"


" Javascript libraries syntax
let g:used_javascript_libs = 'jquery,angular,angularuirouter,requirejs,underscore,vue,react'

" ------------------------------
" Markdown
" Disable folding for
let g:vim_markdown_folding_disabled = 1


" ------------------------------
" vim quick run
let g:quickrun_config = {
            \   "_" : {
            \       "outputter" : "message",
            \   },
            \}

let g:quickrun_no_default_key_mappings = 1
map <F10> :QuickRun<CR>


" --------------------------------------------------
" Basic
"
" show number
set relativenumber
set number

" set fill char
hi VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│

" hide cmd
set noshowcmd

" Turn off Vim's paging so there will be no ' More ' prompts
set nomore

"set spell spelllang=en_us,cjk

" ------------------------------
" Format related
" auto break at column 78
set textwidth=78

" not break word
set linebreak

" support Asian language
" m: can break between two Chinese word
" B: not padding space between two Chinese word when concating two line
set formatoptions+=mB

" Don't redraw while executing macros (good performance config)
set lazyredraw

" ------------------------------

" 设置新文件的<EOL>格式
set fileformat=dos
" set fileformat=unix
" 给出文件的<EOL>格式类型
set fileformats=dos
" set fileformats=unix
" set fileformats=unix,dos,mac

" ------------------------------
" No fold enable
set foldmethod=indent
set foldlevelstart=20

set showmatch
set matchtime=0
set ruler

set showmode

set laststatus=2

" enable mouse in normal and visual mode
set mouse=nv

" Hide buffers instead of closing them
" Allow buffer switching without saving
set hidden

set ttimeout
set ttimeoutlen=50

" ------------------------------
" Search related
" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable higlighting search result on Enter key
nnoremap <silent> <leader>hl :nohlsearch<cr>

" Show matching brackets
set showmatch


" --------------------------------------------------
" Edit
"
" ------------------------------
" Tab
"Indent 4 space
set shiftwidth=4
" Set the width of tab to 4 space
set tabstop=4
" Replace tab with space
set expandtab
" Backspace delete 4 space
set smarttab

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l


" ------------------------------
" Patse from clippboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" ------------------------------
" Replace
" type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s/<C-R><C-W>\>//gc<LEFT><LEFT><LEFT>
"vmap S :'<,'>s///gc<LEFT><LEFT><LEFT>

" ------------------------------
" Auto reload changed files
set autoread

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" ------------------------------
" Wildmenu
" Extended autocmpletion for commands
set wildmenu
set wildmode=longest,list,full
"menuone: show the pupmenu when only one match
" disable preview scratch window,
set completeopt=menu,menuone,longest
" h: 'complete'
set complete=.,w,b,u,t
" limit completion menu height
set pumheight=15
set wildignorecase

" --------------------------------------------------
"
" Move
map 0 ^

" Set 7 lines to the cursor
set scrolloff=7

" Hightlighting that moves with the cursor
set cursorline

" Treat lone lines as break lines
map j gj
map k gk

" Moving Between Windows
nnoremap <Tab> <C-w>w

" --------------------------------------------------
"  Windows Leader
"
" Split window
nnoremap <silent> sv :<C-u>split<CR>
" Vsplit window
nnoremap <silent> sg :<C-u>vsplit<CR>
" Open a new tab
" bascially we don't use tab in vim
"nnoremap <silent> st :<C-u>tabnew<CR>
" Close other windows
nnoremap <silent> so :<C-u>only<CR>
"nnoremap <silent> sq :<C-u>close<CR>


" --------------------------------------------------
" Backup
" autoread
set autoread

" backup
set backup
set undofile
set undolevels=1000
let g:data_dir = $HOME . '/.data/'
let g:backup_dir = g:data_dir . 'backup'
let g:swap_dir = g:data_dir . 'swap'
let g:undo_dir = g:data_dir . 'undofile'
if finddir(g:data_dir) ==# ''
    silent call mkdir(g:data_dir)
endif
if finddir(g:backup_dir) ==# ''
    silent call mkdir(g:backup_dir)
endif
if finddir(g:swap_dir) ==# ''
    silent call mkdir(g:swap_dir)
endif
if finddir(g:undo_dir) ==# ''
    silent call mkdir(g:undo_dir)
endif
unlet g:backup_dir
unlet g:swap_dir
unlet g:data_dir
unlet g:undo_dir
set undodir=$HOME/.data/undofile
set backupdir=$HOME/.data/backup
set directory=$HOME/.data/swap
set nowritebackup


" --------------------------------------------------
" Theme
"
syntax enable
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme deus
let g:deus_termcolors=256


" --------------------------------------------------
" cmder on windows
"
" if s:is_windows && !has('gui_running') && !empty($CONEMUBUILD)
"     " cmder 开启 256 颜色
"     set term=xterm
"     set t_Co=256
"     let &t_AB="\e[48;5;%dm"
"     let &t_AF="\e[38;5;%dm"
"     " 修正 cmder 下的 backspace
"     inoremap <Char-0x07F> <BS>
"     nnoremap <Char-0x07F> <BS>
" endif

" --------------------------------------------------
" Ignore compiled files
"
set wildignore=*.o,*~,*.pyc
if s:is_windows
    set wildignore+=*/.git/*,*/.svn/*,*/.idea/*,*/.hg/*,*/.svn/*,*/.DS_Store,*.min.*
else
    set wildignore+=.git\*,.hg\*,.svn\*,.idea\*,.svn\*,*.min.*
endif


" --------------------------------------------------
" Display options
"
" Hide showmode
set noshowmode

" Show file name in window title
set title

" Mute error bell
set novisualbell


" --------------------------------------------------
"  webpack 建议禁用 安全写入 功能
"
set backupcopy=yes


" --------------------------------------------------
" Autocmd
"
" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has('autocmd')
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
        " Delete any previosly defined autocommands
        au!
        if has('gui_running')
            " Maximize GVim window size
            au GUIEnter * simalt ~x
        endif

        " automatically remove trailing whitespace before write
        au BufWritePre * %s/\s\+$//e

        " Save everything on focus lost
        :au FocusLost * :wa

        " Auto reload vim after your cahange it
        " au! Bufwritepost $MYVIMRC nested source $MYVIMRC

        " Return to last edit position when opening files (You want this!)
        au BufReadPost * if line("'\"") > 1 && line("'\"")
                    \ <= line("$") | exe "normal! g'\"" | endif

        " Automatically change the current directory
        au BufEnter * silent! lcd %:p:h

        au FileType html setl tw=0

        " Enable omni completion.
        "
        au FileType python set omnifunc=pythoncomplete#Complete
        au FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
        au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        au FileType vue syntax sync fromstart

        au FileType vimfiler setlocal nonumber
        au FileType vimfiler setlocal norelativenumber

        au FileType javascript nnoremap <silent><c-a> :ALEFix<CR>
    augroup END
endif
