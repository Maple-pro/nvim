source ~/AppData/Local/nvim/plugins.vim

" {{{ UI Setting

" syntax enable
" syntax on
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
set history=200
set encoding=utf-8
set smarttab
" set hlsearch
set ignorecase
set autoread
set smartcase
set wildmenu
set wildmode=full
set mouse=a
set complete-=i
set backspace=2
set nu
set nocompatible
" set relativenumber
set number
set backspace=indent,eol,start
set incsearch
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set autoindent
set ai
inoremap jj <Esc>
" set shell=pwsh
set foldmethod=marker
set updatetime=100
set foldenable
" }}}


" {{{ Theme Setting
" set background=dark
set termguicolors
colorscheme tender
let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }
" colorscheme Neosolarized
" colorscheme gruvbox
" }}}


" {{{ Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}


" {{{ coc-snippets
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

" inoremap <silent><expr> <TAB>
" 		 \ pumvisible() ? coc#_select_confirm() :
" 		 \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
" 		 \ <SID>check_back_space() ? "\<TAB>" :
" 		 \ coc#refresh()

""" }}}


" {{{ coc.nvim
inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#pum#next(1) :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
			\ CheckBackspace() ? "\<TAB>" :
			\ coc#refresh()

inoremap <silent><expr> <S-TAB> pumvisible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on configm.
" inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! CheckBackspace() abort
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

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" }}}


" {{{ auto format
" let g:formatdef_cuda = '"clang-format --style=microsoft"'
" let g:formatters_cuda = ['cuda']
" let g:formatdef_matlab = '"mh_style --fix"'
" let g:formatters_matlab = ['matlab']
let g:python3_host_prog="D:/17199/Documents/anaconda3/python.exe"
au BufWrite *.f90,*.py,*.cpp,*.tex,*.c,*.cs,*.cu,*.json :Autoformat
" autocmd BufWinLeave  *.m :!mh_style --fix --tab_width 3 *.m> /dev/null 2>&1
" let g:autoformat_verbosemode=1
map <Leader>m :!mh_style --fix --tab_width 3 *.m> /dev/null 2>&1<CR><CR>
" }}}


" {{{ chadtree
nnoremap <leader>v <cmd>CHADopen<cr>
let g:chadtree_settings = {'view.width' : 25, 'keymap.tertiary' : ["<c-s>"], 
		 \ 'theme.text_colour_set' : "solarized_universal",
		 \ 'theme.icon_colour_set' : "github"}
" }}}


" {{{ fzf
map <leader>g :Rg<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
" }}}


" {{{ vim-tex
" let g:vimtex_view_method = 'C:\Users\17199\AppData\Local\SumatraPDF'
let g:vimtex_view_general_viewer = 'SumatraPDF'
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" 阅读器的相关配置
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_open_on_warning=0
" set conceallevel=1
" let g:tex_conceal='abdmg'
" let g:vimtex_compiler_progname='/usr/local/bin/nvr'

" let g:livepreview_previewer = 'open -a Skim'
" let g:livepreview_engine = 'xelatex'
" }}}


" {{{ easy motion
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
map <leader><leader>. <Plug>(easymotion-repeat)
" }}}


" {{{ 自动运行程序
" nnoremap <silent> <c-G> :call CompileRunGcc()<CR>
func! CompileRunGcc()
   exec "w"
   if &filetype == 'c'
	  exec "!g++ % -o %<"
	  exec "!time ./%<"
   elseif &filetype == 'cpp'
	  exec "!g++ % -o %<"
	  exec "!time ./%<"
   elseif &filetype == 'fortran'
	  exec "!gfortran % -o %<"
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
" }}}


" {{{ 颜色设置
function DarkMode()
    " colorscheme solarized8_high
    set background=dark
    " let g:lightline = { 'colorscheme': 'solarized' }
endfunction

function LightMode()
    " colorscheme bbedit
    set background=dark
    " let g:lightline = { 'colorscheme': 'PaperColor' }
endfunction

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" }}}


" {{{ minimap
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1
" let g:minimap_highlight_range = 1
" " let g:minimap_git_colors = 1
" let g:minimap_highlight_search = 1
" let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'fzf', 'chadtree' ]
" autocmd ColorScheme *
"         \ highlight minimapCursor            ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#FFFF87 |
"         \ highlight minimapRange             ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#FFFF87
" }}}


" {{{ vim-gutentags
" Don't load me if there's no ctags file
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif
" }}}


" {{{ terminal mode key map
tnoremap <leader><Esc> <C-\><C-n>
nnoremap <silent> <leader>t :call OpenPwshInSplitView()<CR>

function OpenPwshInSplitView()
   let bufcount = bufnr("$")
   let currbufnr = 1
   let firstmatchingbufnr = 0
   while currbufnr <= bufcount
	  let currbufnr = currbufnr + 1
	  if(bufexists(currbufnr))
		 if(matchstr(bufname(currbufnr), "term://") != "")
			let firstmatchingbufnr = currbufnr
			break
		 endif
	  endif
   endwhile

   if(firstmatchingbufnr == 0)
	  execute "sp"
	  execute "wincmd j"
	  execute "terminal pwsh"
   else
	  execute "sp"
	  execute "wincmd j"
	  execute "e #" . firstmatchingbufnr
   endif

endfunction
" }}}


" {{{ Other Setting
let g:airline_section_y = ''

" 删除不复制
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

let b:ale_linters = {'fortran': ['language_server']}

" python
let g:python_highlight_all = 1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
		 \ if line("'\"") > 0 && line("'\"") <= line("$") |
		 \   exe "normal! g`\"" |
		 \ endif

" }}}

