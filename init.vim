source ~/.config/nvim/vim-plug/plugins.vim
" syntax enable
" syntax on
set history=200
set encoding=utf-8
set smarttab
" set hlsearch
set ignorecase
set wildmenu
set wildmode=full
set mouse=a
set complete-=i
set backspace=2
set nu
set nocompatible
set relativenumber
set backspace=indent,eol,start
set incsearch
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gk k
set clipboard=unnamed
set tabstop=4
set shiftwidth=3
set autoindent
set ai
inoremap jj <Esc> 


" color setting
set background=light
colorscheme solarized
" set termguicolors
" python
let g:python_highlight_all = 1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap <silent> <c-G> :call CompileRunGcc()<CR>
func! CompileRunGcc()
   exec "w"
   if &filetype == 'c'
	  exec "!g++ % -o %<"
	  exec "!time ./%<"
   elseif &filetype == 'cpp'
	  exec "!g++ % -o %<"
	  exec "!time ./%<"
   elseif &filetype == 'java'
	  exec "!javac %"
	  exec "!time java %<"
   elseif &filetype == 'sh'
	  :!time bash %
   elseif &filetype == 'python'
	  exec "!time python %"
   elseif &filetype == 'html'
	  exec "!firefox % &"
   elseif &filetype == 'go'
	  "        exec "!go build %<"
	  exec "!time go run %"
   elseif &filetype == 'mkd'
	  exec "!~/.vim/markdown.pl % > %.html &"
	  exec "!firefox %.html &"
   endif
endfunc

" coc
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

