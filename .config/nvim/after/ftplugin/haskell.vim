setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
