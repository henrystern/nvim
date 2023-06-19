-- Symlink this file to neovim/bin/lua/luasnip/
--   On windows:
--     mklink C:\Users\%username%\AppData\Local\Programs\Neovim\bin\lua\luasnip\utils.lua C:\Users\%username%\AppData\Local\nvim\snips\luasnippets\utils.lua
--   On linux:
--     sudo mkdir -p /usr/local/share/lua/5.1/luasnip/
--     sudo ln -s ~/.config/nvim/snips/luasnippets/utils.lua /usr/local/share/lua/5.1/luasnip/utils.lua

local get_node_at_cursor = require("nvim-treesitter.ts_utils").get_node_at_cursor
local ls = require "luasnip"
local sn = ls.snippet_node
local i = ls.insert_node

local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
  math_environment = true,
}

local utils = {}

-- https://github.com/iurimateus/luasnip-latex-snippets.nvim/blob/main/lua/luasnip-latex-snippets/util/utils.lua
function utils.pipe(fns)
  return function(...)
    for _, fn in ipairs(fns) do
      if not fn(...) then
        return false
      end
    end
    return true
  end
end

-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
function utils.get_visual(_, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

function utils.match_group(_, snip, chars)
  chars = chars == nil and { "(", ")" } or chars
  local match = snip.trigger
  local depth = 0
  local location = nil
  for index = (#match - 1), 1, -1 do
    local char = match:sub(index, index)
    if char == chars[2] then
      depth = depth + 1
    elseif char == chars[1] then
      depth = depth - 1
    end
    if depth == 0 then
      location = index
      break
    end
  end
  if chars[1] ~= " " and location == nil then
    -- if matching parenthesis not found imply one at each space
    --   ie.  x+1)/ -> \frac{x+1}{}
    return utils.match_group(_, snip, { " ", chars[2] })
  elseif location == nil then
    return string.format("\\frac{%s}", match:sub(1, #match - 2))
  elseif location == 1 then
    return string.format("\\frac{%s}", match:sub(location + 1, #match - 2))
  else
    return string.format("%s\\frac{%s}", match:sub(1, location - 1), match:sub(location + 1, #match - 2))
  end
end

function utils.get_capture(_, snip, num)
-- pass num with f(callback, {}, { user args = { num } })
  num = num == nil and 1 or num
  return snip.captures[num]
end

-- https://github.com/iurimateus/luasnip-latex-snippets.nvim/blob/main/lua/luasnip-latex-snippets/util/ts_utils.lua
function utils.is_math()
  local node = get_node_at_cursor()
  while node do
    if node:type() == "text_mode" then
      return false
    elseif MATH_NODES[node:type()] then
      -- set undo point
      vim.o.undolevels = vim.o.undolevels
      return true
    end
    node = node:parent()
  end
  return false
end

function utils.not_math()
  return not utils.is_math()
end

function utils.no_backslash(line_to_cursor, matched_trigger)
  -- this only works if the matched_trigger starts the same as the latex trigger.
  --   ie: sq -> \sqrt wouldnt expand on \sq but 
  --       rt -> \sqrt would expand on \sqrt to \sq\sqrt
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  local preceding_index = col - #matched_trigger
  return line_to_cursor:sub(preceding_index, preceding_index) ~= "\\"
end

return utils

-- I wrote this horrible function and then realised I could just change the trigger to a closing parenthesis
-- I spent too long on it to delete it so here it rests.
-- function utils.delete_autopair(_, snip)
--   -- delete the matching parenthesis created by the autopairs plugin and create an insert node instead
--   local _, col = unpack(vim.api.nvim_win_get_cursor(0))
--   local line = vim.api.nvim_get_current_line()
--   if col == #line then
--     col = col
--   elseif col == #line - 1 then
--     col = col - 1
--   else
--     col = col - 2
--   end
--   local char_0 = line:sub(col-1, col-1)
--   local char_1 = line:sub(col, col)
--   if char_0 == char_1 then
--     vim.cmd("normal " .. col .. "|x") -- go to column and delete char_1
--   end
--   return sn(nil, i(1))
-- end
