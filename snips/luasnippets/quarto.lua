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
local s_w_no_math = ls.extend_decorator.apply(s, {}, { condition = utils.not_math })
local s_bw_no_math = ls.extend_decorator.apply(s, {}, { condition = conds.line_begin })
local s_bwr_no_math = ls.extend_decorator.apply(s, {regTrig=true}, { condition = conds.line_begin })
local s_math = ls.extend_decorator.apply(s, { wordTrig = false }, { condition = utils.is_math })
local s_r_math = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true }, { condition = utils.is_math })
local s_math_noslash = ls.extend_decorator.apply(s, { wordTrig = false },
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })
local s_r_math_noslash = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true },
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })
local s_bw_math = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ conds.line_begin, utils.is_math }) })
local s_w_math = ls.extend_decorator.apply(s, {}, { condition = utils.is_math })
local s_w_math_noslash = ls.extend_decorator.apply(s, {},
  { condition = utils.pipe({ utils.is_math, utils.no_backslash }) })

return {
  -- regular
}, {
  -- autosnippets
  s_bw("begin{", fmta(
    [[
      \begin{<>}
        <>
      \end{<>
    ]],
    { i(1), i(2), rep(1) }
  s_bw_no_math(".div", fmta(
    [[
      ::: {<>}
      <>
      :::

    ]],
    {
      i(1),
      d(2, utils.get_visual)
    }
  )),
  s_bw_no_math(".call", fmta(
    [[
      ::: {.callout-<>}
      <>
      :::

    ]],
    {
      i(1, "note"),
      d(2, utils.get_visual)
    }
  )),
  s_bwr_no_math("#(%w*)-", fmta(
    [[
      ::: {#<>-<>}
      <>
      :::

    ]],
    {
      f(utils.get_capture),
      i(1),
      d(2, utils.get_visual)
    }
  )),
  s_bwr_no_math("%.(%S*) ", fmta(
    [[
      ::: {.<>}
      <>
      :::

    ]],
    {
      f(utils.get_capture),
      d(1, utils.get_visual)
    }
  )),
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
  s_math("part", fmta("\\frac{\\partial <>}{\\partial <>}", { i(1, "f"), i(2, "x") })),
  s_math("std", fmta("_{<>}^{<>}", { i(1), i(2) })),
  s_math("td", fmta("^{<>}", { i(1) })),
  s_math("sd", fmta("_{<>}", { i(1) })),
  s_w_math_noslash("rt", fmta("\\sqrt[<>]{<>}", { i(1, "2"), i(2) })),
  s_math("gr", fmta("{<>}", { i(1) })),
  s_math("cb", t("^3")),
  s_math("sr", t("^2")),
  s_math_noslash("sq", fmta("\\sqrt{<>}", { i(1) })),
  s_math("EE", t("\\exists ")),
  s_math("AA", t("\\forall ")),
  s_math("xnn", t("x_{n}")),
  s_math("ynn", t("y_{n}")),
  s_math("xjj", t("x_{j}")),
  s_math("yjj", t("y_{j}")),
  s_math("RR", t("\\mathbb{R}")),
  s_math("QQ", t("\\mathbb{Q}")),
  s_math("ZZ", t("\\mathbb{Z}")),
  s_math("NN", t("\\mathbb{N}")),
  s_math("nee", t("\\not\\in ")),
  s_math("ee", t("\\in ")),
  s_math("UU", t("\\cup ")),
  s_math("cc", t("\\subset ")),
  s_math("<->", t("\\leftrightarrow ")),
  s_math("...", t("\\ldots ")),
  s_math("!>", t("\\mapsto ")),
  s_math("//", fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  s_math("->", t("\\to ")),
  s_math("xx", t("\\times ")),
  s_math("**", t("\\cdot ")),
  s_math("!=", t("\\neq ")),
  s_math("~=", t("\\approx ")),
  s_math("===", t("\\equiv ")),
  s_math("compl", t("^{c}")),
  s_math("=>", t("\\implies ")),
  s_math("=<", t("\\impliedby ")),
  s_math("<=", t("\\le ")),
  s_math(">=", t("\\ge ")),
  s_math("invs", t("^{-1}")),
  s_math("__", fmta("_{<>}", i(1))),
  s_math("tt", fmta("\\text{<>}", { d(1, utils.get_visual) })),
  s_r_math("(%a)bar", fmta("\\overline{<>}", { f(utils.get_capture) })),
  s_r_math("(%a)hat", fmta("\\hat{<>}", { f(utils.get_capture) })),
  s_r_math("\\quad   ", t("\\qquad ")),
  s_r_math(".*%)/", fmta("<>{<>}", { f(utils.match_group), i(1) })),
  s_r_math(".*%}/", fmta("<>{<>}", { f(utils.match_group, {}, { user_args = { { "{", "}" } } }), i(1) })),
  s_r_math(".*%]/", fmta("<>{<>}", { f(utils.match_group, {}, { user_args = { { "[", "]" } } }), i(1) })),
  s_r_math("^(.*[^%s].*)   ", fmta("<> \\quad ", { f(utils.get_capture) })),
  s_r_math("(\\?[%w]+\\?^%w)/", fmta("\\frac{<>}{<>}", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?[%w]+\\?_%w)/", fmta("\\frac{<>}{<>}", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?[%w]+\\?^{%w*})/", fmta("\\frac{<>}{<>}", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?[%w]+\\?_{%w*})/", fmta("\\frac{<>}{<>}", { f(utils.get_capture), i(1) })),
  s_r_math("(\\?%w+)/", fmta("\\frac{<>}{<>}", { f(utils.get_capture), i(1) })),
  s_math("mat ", fmta("\\begin{matrix} <> \\end{matrix}", { i(1) })),
  s_math("mat)", fmta("\\begin{pmatrix} <> \\end{pmatrix}", { i(1) })),
  s_math("mat]", fmta("\\begin{bmatrix} <> \\end{bmatrix}", { i(1) })),
  s_math("mat}", fmta("\\begin{Bmatrix} <> \\end{Bmatrix}", { i(1) })),
  s_math("lr ", fmta("\\left( <> \\right)", { d(1, utils.get_visual) })),
  s_math("lr)", fmta("\\left( <> \\right)", { d(1, utils.get_visual) })),
  s_math("lr]", fmta("\\left[ <> \\right]", d(1, utils.get_visual))),
  s_math("lr}", fmta("\\left\\{ <> \\right\\}", d(1, utils.get_visual))),
  s_math("lr|", fmta("\\left| <> \\right|", d(1, utils.get_visual))),
  s_math_noslash("iff", t("\\iff ")),
  s_math_noslash("hat", fmta("\\hat{<>}", { d(1, utils.get_visual) })),
  s_math_noslash("bar", fmta("\\overline{<>}", { d(1, utils.get_visual) })),
  s_math_noslash("abs", fmta("\\abs{<>}", { d(1, utils.get_visual) })),
  s_math_noslash("inf", t("\\infty ")),
  s_math_noslash("sin", t("\\sin ")),
  s_math_noslash("cos", t("\\cos ")),
  s_math_noslash("tan", t("\\tan ")),
  s_math_noslash("csc", t("\\csc ")),
  s_math_noslash("sec", t("\\sec ")),
  s_math_noslash("cot", t("\\cot ")),
  s_math_noslash("binom", fmta("\\binom{<>}{<>}", { i(1), i(2) })),
  s_math_noslash("ln", t("\\ln ")),
  s_math_noslash("log", t("\\log ")),
  s_math_noslash("exp", t("\\exp ")),
  s_math_noslash("star", t("\\star ")),
  s_math_noslash("perp", t("\\perp ")),
  s_math_noslash("int", fmta("\\int_{<>}^{<>}", { i(1), i(2) })),
  s_math_noslash("arcsin", t("\\arcsin ")),
  s_math_noslash("arctan", t("\\arctan ")),
  s_math_noslash("arcsec", t("\\arcsec ")),
  s_math_noslash("lim", fmta("\\lim_{<> \\to <>}", { i(1, "n"), i(2, "\\infty") })),
  s_math_noslash("sum", fmta("\\sum_{<>}^{<>}<>", { i(1, "n=0"), i(2, "\\infty"), i(0) })),
  s_math_noslash("prod", fmta("\\prod_{<>}^{<>}<>", { i(1, "n=0"), i(2, "\\infty"), i(0) })),
  s_math_noslash(";a", t("\\alpha ")),
  s_math_noslash(";A", t("\\Alpha ")),
  s_math_noslash(";b", t("\\beta ")),
  s_math_noslash(";B", t("\\beta ")),
  s_math_noslash(";d", t("\\delta ")),
  s_math_noslash(";D", t("\\Delta ")),
  s_math_noslash(";e", t("\\epsilon ")),
  s_math_noslash(";E", t("\\varepsilon ")),
  s_math_noslash(";t", t("\\theta ")),
  s_math_noslash(";T", t("\\Theta ")),
  s_math_noslash(";l", t("\\lambda ")),
  s_math_noslash(";L", t("\\Lambda ")),
  s_math_noslash(";s", t("\\sigma ")),
  s_math_noslash(";S", t("\\Sigma ")),
  s_r_math_noslash("([aA]lpha)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([bB]eta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([gG]amma)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([dD]elta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([eE]psilon)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([zZ]eta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([eE]ta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([tT]heta)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([iI]ota)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([kK]appa)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([lL]ambda)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([mM]u)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([nN]u)", fmta("\\<> ", { f(utils.get_capture) })),
  -- question mark is only because I use ii to escape insert mode causing which-key to interupt luasnip.
  s_r_math_noslash("([pP]i) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([rR]ho)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([sS]igma)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([tT]au)", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([pP]hi) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([cC]hi) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([pP]si) ?", fmta("\\<> ", { f(utils.get_capture) })),
  s_r_math_noslash("([oO]mega)", fmta("\\<> ", { f(utils.get_capture) })),
}
