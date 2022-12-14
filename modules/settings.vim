if os == "Windows"
	let g:python3_host_prog = "~\\AppData\\Local\\Programs\\Python\\Python310\\python.exe"
else
	let g:python3_host_prog = "/usr/bin/python3"
endif

syntax enable
filetype plugin indent on

set number relativenumber cursorline
set smartcase ignorecase incsearch hlsearch
set tabstop=4 shiftwidth=4 smarttab expandtab autoindent
set visualbell

set confirm
set nospell

set undofile
setglobal history=1000

set background=dark
set backspace=indent,eol,start
set guifont=MesloLGS_NF:h11:cDEFAULT
set encoding=UTF-8
set encoding=UTF-8
set nrformats-=octal
set mouse=a
set timeoutlen=500
set completeopt=menu,menuone,noselect

" highlight on yank
augroup yank_highlight
  autocmd!
  if exists('##TextYankPost')
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  endif
augroup END

