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
set nospell
set undofile
setglobal history=1000

set nrformats-=octal

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
nnoremap <c-w>h <c-w>j
nnoremap <c-w>j <c-w>h
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

" reload init.vim
nnoremap <silent> <leader>rr :source $MYVIMRC<cr>
nnoremap <silent> <leader>re :edit $MYVIMRC<cr>

"uncomment if fresh install
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
" 	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin(stdpath('data') . '/plugged')

" Plug 'dstein64/vim-startuptime'

Plug 'lervag/vimtex', { 'for': ['tex']}
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
Plug 'preservim/vim-markdown', { 'for': ['markdown'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
Plug 'tpope/vim-repeat'
" TODO: setup vim-repeat for custom mappings "

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal_snippets"] "use :UltiSnipsEdit! to choose which snippet file to edit

let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
  \ = '-reuse-instance -forward-search @tex @line @pdf'


let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
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

lua << EOF

-- plugins

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
	l = {
		name = "vimtex",
		["l"] = { "start compiling" },
	},
	f = {
		name = "f-hop",
		["2"] = {"Bigram Hop"},
	},
	F = { 
		name = "F-hop",
		["2"] = {"Bigram Hop"},
	},
	t = { 
		name = "t-hop",
		["2"] = {"Bigram Hop"},
	},
	T = { 
		name = "T-hop",
		["2"] = {"Bigram Hop"},
	},
	d = {
		name = "diagnostics",
		["e"] = { "open float" },
		[ "[" ] = { "go to prev" },
		["]"] = { "go to next" },
		["s"] = { "toggle spell check" },
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
vim.api.nvim_set_keymap('', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>t', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>f2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>F2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>t2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>T2', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', '<leader>bK', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', '<leader>bgd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', '<leader>bgD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', '<leader>bgi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', '<leader>bgo', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', '<leader>bgr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', '<leader>b<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<leader>b<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<leader>b<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<leader>b<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap('n', '<leader>dgl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '<leader>d[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', '<leader>d]d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	bufmap('n', '<leader>f', '<cmd> vim.lsp.buf.formatting()<cr>')
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

require("cmp_nvim_ultisnips").setup{}

vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
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
    {name = 'ultisnips', keyword_length = 2},
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
        { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
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

EOF
