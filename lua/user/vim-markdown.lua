local M = {
  "preservim/vim-markdown",
  ft = "markdown",
}

function M.config()
  vim.g.vim_markdown_folding_disabled = true
end

return M
