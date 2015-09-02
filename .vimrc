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
set updatetime=250

let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_x = ""
let g:airline_section_y = "%{airline#util#wrap(airline#parts#filetype(),0)}"

if use_ycm " YouCompleteMe
	let g:ycm_complete_in_comments = 1
	let g:ycm_autoclose_preview_window_after_completion = 0
	let g:ycm_autoclose_preview_window_after_insertion = 1
	let g:ycm_confirm_extra_conf = 0
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

	" Called once right before you start selecting multiple cursors
	function! Multiple_cursors_before()
		if exists(':NeoCompleteLock') == 2
			exe 'NeoCompleteLock'
		endif
	endfunction

	" Called once only when the multiple selection is canceled (default <Esc>)
	function! Multiple_cursors_after()
		if exists(':NeoCompleteUnlock') == 2
			exe 'NeoCompleteUnlock'
		endif
	endfunction

	let g:neocomplete#enable_auto_select = 0
	let g:jedi#popup_select_first = 0
	let g:jedi#auto_vim_configuration = 0
	let g:jedi#completions_enabled = 0
	let g:jedi#use_tabs_not_buffers = 1
endif

let g:UltiSnipsExpandTrigger="<c-j>"
let g:snips_author = "Lieuwe Rooijakkers"

let g:AutoPairsCenterLine = 0

let g:mma_candy = 2

let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

" Tern
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

set background=dark
let g:solarized_termtrans=0
let g:solarized_termcolors=256

autocmd BufRead,BufNewFile *.script setfiletype applescript

" Syntastic
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues', 'codecheck']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1

let g:incsearch#emacs_like_keymap = 1

let g:CoffeeAutoTagFile = '~/.vimtags'
let g:CoffeeAutoTagIncludeVars = 1
let g:CoffeeAutoTagTagRelative = 0

let g:tagbar_left = 1
let g:tagbar_width = 30

let g:tagbar_type_rust = {
	\ 'ctagstype' : 'rust',
	\ 'kinds' : [
		\'T:types,type definitions',
		\'f:functions,function definitions',
		\'g:enum,enumeration names',
		\'s:structure names',
		\'m:modules,module names',
		\'c:consts,static constants',
		\'t:traits,traits',
		\'i:impls,trait implementations',
	\]
\}
let g:tagbar_type_markdown = {
	\'ctagstype' : 'markdown',
	\'kinds' : [
		\'h:Heading_L1',
		\'i:Heading_L2',
		\'k:Heading_L3'
	\]
\}

call plug#begin('~/.vim/plugged')

if use_ycm
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --omnisharp-completer --gocode-completer' }
else
	Plug 'davidhalter/jedi-vim', { 'for': 'python' }
	Plug 'Shougo/neocomplete.vim' ", { 'for': ['css', 'stylus', 'vim', 'sh', 'coffee', 'html', 'markdown', 'mustache'] }
endif

Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarToggle', 'TagbarOpen'] }
Plug 'lukaszkorecki/CoffeeTags', { 'for': 'coffee', 'do': 'gem install CoffeeTags' }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'regedarek/ZoomWin'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'mustache', 'javascript.jsx'] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
Plug 'marijnh/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install && curl --create-dirs -o ./node_modules/tern/plugin/meteor.js https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js && cd ./node_modules/tern/ && npm install --save tern-node-express' }
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
Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript', 'javascript.jsx'] }
Plug 'rsmenon/vim-mathematica', { 'for': 'mma' }
Plug 'vim-pandoc/vim-pandoc', { 'on': 'Pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'othree/xml.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
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
Plug 'gkz/vim-ls', { 'for': 'ls' }
Plug 'haya14busa/incsearch.vim'
Plug 'dahu/diffo'
Plug 'PeterRincker/vim-argumentative'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-rsi'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'mattn/webapi-vim'
Plug 'mmozuras/vim-github-comment'
Plug 'benmills/vimux'

call plug#end()

" Tab indention > space indention.
set noexpandtab
set tabstop=4
set shiftwidth=4
set textwidth=80

" COLORS.
set t_Co=256
syntax on
colorscheme Tomorrow-Night

set mouse=a

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
set listchars+=trail:•            " show trailing spaces as dots
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
map /  <Plug>(incsearch-forward)\v
map ?  <Plug>(incsearch-backward)\v
map g/ <Plug>(incsearch-stay)\v

iabbrev Metoer Meteor
iabbrev ednl endl

" EMOJIS 🎉
autocmd FileType gitcommit set completefunc=emoji#complete

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

" Faster surrounds
xmap ' S'
xmap " S"

" More swag with the arrow keys
nnoremap <silent> <UP> :tabp<Cr>
nnoremap <silent> <DOWN> :tabn<Cr>
nnoremap <silent> <LEFT> :bp<Cr>
nnoremap <silent> <RIGHT> :bn<Cr>

" Hybrid line numbering.
set relativenumber
set number

" Faster ctrl-p indexing (http://stackoverflow.com/a/22784889/3142952)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden
			\ --ignore .git
			\ --ignore ".*.swp"
			\ --ignore .DS_Store
			\ -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0

nnoremap <Leader>f :Ag! ''<left>
nnoremap <silent> <Leader>F :Ag! <cword><Cr>
nnoremap <silent> <Leader>t :CtrlPTag<Cr>
nnoremap <silent> <Leader><Leader>t :TagbarToggle<Cr>
nnoremap <silent> <Leader>n :NERDTreeToggle<cr>
nnoremap <silent> <Leader>g :GundoToggle<cr>
nnoremap <Leader>w :up<cr>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

command Zen Goyo | Limelight | set nolist
command Unzen Goyo | Limelight! | set list

command Path echo expand('%:p')

" Tab swag.
nnoremap <silent> tt :tabnew<cr>
nnoremap <silent> tc :tabclose<cr>
au VimEnter * nnoremap <silent> [t :tabprevious<cr>
au VimEnter * nnoremap <silent> ]t :tabnext<cr>

function! ResizeToSelection() range
	execute "resize " . (a:lastline - a:firstline + 1)
	norm zt
endfunction
vnoremap <silent> <Leader>s :call ResizeToSelection() \| wincmd p<Cr>

nnoremap <Leader>y mY^y$`Y
nnoremap <Leader>v ^v$h

" Remove need to press enter after quiting from a Man page.
nnoremap K K<CR>
vnoremap K K<CR>

" File specific settings.
autocmd FileType coffee setlocal sw=2 ts=2
autocmd FileType ls setlocal sw=2 ts=2
autocmd FileType ruby setlocal sw=2 ts=2 et
autocmd FileType python setlocal sw=4 ts=4 et
autocmd FileType html,mustache setlocal formatoptions-=t
autocmd FileType cpp setlocal keywordprg=cppman

nnoremap <Leader>d :YcmCompleter GoTo<Cr>

command Sudowrite w !sudo tee > /dev/null %

nnoremap <BS> <C-o>
nnoremap <Space>w :up<Cr>
nnoremap <Space>wq ZZ
nnoremap <Space>wqa :wqa<Cr>
nnoremap <Space>q :q<Cr>
nnoremap <Space>qq :q!<Cr>
nnoremap <Space>qa :qa<Cr>
nnoremap <Space>qaa :qa!<Cr>
nnoremap <Space>e :e<Cr>
nnoremap <Space>ee :e!<Cr>
nnoremap <Space> :

augroup HighlightRed
	autocmd!
	autocmd WinEnter,VimEnter * :silent! call matchadd('WarningMsg', 'TODO\|FIXME\|OPTIMIZE\|HACK\|REVIEW', -1)
augroup END

let g:replopen = 0
function! OpenREPL()
	if &ft == "coffee"
		let repl = "coffee"
	elseif &ft == "javascript"
		let repl = "node"
	elseif &ft == "python"
		let repl = "python3"
	elseif &ft == "ls"
		let repl = "lsc"
	elseif &ft == "ruby"
		let repl = "irb"
	endif

	if !empty(repl)
		call VimuxRunCommand(repl)
		call VimuxClearRunnerHistory()
		let g:replopen = 1
	endif
endfunction

function! CloseREPL()
	let g:replopen = 0
	call VimuxCloseRunner()
endfunction

function! Run() range
	if !g:replopen
		call OpenREPL()
	endif

	let i = a:firstline
	while i <= a:lastline
		call VimuxRunCommand(getline(i))
		let i += 1
	endwhile
endfunction

command! -range Run <line1>,<line2>call Run()
command! Closerepl call CloseREPL()
