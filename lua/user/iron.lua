local M = {
  "vigemus/iron.nvim",
  event = "VeryLazy",
}

function M.config()
  local iron = require("iron.core")

  iron.setup {
    config = {
      highlight_last = "IronLastSent",
      scratch_repl = true,
      close_window_on_exit = true,
      repl_definition = {
        python = require("iron.fts.python").ipython
      },
      repl_open_cmd = require('iron.view').split(math.floor(vim.fn.winheight(0) / 3))
    },
    keymaps = {
      send_file = "<localleader>ta",
      send_line = "<localleader>td",
      visual_send = "<localleader>td",
      send_until_cursor = "<localleader>tu",
      send_motion = "<localleader>tt",
      send_mark = "<localleader>ts",
      mark_motion = "<localleader>t'",
      mark_visual = "<localleader>t'",
      remove_mark = "<localleader>t;",
      cr = "<localleader>t<cr>",
      interrupt = "<localleader>tq",
    },
    ignore_blank_lines = true,
  }

  vim.keymap.set('n', '<localleader>tf', '<cmd>IronRepl<cr>')
  vim.keymap.set('n', '<localleader>tf', '<cmd>IronRepl<cr>')
  vim.api.nvim_set_keymap("n", "<C-J>", "<localleader>td<CR>", {silent = true})
  vim.api.nvim_set_keymap("i", "<C-J>", "<Esc><localleader>tda", {silent = true})
  vim.api.nvim_set_keymap("v", "<C-J>", "<localleader>td<Esc>", {silent = true})
  vim.api.nvim_set_keymap("n", "<a-cr>", "<localleader>t<CR>", {silent = true})
end

return M

