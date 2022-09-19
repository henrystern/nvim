" path to nvim pynvim env
let g:python3_host_prog = "/usr/bin/python3"


lua require('impatient')

inoremap ii <esc>
set number relativenumber
set visualbell
set cursorline
set hlsearch
set smartcase
set ignorecase
set incsearch
set background=dark
set autoindent
set backspace=indent,eol,start
syntax enable
set guifont=MesloLGS_NF:h11:cDEFAULT
set encoding=UTF-8
set tabstop=4 softtabstop=4 shiftwidth=4 shiftwidth=4 smarttab
set encoding=UTF-8
filetype plugin indent on
set confirm
set nospell
set undofile
setglobal history=1000

set nrformats-=octal

set mouse=a

" detect os
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

map <Space> <Leader>

inoremap <C-a> <esc>0i
inoremap <C-e> <esc>$a
inoremap <C-d> <delete>

nnoremap o o<esc>
nnoremap O O<esc>
nnoremap h j
nnoremap j h
nnoremap dh dj
nnoremap dj dh
nnoremap <c-w>h <c-w>j
nnoremap <c-w>j <c-w>h
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <leader><Tab> :tabnext<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>c :bd<CR>
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
set timeoutlen=500

nmap <silent> <leader>/ gcc

vnoremap h j
vnoremap j h

vmap <leader>/ gc

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
nnoremap   <silent>   <leader>!    :FloatermNew<CR>
tnoremap   <silent>   `    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

" reload init.vim
nnoremap <silent> <leader>rr :source $MYVIMRC<cr>
nnoremap <silent> <leader>re :edit $MYVIMRC<cr>
" edit snips
nnoremap <silent> <leader>ru :UltiSnipsEdit!<cr>

"uncomment if fresh install
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
" 	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin(stdpath('data') . '/plugged')

" startup plugins
Plug 'lewis6991/impatient.nvim'
"Plug 'dstein64/vim-startuptime'

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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
" Plug 'tpope/vim-repeat'
" TODO: setup vim-repeat for custom mappings "
Plug 'sbdchd/neoformat'

"trying out plugins
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

"Language specific plugins
Plug 'preservim/vim-markdown', { 'for': ['markdown'] }
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
Plug 'mfussenegger/nvim-lint'

"lsp and dap installer
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

"TS
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal_snippets"] "use :UltiSnipsEdit! to choose which snippet file to edit

if os == "Windows"
	let g:vimtex_view_general_viewer = 'SumatraPDF'
	let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
endif
if os == "Linux"
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

nnoremap <leader>ds :setlocal spell! spelllang=en_ca<CR>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

colorscheme dracula

set completeopt=menu,menuone,noselect

"format settings
nnoremap <leader>bf :Neoformat<cr>

"DAP mappings
nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <F6> :lua require'dap'.run_to_cursor()<CR>
nnoremap <F9> :lua require'dap'.step_back()<CR>
nnoremap <F10> :lua require'dap'.step_over()<CR>
nnoremap <F11> :lua require'dap'.step_into()<CR>
nnoremap <F12> :lua require'dap'.step_out()<CR>

nnoremap <leader>dx <cmd>TroubleToggle document_diagnostics<cr> 
nnoremap <leader>df <cmd>TroubleToggle quickfix<cr> 

nnoremap <leader>du <cmd>lua require("dapui").toggle()<cr> 

"hop mappings
nnoremap <leader>f <cmd>HopWord<cr>
nnoremap <leader>T <cmd>HopPattern<cr>
nnoremap <leader>t <cmd>HopChar1<cr>
onoremap <leader>f <cmd>HopWord<cr>
onoremap <leader>T <cmd>HopPattern<cr>
onoremap <leader>t <cmd>HopChar1<cr>

au BufWritePost lua require('lint').try_lint()

lua << EOF

-- plugins

require("mason").setup()
require("mason-lspconfig").setup()

if vim.g.os == "Linux" then
	require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
end
if vim.g.os == "Windows" then
	require('dap-python').setup('~/AppData/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe')
end

require("which-key").setup {
}

local wk = require("which-key")

wk.register({
	["<C-l>"] = "fix spelling",
	["<tab>"] = "next buffer",
})

-- registers with leader prefix
wk.register({
	c = { "close buffer" },
	w = { "save" },
	q = { "quit nvim" },
	h = { "toggle highlighting"},
	["/"] = { "toggle comment"},
	d = {
		name = "diagnostics",
		["e"] = { "open float" },
		[ "[" ] = { "go to prev" },
		["]"] = { "go to next" },
		["s"] = { "toggle spellcheck" },
	},
	b = {
		name = "buffer",
	},
	r = {
		name = "config",
	},
},
{ prefix = '<leader>' })

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'dracula-nvim',
		},
	...
}

require("nvim-tree").setup()

vim.opt.termguicolors = true
require("bufferline").setup{
	options = {
		always_show_bufferline = false,
		}
}

require'hop'.setup({
	keys = 'arstneiodhgm'
	})

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', '<leader>bd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', '<leader>bD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', '<leader>bi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', '<leader>bo', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', '<leader>br', '<cmd>lua vim.lsp.buf.references()<cr>')

    bufmap('n', '<leader>b<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<leader>b<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<leader>b<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<leader>b<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap('n', '<leader>de', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

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

require'lspconfig'.texlab.setup{
    capabilities = capabilities,
}


require'lspconfig'.r_language_server.setup{
    capabilities = capabilities,
}


require("cmp_nvim_ultisnips").setup{}

vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsRemoveSelectModeMappings = 0

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require('cmp')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'ultisnips', keyword_length = 1},
	{name = 'calc'},
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        ultisnips = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
	["<Tab>"] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			else
				cmp.complete()
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_forward)"), 'm', true)
			else
				fallback()
			end
		end,
		s = function(fallback)
			if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_forward)"), 'm', true)
			else
				fallback()
			end
		end
	}),
	["<S-Tab>"] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			else
				cmp.complete()
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
				return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
			else
				fallback()
			end
		end,
		s = function(fallback)
			if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
				return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
			else
				fallback()
			end
		end
	}),
	['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
	['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
	['<C-n>'] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end
	}),
	['<C-e>'] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end
	}),
	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
	['<C-h>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
	['<CR>'] = cmp.mapping({
		i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		c = function(fallback)
			if cmp.visible() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
			else
				fallback()
			end
		end
	}),
  },
})

cmp.setup.cmdline('/', {
    completion = { autocomplete = false },
    sources = {
        { name = 'buffer', option = { keyword_pattern = [=[[^[:blank:]].*]=] } }
    }
})

cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
    })
})

require("trouble").setup {
}

require("nvim-treesitter.configs").setup {
  highlight = {
  },
  rainbow = {
    enable = true,
    extended_mode = true, 
  }
}

require("dapui").setup()

EOF

