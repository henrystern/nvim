local M = {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
  },
}

function M.config()
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup {
    expand_lines = true,
    icons = { expanded = "", collapsed = "", circular = "" },
    controls = {
      enabled = true,
      element = "console",
    },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    layouts = {
      {
        elements = {
          { id = "stacks", size = 0.15 },
          { id = "breakpoints", size = 0.15 },
          { id = "scopes", size = 0.3 },
          { id = "watches", size = 0.25 },
        },
        size = 0.3,
        position = "left",
      },
      {
        elements = {
          { id = "console", size = 0.75 },
          { id = "repl", size = 0.25 },
        },
        size = 0.25,
        position = "bottom",
      },
    },
    floating = {
      max_height = 0.9,
      max_width = 0.5, -- Floats will be treated as percentage of your screen.
      border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
  }

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.fn.sign_define(
      "DapBreakpoint",
      { text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
  )
  vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
  )
  vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })
end

return M
