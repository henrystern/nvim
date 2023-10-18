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
}
