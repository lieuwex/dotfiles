" Lieuwe Rooijakkers' vimrc
" This uses YCM as completer per default, if this is too heavy for your system
" you can set the following `use_ycm` variable to 0, which will enable
" NeoComplete instead. ( Be sure to `:PlugInstall` afterwards ).
let use_ycm = 1

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

let g:go_fmt_command = "goimports"

if use_ycm " YouCompleteMe
	let g:ycm_complete_in_comments = 1
	let g:ycm_autoclose_preview_window_after_completion = 0
	let g:ycm_autoclose_preview_window_after_insertion = 1
	let g:ycm_always_populate_location_list = 1
	let g:ycm_confirm_extra_conf = 0

	let g:ycm_semantic_triggers = {'haskell' : ['.']}

	function! Multiple_cursors_before()
		let s:old_ycm_whitelist = g:ycm_filetype_whitelist
		let g:ycm_filetype_whitelist = {}
	endfunction

	function! Multiple_cursors_after()
		let g:ycm_filetype_whitelist = s:old_ycm_whitelist
	endfunction
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

let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

" Tern
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

set background=dark

" MatchTagAlways
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'mustache' : 1 }

" Neomake
let blacklist = [ 'c', 'cpp', 'objc', 'objcpp' ]
autocmd BufWinEnter,FileReadPost,BufWritePost * if index(blacklist, &ft) < 0 | Neomake
let g:neomake_mustache_tidy_maker = {
	\ 'args': ['-e', '-q', '--gnu-emacs', 'true'],
	\ 'errorformat': '%A%f:%l:%c: Warning: %m',
	\ }
let g:neomake_mustache_enabled_makers = ['tidy']
let g:neomake_cs_enabled_makers = ['syntax', 'semantic', 'issues', 'codecheck']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_python_python_exe = '/usr/local/bin/python3'
let g:neomake_error_sign = {
	\ 'text': 'E>',
	\ 'texthl': 'ErrorMsg',
	\ }
let g:neomake_warning_sign = {
	\ 'text': 'W>',
	\ 'texthl': 'WarningMsg',
	\ }
let g:neomake_verbose = 0

" incsearch
let g:incsearch#emacs_like_keymap = 1

" Tagbar
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

call plug#begin('~/.config/nvim/plugged')

" Deps
Plug 'mattn/webapi-vim'
Plug 'tyru/open-browser.vim'

" Filetypes
Plug 'othree/yajs.vim', { 'for': ['html', 'javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }
Plug 'gkz/vim-ls', { 'for': 'ls' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'zah/nim.vim', { 'for': 'nim' }
Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript', 'javascript.jsx'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }

" Filetype specific utils
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'sh', 'vim'] }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'marijnh/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install && curl --create-dirs -o ./node_modules/tern/plugin/meteor.js https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js && cd ./node_modules/tern/ && npm install --save tern-node-express' }
Plug 'maksimr/vim-jsbeautify', { 'for': [ 'javascript', 'javascript.jsx', 'jsx', 'json', 'html', 'css'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'mustache', 'javascript.jsx'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'html', 'stylus'] }
" Plug 'rstacruz/vim-hyperstyle', { 'for': ['css', 'html', 'stylus'] }

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }

" Commands
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'dahu/diffo', { 'on': 'DiffOrig' }
Plug 'rhysd/devdocs.vim'
Plug 'zoeesilcock/vim-caniuse'
Plug 'mmozuras/vim-github-comment', { 'on': 'GHComment' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'tyru/open-browser-github.vim', { 'on': 'OpenGithubIssue' }

" UI
Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarToggle', 'TagbarOpen'] }
Plug 'vim-airline/vim-airline'
Plug 'simnalamburt/vim-mundo', { 'on': ['MundoToggle', 'MundoShow'] }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Build
Plug 'benekastah/neomake'
Plug 'tpope/vim-dispatch'

" Autocomplete
if use_ycm
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --omnisharp-completer --gocode-completer' }
else
	Plug 'davidhalter/jedi-vim', { 'for': 'python' }
	Plug 'Shougo/neocomplete.vim'
endif
Plug 'junegunn/vim-emoji', { 'for': 'gitcommit' }

" Motions, operators and objects
Plug 'tommcdo/vim-exchange'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" FZF
Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" The rest
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-multiple-cursors'
Plug 'regedarek/ZoomWin'
Plug 'jiangmiao/auto-pairs'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Yggdroot/indentLine', { 'for': ['ruby', 'python']}
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-rsi'
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
Plug 'Valloric/MatchTagAlways'
Plug 'bogado/file-line'

call plug#end()

let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'window': 'botright 12new | redraw!' }

" Tab indention > space indention.
set noexpandtab
set tabstop=4
set shiftwidth=4
set textwidth=80

" COLORS.
syntax on
colorscheme Tomorrow-Night

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

" Options
set noshowmode " We have airline, which already shows the current mode.
set hidden " Hidden buffers swag.
set ignorecase
set smartcase " Search case insensitive, unless I really want to.
set nowrap
set clipboard=unnamed " Use system clipboard for yanking.
set complete+=kspell " Word completion.
set cursorline " Highlight the current line.
set scrolljump=5 " Jump some lines when scrolling the window down.
set incsearch " When searched, use current search query as a query for a substitute.
set hlsearch
set splitright " Split to the right side when using vsplit.
set wildmenu " Autocompletion menu on ex commands.
set history=1000
set undolevels=1000
set formatoptions+=j " Delete comment character when joining commented lines
set gdefault " Use global flag for substitute by default

" Hybrid line numbering.
set relativenumber
set number

" Set incsearch
map /  <Plug>(incsearch-forward)\v
map ?  <Plug>(incsearch-backward)\v
map g/ <Plug>(easymotion-sn)\v

" Typos
iabbrev Metoer Meteor
iabbrev ednl endl

" EMOJIS 🎉
autocmd FileType gitcommit set completefunc=emoji#complete

" File specific settings.
autocmd FileType coffee setlocal sw=2 ts=2
autocmd FileType stylus setlocal sw=2 ts=2
autocmd FileType ls setlocal sw=2 ts=2
autocmd FileType ruby setlocal sw=2 ts=2 et
autocmd FileType python setlocal sw=4 ts=4 et
autocmd FileType haskell setlocal sw=2 ts=2 et
autocmd FileType html,mustache setlocal formatoptions-=t

" autocmd FileType markdown,html,pandoc,text setlocal spell spelllang=en_us,nl_nl " Set spellchecking on for text files.
autocmd BufRead,BufNewFile *.html setlocal wrap " Wrap HTML files.
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable " CoffeeScript folding.
autocmd FileType css,stylus set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mustache setlocal omnifunc=htmlcomplete#CompleteTags

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

" Faster surrounds
xmap ' S'
xmap " S"

nnoremap <silent> <Leader>f :Ag<Cr>
nnoremap <silent> <Leader>F :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>t :Tags<Cr>
nnoremap <silent> <Leader><Leader>t :TagbarToggle<Cr>
nnoremap <silent> <Leader>g :MundoToggle<cr>
nnoremap <Leader>w :up<cr>
nnoremap <silent> <C-p> :Files<Cr>

function! OpenGHIssue(word)
	let l:issue = substitute(a:word, "[^#0-9]", "", "g")
	execute "OpenGithubIssue " . l:issue
endfunction
nnoremap <silent> <Leader>gi :exec 'call OpenGHIssue(' expand('<cword>') ')'<CR>

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
nnoremap Y y$

nnoremap <Leader>d :YcmCompleter GoTo<Cr>

nnoremap <BS> <C-o>
nnoremap <Space>w :up<Cr>
nnoremap <Space>wa :wa<Cr>

nnoremap <Space>wq ZZ
nnoremap <Space>wqa :wqa<Cr>
nnoremap <Space>q :q<Cr>
nnoremap <Space>qq :q!<Cr>
nnoremap <Space>qa :qa<Cr>
nnoremap <Space>qaa :qa!<Cr>

nnoremap <Space>e :e<Cr>
nnoremap <Space>ee :e!<Cr>

nnoremap <Space>sa :%s/\v
nnoremap <Space>ss :.s/\v
nnoremap <Space>sa/ :%s//
nnoremap <Space>ss/ :.s//

nnoremap <Cr> :

nnoremap <Leader>sf :setf 
nnoremap <Leader>sfmu :setf mustache<cr>
nnoremap <Leader>sfjs :setf javascript<cr>

nmap K <Plug>(devdocs-under-cursor)
nnoremap <Leader>p :DevDocs 

" Fix filetypes
function! SetMustache()
	if expand('%:p') =~ "/Users/lieuwe/Desktop/simply/simplyHomework"
		setlocal filetype=mustache
	endif
endfunction
augroup MustacheOpen
	autocmd!
	autocmd FileType html :call SetMustache()
augroup END
autocmd BufRead,BufNewFile *.script setfiletype applescript

" Swap Q and ~
nnoremap Q ~
xnoremap Q ~
nnoremap ~ Q

" Commands
command UglifyJS norm mU:%!uglifyjs | pbcopy<cr>u`U
command Zen Goyo | Limelight | set nolist
command Unzen Goyo | Limelight! | set list
command Path echo expand('%:p')
command Sudowrite w !sudo tee > /dev/null %

augroup HighlightRed
	autocmd!
	autocmd WinEnter,VimEnter * :silent! call matchadd('WarningMsg', 'TODO\|FIXME\|OPTIMIZE\|HACK\|REVIEW\|BUG', -1)
augroup END

nnoremap * *N
nnoremap # #N
nnoremap g* g*N
nnoremap g# g#N

" * and # in visual mode.
" Taken from https://github.com/scrooloose/vimfiles
function! s:VSetSearch()
	let temp = @@
	norm! gvy
	let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
