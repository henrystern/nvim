vim.treesitter.language.register("javascript", "ojs")

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = require "custom.utils.treesitters",
}
