---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },

  n = {
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<leader>ch"] = "",
    ["<leader>cm"] = "",
    ["<leader>fm"] = "",
    ["<leader>ft"] = "",
    ["<leader>fo"] = "",
    ["<leader>fb"] = "",
    ["<leader>ma"] = "",
    ["<leader>ph"] = "",
    ["<leader>pt"] = "",
    ["<leader>ra"] = "",
    ["<leader>rh"] = "",
    ["<leader>th"] = "",
    ["<leader>td"] = "",
    ["<leader>wa"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["<leader>b"] = "",
    ["K"] = "",
  },
}

M.general = {
  n = {
    ["<leader>q"] = { ":q<CR>", "Quit nvim" },
    ["<leader>w"] = { ":w<CR>", "Save buffer" },
    [";"] = { ":", "Enter Command Mode", opts = { nowait = true } },
    ["<leader>h"] = { "<cmd>nohlsearch<CR>", "Clear highlights" },
    ["<S-Up>"] = { ":resize -2<CR>", "Move buffer up" },
    ["<S-Down>"] = { ":resize +2<CR>", "Move buffer down" },
    ["<S-Left>"] = { ":vertical resize -2<CR>", "Move buffer left" },
    ["<S-Right>"] = { ":vertical resize +2<CR>", "Move buffer right" },
    ["<leader>n"] = { "<C-w><C-w>", "Change buffer" },
    ["<S-h>"] = { "<C-w>h", "Change buffer up" },
    ["<S-j>"] = { "<C-w>j", "Change buffer down" },
    ["<S-k>"] = { "<C-w>k", "Change buffer left" },
    ["<S-l>"] = { "<C-w>l", "Change buffer right" },
    ["<C-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["<C-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
    ["<C-k>"] = { ":-tabnext<CR>", "Previous tab" },
    ["<C-j>"] = { ":tabnext<CR>", "Next tab" },
    -- ["<leader>re"] = { ":e $MYVIMRC <CR>", "Edit config" },
    ["<leader>re"] = {
      function()
        local path = vim.fn.stdpath "config" .. "/lua/custom/plugins.lua"
        vim.cmd(":e " .. path)
      end,
      "Edit config",
    },
    ["<leader>rs"] = { ":lua require('luasnip.loaders').edit_snippet_files()<CR>", "Edit snippets" },
    ["<leader>rz"] = { "<cmd>ZenMode<cr>", "ZenMode" },
    ["<leader>rh"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    ["<M-j>"] = { "V:m'>+<cr>`<my`>mzgv`yo`z", "move line down" },
    ["<M-k>"] = { "V:m'<-2<cr>`>my`<mzgv`yo`z", "move line up" },
    ["<C-BS>"] = { "<Esc>cvb", "Delete word" },
  },

  i = {
    [","] = { ",<C-g>u", "Make breakpoint" },
    ["."] = { ".<C-g>u", "Make breakpoint" },
    [";"] = { ";<C-g>u", "Make breakpoint" },
    ["\\"] = { "\\<C-g>u", "Make breakpoint" },
    ["<C-l>"] = { "<c-g>u<Esc>m][s1z=`]a<c-g>u", "Correct typo" },
    ["<C-u>"] = { "<Esc>m][s1zg`]a", "Add typo to word list" },
  },

  v = {
    ["p"] = { "P" },
    ["y"] = { "ygv<esc>" },
    ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z", "move line down" },
    ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z", "move line up" },
  },

  t = {
    ["ii"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader><Tab>"] = { ":tabnew<CR>", "New tab" },
  },
}

M.lsp = {
  plugin = true,

  n = {
    ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format buffer" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Get declaration" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Get definition" },
    [","] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Get Implementation" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Get references" },
    ["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
    ["<leader>li"] = { "<cmd>LspInfo<cr>", "LspInfo" },
    ["<leader>lI"] = { "<cmd>Mason<cr>", "Mason" },
    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic" },
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous diagnostic" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    ["<leader>lq"] = { "<cmd>TroubleToggle<CR>", "TroubleToggle" },
    ["<leader>le"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
    ["<leader>lo"] = { "<cmd>SymbolsOutline<CR>", "Outline symbols" },
  },
}

M.dap = {
  plugin = true,

  n = {
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Start DAP" },
    ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "Start DAP" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    ["<F11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    ["<F10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    ["<S-F11>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "Stop DAP" },
    ["<leader>dwa"] = { "<cmd>lua require'dapui'.elements.watches.add()<cr>", "Watch variable" },
    ["<leader>dwr"] = { "<cmd>lua require'dapui'.elements.watches.remove()<cr>", "Unwatch variable" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>ft"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fs"] = { ":silent exec '!open https://detexify.kirelabs.org/classify.html'<CR>", "Detexify" },
  },

  i = {
    ["<C-f>"] = { "<esc>:Telescope symbols<CR>", "Find symbol" },
    ["@@"] = { "<esc>:Telescope bibtex<CR>", "Find citation" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },

  n = {
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    ["<leader>x"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
    ["<leader>gg"] = {
      function()
        local term = require("nvterm.terminal").new "float"
        vim.api.nvim_chan_send(term.job_id, "lazygit\r")
      end,
      "Open Lazygit",
    },
  },
}

M.quarto = {
  plugin = true,

  n = {
    ["<localleader>qp"] = { ":lua require'quarto'.quartoPreview()<cr>", "preview" },
    ["<localleader>qq"] = { ":lua require'quarto'.quartoClosePreview()<cr>", "close" },
  },
}

M.otter = {
  plugin = true,

  n = {
    [","] = { ":lua require'otter'.ask_hover()<cr>", "Otter hover", opts = { buffer = true } },
    ["gd"] = { ":lua require'otter'.ask_definition()<cr>", "Otter definition", opts = { buffer = true } },
    ["gr"] = { ":lua require'otter'.ask_references()<cr>", "Otter references", opts = { buffer = true } },
    ["gs"] = { ":lua require'otter'.ask_document_symbols()<cr>", "Otter symbols", opts = { buffer = true } },
    ["<leader>lr"] = { ":lua require'otter'.ask_rename()<cr>", "Otter rename", opts = { buffer = true } },
    ["<leader>lf"] = { ":lua require'otter'.ask_format()<cr>", "Otter format", opts = { buffer = true } },
  },
}

M.femaco = {
  plugin = true,

  n = {
    ["<localleader>qe"] = { ":FeMaco<cr>", "Edit Block" },
    ["M"] = {
      function()
        -- if floating window
        if vim.api.nvim_win_get_config(0).relative ~= "" then
          vim.cmd ":q"
        else
          require("femaco.edit").edit_code_block()
        end
      end,
      "Open Lazygit",
    },
  },
}

M.markdown_preview = {
  plugin = true,
  n = {
    ["<localleader>mp"] = { ":MarkdownPreview<CR>", "Preview" },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>p"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.r = {
  plugin = true,

  n = {
    ["<localleader>rm"] = { ":call RAction('rm')<CR>", "Clear variable" },
    ["<localleader>rM"] = { ":call RClearAll()<CR>", "Clear workspace" },
    ["<CR>"] = { ":call SendLineToR('down')<CR>" },
  },

  i = {
    ["<m-->"] = { " <- ", "assign" },
    ["<m-m>"] = { " |>", "pipe" },
  },
}

return M
