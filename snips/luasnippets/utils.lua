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
  for index = (#match - 1), 1, -1 do
    if match:sub(index, index) == chars[2] then
      depth = depth + 1
    elseif match:sub(index, index) == chars[1] then
      depth = depth - 1
    end
    if depth == 0 then
      Location = index
      break
    end
  end
  -- if matching parenthesis not found imply one at each space
  --   ie.  x+1)/ -> \frac{x+1}{}
  if Location == nil and chars[1] ~= " " then
    return " " .. utils.match_group(_, snip, { " ", chars[2] })
  else
    return string.format("%s\\frac{%s}", match:sub(1, Location - 1), match:sub(Location + 1, #match - 2))
  end
end

-- pass num with f(callback, {}, { user args = { num } })
function utils.get_capture(_, snip, num)
  num = num == nil and 1 or num
  return snip.captures[num]
end

function utils.not_math(check_parent)
  local node = get_node_at_cursor()
  while node do
    if node:type() == "text_mode" then
      if check_parent then
        -- For \text{}
        local parent = node:parent()
        if parent and MATH_NODES[parent:type()] then
          return false
        end
      end

      return true
    elseif MATH_NODES[node:type()] then
      return false
    end
    node = node:parent()
  end
  return true
end

function utils.is_math()
  local node = get_node_at_cursor()
  while node do
    if node:type() == "text_mode" then
      return false
    elseif MATH_NODES[node:type()] then
      return true
    end
    node = node:parent()
  end
  return false
end

function utils.no_backslash()
  local line = vim.api.nvim_get_current_line()
  local _, c = unpack(vim.api.nvim_win_get_cursor(0))
  local line_to_cursor = string.sub(line, 1, c)
  return not string.find(line_to_cursor, "\\%S+ ?$")
end

return utils
