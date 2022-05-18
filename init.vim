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


" autocomplete
set dictionary+=/usr/share/dict/words


" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" coc
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>


inoremap <silent><expr> <TAB>
		 \ pumvisible() ? coc#_select_confirm() :
		 \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
		 \ <SID>check_back_space() ? "\<TAB>" :
		 \ coc#refresh()

function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
	  execute 'h '.expand('<cword>')
   elseif (coc#rpc#ready())
	  call CocActionAsync('doHover')
   else
	  execute '!' . &keywordprg . " " . expand('<cword>')
   endif
endfunction


" auto format
let g:formatdef_my_custom_m = '"mh_style --fix *.m"'
let g:formatters_m = ['my_custom_m']
let g:python3_host_prog="/Users/circle/opt/anaconda3/bin/python"
au BufWrite *.f90,*.py,*.cpp,*.tex,*.c,*.m :Autoformat


" 删除不复制
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP


" chadtree
nnoremap <leader>v <cmd>CHADopen<cr>
let g:chadtree_settings = {'view.width' : 25, 'keymap.tertiary' : ["<c-s>"], 
		 \ 'theme.text_colour_set' : "solarized_universal",
		 \ 'theme.icon_colour_set' : "github"}

" git
set updatetime=100


" fzf
map <leader>g :Rg<CR>
map <leader>f :Files<CR>

let g:airline_section_y = ''

" latex
let g:vimtex_view_method = 'skim'
" let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_quickfix_open_on_warning=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:livepreview_previewer = 'open -a Skim'
let g:livepreview_engine = 'xelatex'


" easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" 自动运行程序
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


