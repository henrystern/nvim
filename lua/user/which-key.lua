local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.setup {}
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
    }, { mode = 'n', prefix = '\\' }
  )

  -- visual mode
  wk.register({
    ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
    ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  }, { mode = 'v' })

  wk.register({
    ['<m-->'] = { ' <- ', "assign" },
    ['<m-m>'] = { ' |>', "pipe" },
  }, { mode = 'i' })
end

return M
