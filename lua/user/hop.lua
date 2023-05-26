local M = {
  "phaazon/hop.nvim",
  event = "VeryLazy",
}

function M.config()
  local hop = require("hop")
  hop.setup({ keys = 'arstneiogmdkc,x.qwfpluy;bj'})
end

return M
