require("quarto").setup {
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    languages = { "javascript", "r", "python", "julia", "bash", "ojs" },
    chunks = "curly", -- 'curly' or 'all'
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  keymap = {
    hover = "K",
    definition = "gd",
    rename = "<leader>lr",
    format = "<leader>lf",
    references = "gr",
  },
}
