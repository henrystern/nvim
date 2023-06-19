local M = {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
}

function M.config()
  require("better_escape").setup({
    mapping = {"ii"},
  })
end

return M
