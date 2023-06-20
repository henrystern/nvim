local M = {
  dir = "~/Sync/nvim-dev",
  ft = {"markdown", "rmarkdown", "quarto", "tex"},
}

function M.config()
  require("dev").setup()
end

return M
