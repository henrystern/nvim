local default_theme = "tokyonight-night"
local default_subtheme = "tokyonight-night"
local default_bg = "dark"

local M = { 
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "oxocarbon",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    name = "tokyonight-night",
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    name = "github",
  },
}

for _, v in pairs(M) do
	if v.name == default_theme then
		v.config = function()
      vim.opt.background = default_bg
      local status_ok, _ = pcall(vim.cmd.colorscheme, default_subtheme)
      if not status_ok then
        return
      end
      vim.api.nvim_set_keymap("n", "<leader>sc", "&background == 'light' ? ':set bg=dark<cr>' : ':set bg=light<cr>'", {expr = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>Telescope colorscheme<cr>", {silent = true})
		end
	end
end

return M
