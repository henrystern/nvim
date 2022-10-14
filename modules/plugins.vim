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
Plug 'folke/zen-mode.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
Plug 'sbdchd/neoformat'

"Language specific plugins
Plug 'preservim/vim-markdown', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jalvesaq/Nvim-R', {'for': ['r']}
Plug 'lervag/vimtex', { 'for': ['tex']}
Plug 'mfussenegger/nvim-dap-python', { 'for': ['python']}
Plug 'chrisbra/csv.vim', { 'for': ['csv']}

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
" Plug 'hrsh7th/cmp-omni'
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

"FZF
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call plug#end()

" Vimscript plugin settings

" Colorscheme has to be called after plugin is loaded
colorscheme dracula

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal_snippets"] 

