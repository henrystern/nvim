local M = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
  },
  lazy = true,
}

function M.config()
  require('dap-python').setup('~/Envs/nvim/Scripts/pythonw.exe')
end

return M
