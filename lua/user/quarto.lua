local M = {
  'quarto-dev/quarto-nvim',
  dev = false,
  ft = "quarto",
}

function M.config()
  require'quarto'.setup{
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      languages = { 'javascript', 'r', 'python', 'julia', 'bash', 'ojs' },
      chunks = 'curly', -- 'curly' or 'all'
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" }
      },
      completion = {
        enabled = true,
      },
    },
    keymap = {
      hover = 'K',
      definition = 'gd',
      rename = '<leader>lr',
      references = 'gr',
    }
  }
  local wk = require "which-key"
  wk.register({
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
      E = { ":lua require'otter'.export()<cr>", 'export' },
    },
  }, { mode = 'n', prefix = '<localleader>' })
  wk.register({
    ['<m-->'] = { ' <- ', "assign" },
    ['<m-m>'] = { ' |>', "pipe" },
  }, { mode = 'i' })
  wk.register({
    s = {
      name = "spellcheck",
      s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
      ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
      n = { ']s', 'next' },
      p = { '[s', 'previous' },
      g = { 'zg', 'good' },
      r = { 'zg', 'right' },
      w = { 'zw', 'wrong' },
      b = { 'zw', 'bad' },
      ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
    },
  }, { mode = 'n', prefix = '<leader>' })

  local ls = require "luasnip"
  ls.filetype_extend("quarto", {"markdown"})
end

return M
