local M = {
  "AckslD/nvim-FeMaco.lua",
  ft = {"markdown", "quarto", "rmarkdown"},
}

function M.config()
  require('femaco').setup()
  local wk = require "which-key"
  wk.register(
    {
      q = {
        name = 'quarto',
        e = { ":FeMaco<cr>", 'Edit Block' },
      },
    }, { mode = 'n', prefix = '<localleader>' }
  )
end
  
return M
