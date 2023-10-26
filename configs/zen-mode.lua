local config = require("..core.utils").load_config()

require("zen-mode").setup {
  window = {
    backdrop = 0.4,
    width = 90,
  },
  on_open = function()
    require("base46").toggle_theme()
  end,
  on_close = function()
    require("base46").toggle_theme()
  end,
}
