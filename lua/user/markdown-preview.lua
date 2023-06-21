local M = {
  "iamcco/markdown-preview.nvim",
  ft = {"markdown", "quarto"},
  build = function() vim.fn["mkdp#util#install"]() end,
}

function M.config()
  local wk = require "which-key"
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_command_for_global = 0
  vim.g.mkdp_browser = 'firefox'
  vim.g.mkdp_filetypes = {"markdown", "quarto"}
  wk.register(
    {
      m = {
        name = 'markdown',
        t = { ":Toc<cr>", 'ToC' }, -- this isn't part of this plugin it is  from vim-markdown
        p = { ":MarkdownPreview<cr>", 'preview' },
      },
    }, { mode = 'n', prefix = '<localleader>' }
  )
end
  
return M
