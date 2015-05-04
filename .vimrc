set nocompatible

set shell=/bin/sh
set laststatus=2
set autoread
set timeoutlen=350 ttimeoutlen=25
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:UltiSnipsExpandTrigger="<c-j>"

let g:AutoPairsCenterLine = 0

let g:mma_candy = 2

let g:OmniSharp_selector_ui = 'ctrlp'

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'regedarek/ZoomWin'
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer --gocode-completer' }
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tacahiroy/ctrlp-funky'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install && curl --create-dirs -o ./node_modules/tern/plugin/meteor.js https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js' }
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'tpope/vim-dispatch'
Plug 'tommcdo/vim-exchange'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'html', 'javascript'] }
Plug 'rsmenon/vim-mathematica', { 'for': 'mma' }
Plug 'matze/vim-move'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'othree/xml.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'wesQ3/vim-windowswap'
Plug 'junegunn/vim-emoji', { 'for': 'gitcommit' }
Plug 'sjl/gundo.vim', { 'on': ['GundoToggle', 'GundoShow'] }

call plug#end()

" Tab indention > space indention.
set noexpandtab
set tabstop=4
set shiftwidth=4

" COLORS.
set t_Co=256
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme Tomorrow-Night

" autocmd VimEnter * NERDTree | wincmd p " Auto open NERDTree.
" Clear search query results with ctrl+l.
nnoremap <silent> <C-l> :noh<CR><C-l>

" Persistent undo
set undofile
set undodir=~/.vim/undos

" List chars
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

" Remember last line location.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set noshowmode " We have airline, which already shows the current mode.
set hidden " Hidden buffers swag.
set ignorecase
set smartcase " Search case insensitive, unless I really want to.
set nowrap
let g:NERDTreeWinSize=20
set clipboard=unnamed " Use system clipboard for yanking.
let g:ctrlp_show_hidden = 1 " CTRLP: Show files starting with a dot.
"autocmd BufRead,BufNewFile *.md,*.janus,*.txt setlocal spell spelllang=en_us,nl,de_de " Set spellchecking on for text files.
autocmd BufRead,BufNewFile *.html setlocal wrap " Wrap HTML files.
autocmd BufRead,BufNewFile *.es6,*.bjsx setfiletype javascript " We need them syntax yo.
set complete+=kspell " Word completion.
set cursorline " Highlight the current line.
set scrolljump=5 " Jump some lines when scrolling the window down.
set incsearch " When searched, use current search query as a query for a subsitute.
set hlsearch
set splitright " Split to the right side when using vsplit.
set wildmenu " Autocompletion menu on ex commands.
set history=1000
set undolevels=1000
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable " CoffeeScript folding.
autocmd FileType css,stylus set omnifunc=csscomplete#CompleteCSS
set formatoptions+=j " Delete comment character when joining commented lines
set ttyfast
set gdefault " Use global flag for subsitute by default

" EMOJIS 🎉
autocmd FileType gitcommit set completefunc=emoji#complete
let g:ycm_filetype_blacklist = {
			\ 'gitcommit': 1
			\}

" funkier ctrl-p-funky.
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_syntax_highlight = 1

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

" More swag with the arrow keys
nnoremap <UP> :tabp<Cr>
nnoremap <DOWN> :tabn<Cr>
nnoremap <LEFT> :bp<Cr>
nnoremap <RIGHT> :bn<Cr>

" Hybrid line numbering.
set relativenumber
set number

" Faster ctrl-p indexing (http://stackoverflow.com/a/22784889/3142952)
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
set grepprg=ag\ --nogroup\ --nocolor

" Remap Ack to Ag.
nnoremap <Leader>f :Ag 

nnoremap <Leader>fu :CtrlPFunky<Cr>

command Zen Goyo | Limelight
command Unzen Goyo | Limelight!

" yup.
command Wq wq
command Tabn tabn
