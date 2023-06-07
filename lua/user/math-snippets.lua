local M = {
  "iurimateus/luasnip-latex-snippets.nvim",
  ft = {"markdown", "rmarkdown", "quarto"},
  dependencies = { "L3MON4D3/LuaSnip", "nvim-treesitter/nvim-treesitter" },
}

function M.config()
  require'luasnip-latex-snippets'.setup({ use_treesitter = true })
end

return M
