local M = {
  "iamcco/markdown-preview.nvim",
  ft = {"markdown", "quarto"},
  build = function() vim.fn["mkdp#util#install"]() end,
}

function M.config()
  local wk = require "which-key"
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_command_for_global = 0
  vim.g.mkdp_filetypes = {"markdown", "quarto"}
  vim.g.mkdp_browser = 'firefox'
  vim.g.mkdp_page_title = '${name} - Live Preview'
  wk.register(
    {
      m = {
        name = 'markdown',
        p = { ":MarkdownPreview<cr>", 'preview' },
      },
    }, { mode = 'n', prefix = '<localleader>' }
  )
end
  
return M
