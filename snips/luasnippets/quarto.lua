local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local rep = require("luasnip.extras").rep

local utils = require("luasnip.utils") -- ~\AppData\Local\Programs\Neovim\bin\lua\luasnip\utils.lua

-- using the ultisnips settings flags
-- put regTrig next to trig in snippet definition but lua doesn't have a complete regex library
local s_bw = ls.extend_decorator.apply(s, {}, { condition = conds.line_begin })
local s_w_no_math = ls.extend_decorator.apply(s, {}, { condition = utils.not_math })
local s_math = ls.extend_decorator.apply(s, { wordTrig = false }, { condition = utils.is_math })
local s_r_math = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true }, { condition = utils.is_math })
local s_math_noslash = ls.extend_decorator.apply(s, { wordTrig = false },
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })
local s_bw_math = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ conds.line_begin, utils.is_math }) })
local s_w_math = ls.extend_decorator.apply(s, {}, { condition = utils.is_math })
local s_w_math_noslash = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })
local s_wr_math_noslash = ls.extend_decorator.apply(s, { regTrig = true },
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })

return {
  -- regular
  s_w_math("lr", fmta("\\left( <> \\right", d(1, utils.get_visual))),
}, {
  -- autosnippets
  s_w_no_math("dm", fmta(
    [[
      $$
        <>
      $$
    ]],
    d(1, utils.get_visual)
  )),
  s_w_math("part", fmta("\\frac{\\partial <>}{\\partial <>} ", { i(1, "f"), i(2, "x") })),
  s_w_no_math("mk", fmta("$<>$", d(1, utils.get_visual))),
  s_math("std", fmta("_{<>}^{<>} ", { i(1), i(2) })),
  s_math("td", fmta("^{<>} ", { i(1) })),
  s_math("sd", fmta("_{<>} ", { i(1) })),
  s_math("rt", fmta("\\sqrt[<>]{<>} ", { i(1, "2"), i(2) })),
  s_math("gr", fmta("{<>} ", { i(1) })),
  s_math("cb", t("^3 ")),
  s_math("sr", t("^2 ")),
  s_math("sq", fmta("\\sqrt{<>} ", { i(1) })),
  s_math("EE", t("\\exists ")),
  s_math("AA", t("\\forall ")),
  s_math("xnn", t("x_{n} ")),
  s_math("ynn", t("y_{n} ")),
  s_math("xii", t("x_{i} ")),
  s_math("yii", t("y_{i} ")),
  s_math("xjj", t("x_{j} ")),
  s_math("yjj", t("y_{j} ")),
  s_math("RR", t("\\mathbb{R} ")),
  s_math("QQ", t("\\mathbb{Q} ")),
  s_math("ZZ", t("\\mathbb{Z} ")),
  s_math("NN", t("\\mathbb{N} ")),
  s_math("UU", t("\\cup ")),
  s_math("notin", t("\\not\\in ")),
  s_math("cc", t("\\subset ")),
  s_math("<->", t("\\leftrightarrow i")),
  s_math("...", t("\\ldots ")),
  s_math("!>", t("\\mapsto ")),
  s_math("//", fmta("\\frac{<>}{<>} ", { i(1), i(2) })),
  s_math("->", t("\\to ")),
  s_math("xx", t("\\times ")),
  s_math("**", t("\\cdot ")),
  s_math("!=", t("\\neq ")),
  s_math("~=", t("\\approx ")),
  s_math("===", t("\\equiv ")),
  s_math("compl", t("^{c} ")),
  s_math("=>", t("\\implies ")),
  s_math("=<", t("\\impliedby ")),
  s_math("<=", t("\\le ")),
  s_math(">=", t("\\ge ")),
  s_math("invs", t("^{-1} ")),
  s_math("__", fmta("_{<>} ", i(1))),
  s_math("tt", fmta("\\text{<>} ", { i(1) })),
  s_r_math("(%a)bar", fmta("\\overline{<>} ", { f(utils.get_capture) })),
  s_r_math("(%a)hat", fmta("\\hat{<>} ", { f(utils.get_capture) })),
  s_r_math("\\quad   ", t("\\qquad ")),
  s_r_math("^(.*[^%s].*)   ", fmta("<> \\quad ", { f(utils.get_capture) })),
  s_r_math(".*%)/", fmta("<>{<>} ", {
    f(function(_, snip)
      local match = snip.trigger
      local stripped = match:sub(1, #match - 1)

      i = #stripped
      local depth = 0
      while true do
        if stripped:sub(i, i) == ")" then
          depth = depth + 1
        end
        if stripped:sub(i, i) == "(" then
          depth = depth - 1
        end
        if depth == 0 then
          break
        end
        i = i - 1
      end

      local rv =
          string.format("%s\\frac{%s}", stripped:sub(1, i - 1), stripped:sub(i + 1, #stripped - 1))

      return rv
    end),
    i(1)
  })),
  s_r_math(".*%}/", fmta("<>{<>} ", {
    f(function(_, snip)
      local match = snip.trigger
      local stripped = match:sub(1, #match - 1)

      i = #stripped
      local depth = 0
      while true do
        if stripped:sub(i, i) == "}" then
          depth = depth + 1
        end
        if stripped:sub(i, i) == "{" then
          depth = depth - 1
        end
        if depth == 0 then
          break
        end
        i = i - 1
      end

      local rv =
          string.format("%s\\frac{%s}", stripped:sub(1, i - 1), stripped:sub(i + 1, #stripped - 1))

      return rv
    end),
    i(1)
  })),
  s_r_math("(\\?[%w]+\\?^%w)/", fmta("\\frac{<>}{<>} ", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?[%w]+\\?_%w)/", fmta("\\frac{<>}{<>} ", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?[%w]+\\?^{%w*})/", fmta("\\frac{<>}{<>} ", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?[%w]+\\?_{%w*})/", fmta("\\frac{<>}{<>} ", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?%w+)/", fmta("\\frac{<>}{<>} ", { f(utils.get_capture), i(1) })),
  s_w_math("pmat", fmta("\\begin{pmatrix} <> \\end{pmatrix} ", { i(1) })),
  s_w_math("bmat", fmta("\\begin{bmatrix} <> \\end{bmatrix} ", { i(1) })),
  s_w_math("lr(", fmta("\\left( <> \\right", d(1, utils.get_visual))),
  s_w_math("lr{", fmta("\\left\\{ <> \\right\\", d(1, utils.get_visual))),
  s_w_math("lr[", fmta("\\left[ <> \\right", d(1, utils.get_visual))),
  s_w_math("lr|", fmta("\\left| <> \\right| ", d(1, utils.get_visual))),
  s_w_math_noslash("iff", t("\\iff ")),
  s_w_math_noslash("hat", fmta("\\hat{<>} ", { d(1, utils.get_visual) })),
  s_w_math_noslash("bar", fmta("\\overline{<>} ", { d(1, utils.get_visual) })),
  s_w_math_noslash("abs", fmta("\\abs{<>} ", { d(1, utils.get_visual) })),
  s_w_math_noslash("inf", t("\\infty ")),
  s_w_math_noslash("sin", t("\\sin ")),
  s_w_math_noslash("cos", t("\\cos ")),
  s_w_math_noslash("tan", t("\\tan ")),
  s_w_math_noslash("csc", t("\\csc ")),
  s_w_math_noslash("sec", t("\\sec ")),
  s_w_math_noslash("cot", t("\\cot ")),
  s_w_math_noslash("binom", fmta("\\binom{<>}{<>} ", { i(1), i(2) })),
  s_w_math_noslash("ln", t("\\ln ")),
  s_w_math_noslash("log", t("\\log ")),
  s_w_math_noslash("exp", t("\\exp ")),
  s_w_math_noslash("star", t("\\star ")),
  s_w_math_noslash("perp", t("\\perp ")),
  s_w_math_noslash("int", fmta("\\int_{<>}^{<>} ", { i(1), i(2) })),
  s_w_math_noslash("arcsin", t("\\arcsin ")),
  s_w_math_noslash("arctan", t("\\arctan ")),
  s_w_math_noslash("arcsec", t("\\arcsec ")),
  s_w_math_noslash("lim", fmta("\\lim_{<> \\to <>} ", { i(1, "n"), i(2, "\\infty") })),
  s_w_math_noslash("sum", fmta("\\sum_{n=<>}^{<>} <>", { i(1, "0"), i(2, "\\infty"), i(0) })),
  s_w_math_noslash("prod", fmta("\\prod_{n=<>}^{<>} <>", { i(1, "0"), i(2, "\\infty"), i(0) })),
  s_wr_math_noslash("([aA]lpha)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([bB]eta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([gG]amma)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([dD]elta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([eE]psilon)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([zZ]eta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([eE]ta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([tT]heta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([iI]ota)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([kK]appa)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([lL]ambda)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([mM]u)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([nN]u)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([pP]i) ?", fmta("\\<> ", { f(utils.get_capture) })), -- question mark due to whichkey opening on i
  s_wr_math_noslash("([rR]ho)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([sS]igma)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([tT]au)", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([pP]hi) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([cC]hi) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([pP]si) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_wr_math_noslash("([oO]mega)", fmta("\\<> ", { f(utils.get_capture) })),
}
