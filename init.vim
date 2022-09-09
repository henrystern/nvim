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
set guifont=MesloLGS_NF:h11:cDEFAULT
set encoding=UTF-8
set tabstop=4 softtabstop=4 shiftwidth=4 shiftwidth=4 smarttab
set encoding=UTF-8
filetype plugin indent on

set confirm
setglobal display=lastline
setglobal scrolloff=1
setglobal sidescrolloff=5
setglobal lazyredraw
set breakindent showbreak=\ +

set undofile
setglobal history=1000

set mouse=a

map <Space> <Leader>

inoremap ii <esc>
inoremap <C-a> <esc>0i
inoremap <C-e> <esc>$a
inoremap <C-d> <delete>

nnoremap o o<esc>
nnoremap O O<esc>
nnoremap h j
nnoremap j h
nnoremap dh dj
nnoremap dj dh
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>c :bd<CR>
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <silent> <leader>n :NvimTreeFocus<CR>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
set timeoutlen=500

nmap <silent> <leader>/ gcc

vnoremap h j
vnoremap j h
vnoremap dh dj
vnoremap dj dh

vmap <leader>/ gc

nnoremap   <silent>   <leader>t    :FloatermNew<CR>
tnoremap   <silent>   <leader>t    <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   `    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>



let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'lervag/vimtex', { 'for': ['tex']}
Plug 'tpope/vim-surround' "<C-s>x and <C-ss>x in insert mode
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'voldikss/vim-floaterm'
Plug 'phaazon/hop.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-cmdline'
Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-markdown', { 'for': ['markdown'] }
Plug 'tpope/vim-commentary'
Plug 'folke/which-key.nvim'
call plug#end()

let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
  \ = '-reuse-instance -forward-search @tex @line @pdf'

filetype plugin indent on

let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_compiler_method = 'latexmk'

setlocal spell
set spelllang=en_ca
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

colorscheme dracula

set completeopt=menu,menuone,noselect

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
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

      require("cmp_nvim_ultisnips").setup{}
    local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")


  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-n>'] = cmp.mapping.select_next_item(),
	  ['<c-i>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	  ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
		),

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
	  { name = 'calc' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig')['html'].setup{
    capabilities = capabilities,
}

require('lspconfig')['pyright'].setup{
	on_attach = on_attach,
    capabilities = capabilities,
	flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require'lspconfig'.vimls.setup{
    capabilities = capabilities,
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
		["e"] = { "open float" },
		[ "[" ] = { "go to prev" },
		["]"] = { "go to next" },
		["q"] = { "set local list" },
		}
	}, { prefix = '<leader>' })

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'dracula-nvim',
		},
	...
}

require("nvim-tree").setup()

vim.opt.termguicolors = true
require("bufferline").setup{}

require'hop'.setup({
	keys = 'arstneiodhgm'
	})
vim.api.nvim_set_keymap('', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>t', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>f2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>F2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>t2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>T2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})

EOF
