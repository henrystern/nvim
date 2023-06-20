local M = {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = function() vim.fn["mkdp#util#install"]() end,
}

function M.config()
  local wk = require "which-key"
  wk.register(
    {
      m = {
        name = 'markdown',
        t = { ":Toc<cr>", 'ToC' },
        p = { ":MarkdownPreview<cr>", 'preview' },
      },
    }, { mode = 'n', prefix = '<localleader>' }
  )
end
  
return M
