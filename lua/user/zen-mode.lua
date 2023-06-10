local M = {
  "folke/zen-mode.nvim",
  lazy = false,
  opts = { window = { backdrop = 0 } }
}

function M.config()
  vim.api.nvim_set_keymap("n", "<leader>sz", "<cmd>ZenMode<cr>", {silent = true})
end

return M
