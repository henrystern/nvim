local M = {
  "iurimateus/luasnip-latex-snippets.nvim",
  -- dir = vim.fn.stdpath("config") .. "/snips/luasnip-latex-snippets.nvim/",
  ft = {"markdown", "rmarkdown", "quarto", "tex"},
  dependencies = { "L3MON4D3/LuaSnip", "nvim-treesitter/nvim-treesitter" },
}

function M.config()
  require'luasnip-latex-snippets'.setup({ use_treesitter = true })
end

return M
