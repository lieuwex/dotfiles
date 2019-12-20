" Lieuwe Rooijakkers' vimrc

set shell=/bin/bash
set laststatus=2
set autoread
set timeoutlen=350 ttimeoutlen=25
set updatetime=250

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set mouse=a

" AutoPairs
let g:AutoPairsCenterLine = 0

" MatchTagAlways
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'mustache' : 1 }

" ALE
"let g:ale_sign_error = 'E>'
"let g:ale_sign_warning = 'W>'

" unimpaired
let g:nremap = { ']t': '', '[t': '' }

" rainbow_pairs
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

"let g:LanguageClient_serverCommands = {
"    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"	\
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
"let g:LanguageClient_loadSettings = 1
"let g:LanguageClient_settingsPath = '/home/lieuwe/.config/nvim/settings.json'
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"set shortmess+=c
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>r <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

call plug#begin('~/.config/nvim/plugged')

" Deps
Plug 'mattn/webapi-vim'
Plug 'tyru/open-browser.vim'
Plug 'roxma/nvim-yarp'

" Filetypes
Plug 'othree/yajs.vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'coffeescript'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }
Plug 'gkz/vim-ls', { 'for': 'ls' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
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
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }

" Filetype specific utils
Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'sh', 'vim'] }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'maksimr/vim-jsbeautify', { 'for': [ 'javascript', 'javascript.jsx', 'jsx', 'json', 'html', 'css'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'html', 'stylus'] }
Plug 'Valloric/MatchTagAlways'

" Themes
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'

" Commands
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'dahu/diffo', { 'on': 'DiffOrig' }
Plug 'mmozuras/vim-github-comment', { 'on': 'GHComment' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'tyru/open-browser-github.vim', { 'on': 'OpenGithubIssue' }

" UI
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'simnalamburt/vim-mundo', { 'on': ['MundoToggle', 'MundoShow'] }
Plug 'airblade/vim-gitgutter', { 'commit': 'faa1e953deae2da2b0df45f71a8ce8d931766c28' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/rainbow_parentheses.vim'

" Linting
"Plug 'w0rp/ale'

" Autocomplete
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Motions, operators and objects
Plug 'tommcdo/vim-exchange'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" The rest
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-rsi'
Plug 'bogado/file-line'
Plug 'metakirby5/codi.vim'

call plug#end()

let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'window': 'botright 12new | redraw!' }

" Tab indention > space indention.
set noexpandtab
set tabstop=4
set shiftwidth=4
set textwidth=80

" COLORS.
let g:seoul256_background = 235
set background=dark
syntax on
colorscheme Tomorrow-Night
"colorscheme base16-tomorrow-night
"colorscheme gruvbox
"colorscheme seoul256

" Clear search query results with ctrl+l.
nnoremap <silent> <C-l> :noh<CR><C-l>

" Persistent undo
set undofile
set undodir=~/.config/nvim/undos

" List chars
set list
set listchars=""
set listchars=tab:\|\ 
set listchars+=trail:•
set listchars+=extends:>

set listchars+=precedes:<

highlight SpecialKey ctermfg=237

" Remember last line location.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Options
set hidden " Hidden buffers swag.
set ignorecase
set smartcase " Search case insensitive, unless I really want to.
set nowrap
set clipboard=unnamed " Use system clipboard for yanking.
set cursorline " Highlight the current line.
set scrolljump=5 " Jump some lines when scrolling the window down.
set incsearch
set hlsearch
set splitright " Split to the right side when using vsplit.
set wildmenu " Autocompletion menu on ex commands.
set history=1000
set undolevels=1000
set gdefault " Use global flag for substitute by default
set inccommand=nosplit

" Hybrid line numbering.
set relativenumber
set number

map g/ <Plug>(easymotion-sn)\v

" Typos
iabbrev Metoer Meteor
iabbrev ednl endl

" Other iabbrevs
iabbrev /shrug/ ¯\_(ツ)_/¯

" File specific settings.
autocmd FileType html,mustache setlocal formatoptions-=t
autocmd BufRead,BufNewFile *.html setlocal wrap " Wrap HTML files.
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable " CoffeeScript folding.
autocmd FileType css,stylus set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mustache setlocal omnifunc=htmlcomplete#CompleteTags

" Spelling
set spelllang=en_gb,nl
autocmd FileType markdown,html,mustache,gitcommit setlocal spell " Set spellchecking on for text files.

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

" Faster surrounds
xmap ' S'
xmap " S"

" FZF mappings
nnoremap <silent> <Leader>f :Ag<Cr>
nnoremap <silent> <Leader>F :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>g :MundoToggle<cr>
nnoremap <silent> <C-p> :Files<Cr>

function! OpenGHIssue(word)
	let l:issue = substitute(a:word, "[^#0-9]", "", "g")
	execute "OpenGithubIssue " . l:issue
endfunction
nnoremap <silent> <Leader>gi :exec 'call OpenGHIssue(' expand('<cword>') ')'<CR>

" Tab swag.
nnoremap <silent> tt :tabnew<cr>
nnoremap <silent> tc :tabclose<cr>
nnoremap <silent> [t :tabprevious<cr>
nnoremap <silent> ]t :tabnext<cr>

function! ResizeToSelection() range
	execute "resize " . (a:lastline - a:firstline + 1)
	norm zt
endfunction
vnoremap <silent> <Leader>s :call ResizeToSelection() \| wincmd p<Cr>

nnoremap <Leader>y mY^y$`Y
nnoremap <Leader>v ^vg_
nnoremap Y y$

" move mappings
nnoremap <BS> <C-o>

" yank mappings
nnoremap <Leader>ya :%y<Cr>

" :setf mappings
nnoremap <Leader>sf :setf 

" map return to :
function! MapReturn()
	if &ft != 'qf' && &ft != 'netrw'
		nnoremap <buffer> <Cr> :
		xnoremap <buffer> <Cr> :
	endif
endfunction
autocmd FileType * call MapReturn()

" rainbow parens for lisps
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Swap Q and ~
nnoremap Q ~
xnoremap Q ~
nnoremap ~ Q

" Commands
command Path echo expand('%:p')
command Sudowrite write !sudo tee > /dev/null %
command Time exec 'norm a' . system('date +%H:%M')

augroup HighlightRed
	autocmd!
	autocmd WinEnter,VimEnter * :silent! call matchadd('WarningMsg', 'TODO\|FIXME\|OPTIMIZE\|HACK\|REVIEW\|BUG\|!', -1)
augroup END

" * and # mappings
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

" Extra whitespace
highlight default ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNew * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/
match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/

function! s:FixWhitespace(line1,line2)
	let l:save_cursor = getpos(".")
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\\\@<!\s\+$//'
	call setpos('.', l:save_cursor)
endfunction

command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" lightline stuff
"let g:lightline.colorscheme = 'seoul256'
let g:lightline = {
		\ 'component_function': {
			\ 'filename': 'LightlineFilename',
		\ },
	\ }

function! LightlineFilename()
	return expand('%') !=# '' ? expand('%') : '[No Name]'
endfunction

set noshowmode

" buftabline stuff
set showtabline=2
