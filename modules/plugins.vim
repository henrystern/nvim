" launch plugins
call plug#begin(stdpath('data') . '/plugged')

" startup plugins
Plug 'lewis6991/impatient.nvim'

"general plugins
Plug 'tpope/vim-surround' "<C-s>x and <C-ss>x in insert mode
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'voldikss/vim-floaterm'
Plug 'phaazon/hop.nvim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
Plug 'sbdchd/neoformat'

" Documentation help
" Plug 'rizzatti/dash.vim'

"Language specific plugins
Plug 'preservim/vim-markdown', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jalvesaq/Nvim-R', {'for': ['r']}
Plug 'lervag/vimtex', { 'for': ['tex']}
Plug 'mfussenegger/nvim-dap-python', { 'for': ['python']}

"Dap
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/trouble.nvim'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

"lint
" Plug 'mfussenegger/nvim-lint'

"lsp and dap installer
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

"TS
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

" Vimscript plugin settings

"stop nvim-r assigning shortcut
let R_assign_map = '__'

" Colorscheme has to be called after plugin is loaded
colorscheme dracula

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal_snippets"] 

if os == "Windows"
	let g:vimtex_view_general_viewer = 'SumatraPDF'
	let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
elseif os == "Linux"
	let g:vimtex_view_method='zathura'
endif

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-synctex=1',
		\   '-aux-directory=' . stdpath('data') . '/.latex_aux_files',
        \ ],
        \}

" set markdown-preview browser
let g:mkdp_browser = 'firefox'

" goyo limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
