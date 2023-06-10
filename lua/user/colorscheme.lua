local M = {
  -- "folke/tokyonight.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

-- M.name = "tokyonight-night"
M.name = "oxocarbon"
function M.config()
  vim.opt.background = "dark"
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
  vim.api.nvim_set_keymap("n", "<leader>sc", "&background == 'light' ? ':set bg=dark<cr>' : ':set bg=light<cr>'", {expr = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>Telescope colorscheme<cr>", {silent = true})
end

return M
