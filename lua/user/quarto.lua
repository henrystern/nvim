local M = {
  'quarto-dev/quarto-nvim',
  dev = false,
  ft = "quarto",
}

function M.config()
  closePreviewOnExit = true
end

return M
