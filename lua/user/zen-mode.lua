local M = {
  "folke/zen-mode.nvim",
  lazy = false,
  cmd = "ZenMode",
  -- dependencies = { "folke/twilight.nvim" },
}

function M.config()
  require("zen-mode").setup {
    window = {
      backdrop = .4,
      width = 90,
    },
    on_open = function() vim.o.background = "light" end,
    on_close = function() vim.o.background = "dark" end,
  }
  vim.api.nvim_set_keymap("n", "<leader>sz", "<cmd>ZenMode<cr>", {silent = true})
end

return M
