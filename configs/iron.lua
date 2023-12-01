require("iron.core").setup {
  config = {
    highlight_last = "IronLastSent",
    scratch_repl = true,
    close_window_on_exit = true,
    repl_definition = {
      python = require("iron.fts.python").ipython,
    },
    repl_open_cmd = require("iron.view").split(math.floor(vim.fn.winheight(0) / 3)),
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
