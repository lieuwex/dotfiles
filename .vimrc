" Lieuwe Rooijakkers' vimrc
" This uses YCM as completer per default, if this is too heavy for your system
" you can set the following `use_ycm` variable to 0, which will enable
" NeoComplete instead. ( Be sure to `:PlugInstall` afterwards ).
let use_ycm = 1

set nocompatible

set shell=/bin/sh
set laststatus=2
set autoread
set timeoutlen=350 ttimeoutlen=25

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_x = ""
let g:airline_section_y = "%{airline#util#wrap(airline#parts#filetype(),0)}"

if use_ycm " YouCompleteMe
	let g:ycm_complete_in_comments = 1
	let g:ycm_autoclose_preview_window_after_completion = 0
	let g:ycm_autoclose_preview_window_after_insertion = 1
	" let g:ycm_filetype_blacklist = {
	" 			\ 'css': 1,
	" 			\ 'stylus': 1,
	" 			\ 'vim': 1,
	" 			\ 'sh': 1,
	" 			\ 'coffee': 1,
	" 			\ 'html': 1,
	" 			\ 'markdown': 1,
	" 			\ 'mustache': 1
	" 			\}
else " Neocomplete
	let g:acp_enableAtStartup = 0
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#omni#input_patterns = {}
	let g:neocomplete#sources#syntax#min_keyword_length = 2
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	set shortmess+=c

	let g:neocomplete#enable_auto_select = 0
	let g:jedi#popup_select_first = 0
	let g:jedi#auto_vim_configuration = 0
	let g:jedi#completions_enabled = 0
	let g:jedi#use_tabs_not_buffers = 1
endif

let g:UltiSnipsExpandTrigger="<c-j>"

let g:AutoPairsCenterLine = 0

let g:mma_candy = 2

let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

" Tern
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_move'

set background=dark
let g:solarized_termtrans=0
let g:solarized_termcolors=256

autocmd BufRead,BufNewFile *.script setfiletype applescript

" Syntastic
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues', 'codecheck']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1

call plug#begin('~/.vim/plugged')

if use_ycm
	Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer --gocode-completer' }
else
	Plug 'davidhalter/jedi-vim', { 'for': 'python' }
	Plug 'Shougo/neocomplete.vim' ", { 'for': ['css', 'stylus', 'vim', 'sh', 'coffee', 'html', 'markdown', 'mustache'] }
endif

Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript', 'jsx'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'regedarek/ZoomWin'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'jiangmiao/auto-pairs'
Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'mustache', 'jsx'] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install && curl --create-dirs -o ./node_modules/tern/plugin/meteor.js https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js' }
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'html', 'stylus'] }
Plug 'tpope/vim-dispatch'
Plug 'tommcdo/vim-exchange'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript', 'jsx'] }
Plug 'rsmenon/vim-mathematica', { 'for': 'mma' }
Plug 'vim-pandoc/vim-pandoc', { 'on': 'Pandoc' }
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
Plug 'zah/nimrod.vim', { 'for': 'nim' }
Plug 'sjl/gundo.vim', { 'on': ['GundoToggle', 'GundoShow'] }
Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine', { 'for': ['ruby', 'python']}
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'sh', 'vim'] }

call plug#end()

" Tab indention > space indention.
set noexpandtab
set tabstop=4
set shiftwidth=4

" COLORS.
set t_Co=256
syntax on
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
set listchars=tab:\|\             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
highlight SpecialKey ctermfg=237

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
autocmd FileType html,markdown,mustache setlocal omnifunc=htmlcomplete#CompleteTags
set formatoptions+=j " Delete comment character when joining commented lines
set ttyfast
set gdefault " Use global flag for subsitute by default
nnoremap / /\v
vnoremap / /\v

" EMOJIS 🎉
autocmd FileType gitcommit set completefunc=emoji#complete

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

nnoremap <Leader>f :Ag 

nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>n :NERDTreeToggle<cr>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

command Zen Goyo | Limelight
command Unzen Goyo | Limelight!

" yup.
command Wq wq
command Tabn tabn

" File specific settings.
autocmd FileType ruby set sw=2 ts=2 et
autocmd FileType python set sw=4 ts=4 et

augroup HiglightTODOandFIXME
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('WarningMsg', 'TODO\|FIXME', -1)
augroup END
