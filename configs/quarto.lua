require("quarto").setup {
  lspFeatures = {
    languages = { "javascript", "r", "python", "julia", "bash", "ojs" },
    chunks = "curly",
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  keymap = {
    hover = "<F20>",
    definition = "<F20>",
    rename = "<F20>",
    references = "<F20>",
  },
}
