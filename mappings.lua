---@type MappingsTable
local M = {}

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
    ["<leader>re"] = { ":e $MYVIMRC <CR>", "Edit config" },
    ["<leader>rs"] = { ":lua require('luasnip.loaders').edit_snippet_files()<CR>", "Edit snippets" },
    ["<M-j>"] = { "V:m'>+<cr>`<my`>mzgv`yo`z", "move line down" },
    ["<M-k>"] = { "V:m'<-2<cr>`>my`<mzgv`yo`z", "move line up" },
    ["<leader>sz"] = { "<cmd>ZenMode<cr>", "ZenMode" },
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
    ["<leader><Tab>"] = { ":tabnext<CR>", "Next tab" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format buffer" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Get declaration" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Get definition" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
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

  v = {},
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

  i = {
    ["<m-->"] = { " <- ", "assign" },
    ["<m-m>"] = { " |>", "pipe" },
  },
}

M.femaco = {
  plugin = true,

  n = {
    ["<localleader>qe"] = { ":FeMaco<cr>", "Edit Block" },
  },
}

M.markdown_preview = {
  n = {
    ["<localleader>mp"] = { ":MarkdownPreview<CR>", "Preview" },
  },
}

return M
