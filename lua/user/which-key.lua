local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.setup {}
  -- normal mode
  wk.register({
    ['<M-j>'] = { "V:m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
    ['<M-k>'] = { "V:m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  }, { mode = 'v' })
  -- visual mode
  wk.register({
    ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
    ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  }, { mode = 'v' })
end

return M
