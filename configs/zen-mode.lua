require("zen-mode").setup {
  window = {
    backdrop = 0.4,
    width = 90,
  },
  on_open = function()
    -- vim.o.background = "light"
    -- vim.g.mkdp_theme = "light"
  end,
  on_close = function()
    -- vim.o.background = "dark"
    -- vim.g.mkdp_theme = "dark"
  end,
}
