---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "bearded-arc", "onenord_light" },
  theme = "bearded-arc",
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
      { "  Themes", "Spc r h", "Telescope themes" },
      { "⚙  Config", "Spc r e", "Config" },
    },
  },
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      local _, c = unpack(vim.api.nvim_win_get_cursor(0))
      modules[11] = "c%c"
      table.insert(
        modules,
        5,
        (function()
          local loaded = require("lazy.core.config").plugins["orgmode"]._.loaded
          if loaded == nil then
            return ""
          end
          local active = orgmode.statusline()
          if active == "" then
            return ""
          end
          local relevant_index, _ = string.find(active, "%(", 2)
          return string.sub(active, relevant_index)
        end)()
      )
    end,
  },
  lsp = {
    signature = {
      disabled = true,
      silent = true,
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
