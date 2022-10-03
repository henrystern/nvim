require("mason").setup()
require("mason-lspconfig").setup()

if vim.g.os == "Linux" then
	require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
elseif vim.g.os == "Windows" then
	require('dap-python').setup('~/AppData/local/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe')
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
	h = { "toggle highlighting" },
	["/"] = { "toggle comment" },
	d = {
		name = "diagnostics",
		["e"] = { "open float" },
		["["] = { "go to prev" },
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

require("nvim-tree").setup{
	sync_root_with_cwd = true,
}

vim.opt.termguicolors = true
require("bufferline").setup {
	options = {
		always_show_bufferline = false,
	}
}

require 'hop'.setup({
	keys = 'arstneiodhgm'
})

vim.api.nvim_create_autocmd('User', {
	pattern = 'LspAttached',
	desc = 'LSP actions',
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
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

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '' })

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
	{ border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require('cmp_nvim_lsp').update_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	),
	on_attach = function(client, bufnr)
		vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
	end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
	'force',
	lspconfig.util.default_config,
	lsp_defaults
)

require('lspconfig')['html'].setup {
	capabilities = capabilities,
}

require('lspconfig')['pyright'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}

require 'lspconfig'.vimls.setup {
	capabilities = capabilities,
}

require 'lspconfig'.texlab.setup {
	capabilities = capabilities,
}


require 'lspconfig'.r_language_server.setup {
	capabilities = capabilities,
}


require("cmp_nvim_ultisnips").setup {}

vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsRemoveSelectModeMappings = 0

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require('cmp')

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 3 },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'ultisnips', keyword_length = 1 },
		{ name = 'calc' },
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	formatting = {
		fields = { 'menu', 'abbr', 'kind' },
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
					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
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
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
				else
					fallback()
				end
			end
		}),
		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
		['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
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
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
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
