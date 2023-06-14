local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")
local rep = require("luasnip.extras").rep

local get_node_at_cursor = require("nvim-treesitter.ts_utils").get_node_at_cursor

local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
  math_environment = true,
}

local utils = {}

utils.pipe = function(fns)
  return function(...)
    for _, fn in ipairs(fns) do
      if not fn(...) then
        return false
      end
    end
    return true
  end
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

utils.no_backslash = function(line_to_cursor)
  return not line_to_cursor:find("\\%+$", - #line_to_cursor)
end

-- utils.env = function(name)
-- local x, y = unpack(vim.fn["vimtex#env#is_inside"](name))
-- return x ~= "0" and y ~= "0"
-- todo port to treesitter
-- end

utils.with_priority = function(snip, priority)
  snip.priority = priority
  return snip
end

-- using the ultisnips settings flags
local s_w = ls.extend_decorator.apply(s, {}, { wordTrig = true })
local s_bw = ls.extend_decorator.apply(s, {}, { condition = conds.line_begin, wordTrig = true })
local s_math = ls.extend_decorator.apply(s, {}, { condition = utils.is_math })
local s_math_noslash = ls.extend_decorator.apply(s, {}, { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })
local s_bw_math = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ conds.line_begin, utils.is_math }), wordtrig = true })
local s_wr_math = ls.extend_decorator.apply(s, {}, { condition = utils.is_math, wordtrig = true, regTrig = true })
local s_w_math_noslash = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }), wordtrig = true })
local s_r_math_noslash = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }), regTrig = true })
local s_wr_math_noslash = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }), wordtrig = true, regTrig = true })


return {
  -- regular
}, {
  -- autosnippets
  s_w_math_noslash("sum", fmta(
    "\\sum_{n=<>}^{<>} <>",
    {
      i(1, "0"),
      i(2, "\\infty"),
      i(0),
    }
  )),
  s_w_math_noslash({trig = "lim", dscr="limit"}, fmta(
    "\\lim_{<> \\to <>} ",
    {
      i(1, "n"),
      i(2, "\\infty"),
    }
  )),
}
