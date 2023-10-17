---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "tokyodark", "tokyonight" },
  theme = "tokyodark",
  nvdash = {
    load_on_startup = true,
    header = {
      [[   _     _      _     _      _     _      _     _      _     _   ]],
      [[  (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)  ]],
      [[   / ._. \      / ._. \      / ._. \      / ._. \      / ._. \   ]],
      [[ __\( H )/__  __\( E )/__  __\( N )/__  __\( R )/__  __\( Y )/__ ]],
      [[(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)]],
      [[   || S ||      || T ||      || E ||      || R ||      || N ||   ]],
      [[ _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._ ]],
      [[(.-./`-'\.-.)(.-./`-`\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-`\.-.)]],
      [[ `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-' ]],
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f t", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      { "⚙  Config", "Spc r e", "Config" },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
