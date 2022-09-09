set number
set visualbell
set cursorline
set hlsearch
set smartcase	
set ignorecase
set incsearch
set background=dark
set autoindent
set backspace=indent,eol,start
set spell
syntax enable
let g:airline_theme='deus'
set guifont=MesloLGS_NF:h11:cDEFAULT
set encoding=UTF-8
set tabstop=4 softtabstop=4 shiftwidth=4 shiftwidth=4 smarttab
set encoding=UTF-8
filetype plugin indent on

set mouse=a
"set guioptions -=m
"set guioptions -=T
"set guioptions-=r
"set guioptions-=L 

map <Space> <Leader>

inoremap ii <esc>
inoremap <C-a> <esc>0i
inoremap <C-e> <esc>$a
inoremap <C-d> <delete>

nnoremap o o<esc>
nnoremap O O<esc>
nnoremap h j
nnoremap j h
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>c :bd<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :NERDTreeFocus<CR>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" nnoremap <silent> <leader> :WhichKey '\'<CR>
set timeoutlen=500

nmap <silent> <F8> :TagbarToggle<CR>
nmap <silent> <leader>/ gcc

vnoremap h j
vnoremap j h
vmap <leader>/ gc

let g:airline#extensions#tabline#enabled = 1

nnoremap   <silent>   <leader>t    :FloatermNew<CR>
tnoremap   <silent>   <leader>t    <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <tab>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'

filetype plugin indent on

let g:vimtex_compiler_method = 'latexmk'


call plug#begin()
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/nvim-lspconfig'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'voldikss/vim-floaterm'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
call plug#end()

colorscheme dracula

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

let g:UltiSnipsEditSplit="vertical"

let g:deoplete#enable_at_startup = 1

lua << EOF

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>d[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>d]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>bgD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>bgd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>bK', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>bgi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>b<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>bwa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>bwr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>bwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>bD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>brn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>bca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>bgr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>bf', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig')['html'].setup {
  capabilities = capabilities,
}

require('lspconfig')['pyright'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require("which-key").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}

local wk = require("which-key")

wk.register({
	d = {
		name = "diagnostics",
		}
})
EOF
