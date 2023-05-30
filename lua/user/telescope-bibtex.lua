local M = {
  "nvim-telescope/telescope-bibtex.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  init = function()
    require "telescope".load_extension("bibtex")
  end
}

return M
