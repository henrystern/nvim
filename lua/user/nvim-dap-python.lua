local M = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  lazy = true,
}

function M.config()
  require('dap-python').setup('~/Envs/nvim/Scripts/pythonw.exe')
end

return M
