local M = {
  'quarto-dev/quarto-nvim',
  dev = false,
  ft = "quarto",
}

function M.config()
  closePreviewOnExit = true
  require 'quarto'.setup()
end

return M
