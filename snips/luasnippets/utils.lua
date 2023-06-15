-- Symlink this file to neovim/bin/lua/luasnip/
--   On windows: ~/AppData/Local/Programs/Neovim/bin/lua/luasnip/utils.lua

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
function utils.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

-- pass num with user args
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

function utils.no_backslash(line_to_cursor)
  return not line_to_cursor:find("\\%+$", - #line_to_cursor)
end

-- utils.env = function(name)
-- local x, y = unpack(vim.fn["vimtex#env#is_inside"](name))
-- return x ~= "0" and y ~= "0"
-- todo port to treesitter
-- end

function utils.with_priority(snip, priority)
  snip.priority = priority
  return snip
end

return utils
