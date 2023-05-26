local M = {
  'quarto-dev/quarto-nvim',
  dev = false,
  ft = "quarto",
}

function M.config()
  closePreviewOnExit = true
  require 'quarto'.setup()
  local wk = require "which-key"
  wk.register(
    {
      q = {
        name = 'quarto',
        a = { ":QuartoActivate<cr>", 'activate' },
        p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
        q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
        h = { ":QuartoHelp ", 'help' },
        r = { name = 'run',
          r = { ':QuartoSendAbove<cr>', 'to cursor' },
          a = { ':QuartoSendAll<cr>', 'all' },
        },
        e = { ":lua require'otter'.export()<cr>", 'export' },
        E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
      },
    }, { mode = 'n', prefix = '<localleader>' }
  )
  wk.register({
    ['<m-->'] = { ' <- ', "assign" },
    ['<m-m>'] = { ' |>', "pipe" },
  }, { mode = 'i' })
end

return M
