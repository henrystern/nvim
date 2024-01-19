local math_utils = require "luasnip-md-utils.math-utils"
local md = require "luasnip-md-utils.nodes"
local conds = require "luasnip.extras.expand_conditions"

return {
  -- regular
}, {
  -- autosnippets

  -- Environments
  md.b_no_math(
    "beg",
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
    ]],
      { i(1), dl(2, l.LS_SELECT_RAW), rep(1) }
    )
  ),
  md.b_math(
    "beg",
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
    ]],
      { i(1), dl(2, l.LS_SELECT_RAW), rep(1) }
    )
  ),
  md.b_no_math(
    "ali",
    fmta(
      [[
      \begin{align}
        <>
      \end{align}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  md.b_math(
    "case",
    fmta(
      [[
      \begin{cases}
        <>
      \end{cases}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  md.math(
    "split",
    fmta(
      [[
      \begin{split}
        <>
      \end{split}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  md.math(
    "gather",
    fmta(
      [[
      \begin{gather}
        <>
      \end{gather}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  md.no_math(
    "#dm",
    fmta(
      [[
      $$
        <>
      $$ {#eq-<>}
    ]],
      { dl(1, l.LS_SELECT_RAW), i(2, "noref") }
    )
  ),
  md.no_math(
    "dm",
    fmta(
      [[
      $$\begin{aligned}
        <>
      \end{aligned}$$
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  md.no_math("mk", fmta("$<>$", dl(1, l.LS_SELECT_RAW))),

  -- Symbols
  md.A_math(";a", t "\\alpha "),
  md.A_math(";A", t "\\Alpha "),
  md.A_math(";b", t "\\beta "),
  md.A_math(";B", t "\\beta "),
  md.A_math(";d", t "\\delta "),
  md.A_math(";D", t "\\Delta "),
  md.A_math(";e", t "\\epsilon "),
  md.A_math(";E", t "\\varepsilon "),
  md.A_math(";t", t "\\theta "),
  md.A_math(";T", t "\\Theta "),
  md.A_math(";l", t "\\lambda "),
  md.A_math(";L", t "\\Lambda "),
  md.A_math(";s", t "\\sigma "),
  md.A_math(";S", t "\\Sigma "),
  md.A_math("EE", t "\\exists "),
  md.A_math("AA", t "\\forall "),
  md.A_math("RR", t "\\mathbb{R}"),
  md.A_math("QQ", t "\\mathbb{Q}"),
  md.A_math("ZZ", t "\\mathbb{Z}"),
  md.A_math("NN", t "\\mathbb{N}"),
  md.A_math("ee", t "\\in "),
  md.A_math("UU", t "\\cup "),
  md.A_math("cc", t "\\subset "),
  md.A_math("<->", t "\\leftrightarrow "),
  md.A_math("...", t "\\ldots "),
  md.A_math("!>", t "\\mapsto "),
  md.A_math("->", t "\\to "),
  md.A_math("xx", t "\\times "),
  md.A_math("**", t "\\cdot "),
  md.A_math("!=", t "\\neq "),
  md.A_math("~=", t "\\approx "),
  md.A_math("===", t "\\equiv "),
  md.A_math("=>", t "\\implies "),
  md.A_math("=<", t "\\impliedby "),
  md.A_math("<=", t "\\le "),
  md.A_math(">=", t "\\ge "),
  md.A_math(" or", t " \\vee "),
  md.A_math(" and", t " \\wedge "),

  -- Shortcuts
  md.math("nd", t "&"),
  md.A_math("gr", fmta("{<>}", { i(1) })),
  md.A_math("std", fmta("_{<>}^{<>}", { i(1), i(2) })),
  md.A_math("td", fmta("^{<>}", { i(1) })),
  md.A_math("ss", fmta("_{<>}", { i(1) })),
  md.A_math("__", fmta("_{<>}", i(1))),
  md.A_math("cb", t "^3"),
  md.A_math("sr", t "^2"),
  md.A_math("xnn", t "x_{n}"),
  md.A_math("ynn", t "y_{n}"),
  md.A_math("xjj", t "x_{j}"),
  md.A_math("yjj", t "y_{j}"),
  md.A_math("nee", t "\\not\\in "),
  md.A_math("//", fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  md.A_math("compl", t "^{c}"),
  md.A_math("inv", t "^{-1}"),
  md.A_math("mat ", fmta("\\begin{matrix} <> \\end{matrix}", { i(1) })),
  md.A_math("mat)", fmta("\\begin{pmatrix} <> \\end{pmatrix}", { i(1) })),
  md.A_math("mat]", fmta("\\begin{bmatrix} <> \\end{bmatrix}", { i(1) })),
  md.A_math("mat}", fmta("\\begin{Bmatrix} <> \\end{Bmatrix}", { i(1) })),
  md.A_math("mat|", fmta("\\begin{vmatrix} <> \\end{vmatrix}", { i(1) })),
  md.A_math("lr ", fmta("\\left <> \\right", { dl(1, l.LS_SELECT_RAW) })),
  md.A_math("lr)", fmta("\\left( <> \\right)", { dl(1, l.LS_SELECT_RAW) })),
  md.A_math("lr]", fmta("\\left[ <> \\right]", dl(1, l.LS_SELECT_RAW))),
  md.A_math("lr}", fmta("\\left\\{ <> \\right\\}", dl(1, l.LS_SELECT_RAW))),
  md.A_math("lr|", fmta("\\left| <> \\right|", dl(1, l.LS_SELECT_RAW))),
  md.Ar_math("dd(%a)", fmta("\\frac{d}{d<>}", { l(l.CAPTURE1) })),
  md.Ar_math("d(%a)d(%a)", fmta("\\frac{d<>}{d<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.Ar_math("(%a)vec", fmta("\\vec{<>}", { l(l.CAPTURE1) })),
  md.Ar_math(
    "(.*%))vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\vec{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%})vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\vec{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%])vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\vec{%s}" } }) })
  ),
  md.Ar_math("(%a)(%d)", fmta("<>_{<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.Ar_math("(%a)bar", fmta("\\overline{<>}", { l(l.CAPTURE1) })),
  md.Ar_math("(%a)hat", fmta("\\hat{<>}", { l(l.CAPTURE1) })),
  md.Ar_math(
    "(.*%))bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\overline{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%})bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\overline{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%])bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\overline{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%))hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\hat{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%})hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\hat{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%])hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\hat{%s}" } }) })
  ),
  md.Ar_math(
    "(.*%))/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\frac{%s}" } }), i(1) })
  ),
  md.Ar_math(
    "(.*%})/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\frac{%s}" } }), i(1) })
  ),
  md.Ar_math(
    "(.*%])/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\frac{%s}" } }), i(1) })
  ),
  md.Ar_math("(\\?[%w]+\\?^%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.Ar_math("(\\?[%w]+\\?_%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.Ar_math("(\\?[%w]+\\?^{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.Ar_math("(\\?[%w]+\\?_{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.Ar_math("(\\?%w+)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),

  -- Styling
  md.A_math("box", fmta("\\boxed{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.A_math("}utt", fmta("\\underbrace{<>}_{\\text{<>}}", { dl(1, l.LS_SELECT_RAW), i(2) })),
  md.A_math("utt", fmta("\\underset{\\text{<>}}{<>}", { i(1), dl(2, l.LS_SELECT_RAW) })),
  md.A_math("tt", fmta("\\text{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.A_math("ta", fmta("\\tag{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.A_math("\\quad   ", t "\\qquad "),
  -- four consecutive spaces -> \quad
  md.Ar_math("^(.*[^%s].*)   ", fmta("<> \\quad ", { l(l.CAPTURE1) })),

  -- Auto backslash (one regex entry for if no starting \ and another for if at beginning of line)
  md.Ar_math("([^\\])sq", fmta("<>\\sqrt[]{<>}", { l(l.CAPTURE1), i(1) })),
  md.b_math("sq", fmta("\\sqrt[]{<>}", { i(1) })),
  md.Ar_math("([^\\])hat", fmta("<>\\hat{<>}", { l(l.CAPTURE1), dl(1, l.LS_SELECT_RAW) })),
  md.b_math("hat", fmta("\\hat{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.Ar_math("([^\\])bar", fmta("<>\\overline{<>}", { l(l.CAPTURE1), dl(1, l.LS_SELECT_RAW) })),
  md.b_math("bar", fmta("\\overline{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.Ar_math("([^\\])abs", fmta("<>\\abs{<>}", { l(l.CAPTURE1), dl(1, l.LS_SELECT_RAW) })),
  md.b_math("abs", fmta("\\abs{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.Ar_math("([^\\])binom", fmta("<>\\binom{<>}{<>}", { l(l.CAPTURE1), i(1), i(2) })),
  md.b_math("binom", fmta("\\binom{<>}{<>}", { i(1), i(2) })),
  md.Ar_math("([^\\])lim", fmta("<>\\lim_{<>\\ \\to\\ <>}", { l(l.CAPTURE1), i(1, "n"), i(2, "\\infty") })),
  md.b_math("lim", fmta("\\lim_{<> \\to <>}", { i(1, "n"), i(2, "\\infty") })),
  md.Ar_math("([^\\])sum", fmta("<>\\sum_{<>}^{<>}", { l(l.CAPTURE1), i(1, "n=0"), i(2, "\\infty") })),
  md.b_math("sum", fmta("\\sum_{<>}^{<>}", { i(1, "n=0"), i(2, "\\infty") })),
  md.Ar_math("([^\\])prod", fmta("<>\\prod_{<>}^{<>}", { l(l.CAPTURE1), i(1, "n=0"), i(2, "\\infty") })),
  md.b_math("prod", fmta("\\prod_{<>}^{<>}", { i(1, "n=0"), i(2, "\\infty") })),
  md.Ar_math("([^\\])part", fmta("<>\\frac{\\partial <>}{\\partial <>}", { l(l.CAPTURE1), i(1, "f"), i(2, "x") })),
  md.b_math("part", fmta("\\frac{\\partial <>}{\\partial <>}", { i(1, "f"), i(2, "x") })),
  md.Ar_math("([^\\])QED", fmta("<> \\quad \\blacksquare", { l(l.CAPTURE1) })),
  md.b_math("QED", t "\\blacksquare \\quad "),
  md.Ar_math("([^\\])iff", fmta("<>\\iff ", { l(l.CAPTURE1) })),
  md.b_math("iff", t "\\iff "),
  md.Ar_math("([^\\])inf", fmta("<>\\infty ", { l(l.CAPTURE1) })),
  md.b_math("inf", t "\\infty "),
  md.Ar_math("([^\\])sin", fmta("<>\\sin ", { l(l.CAPTURE1) })),
  md.b_math("sin", t "\\sin "),
  md.Ar_math("([^\\])cos", fmta("<>\\cos ", { l(l.CAPTURE1) })),
  md.b_math("cos", t "\\cos "),
  md.Ar_math("([^\\])tan", fmta("<>\\tan ", { l(l.CAPTURE1) })),
  md.b_math("tan", t "\\tan "),
  md.Ar_math("([^\\])csc", fmta("<>\\csc ", { l(l.CAPTURE1) })),
  md.b_math("csc", t "\\csc "),
  md.Ar_math("([^\\])sec", fmta("<>\\sec ", { l(l.CAPTURE1) })),
  md.b_math("sec", t "\\sec "),
  md.Ar_math("([^\\])cot", fmta("<>\\cot ", { l(l.CAPTURE1) })),
  md.b_math("cot", t "\\cot "),
  md.Ar_math("([^\\])ln", fmta("<>\\ln ", { l(l.CAPTURE1) })),
  md.b_math("ln", t "\\ln "),
  md.Ar_math("([^\\])log", fmta("<>\\log ", { l(l.CAPTURE1) })),
  md.b_math("log", t "\\log "),
  md.Ar_math("([^\\])exp", fmta("<>\\exp ", { l(l.CAPTURE1) })),
  md.b_math("exp", t "\\exp "),
  md.Ar_math("([^\\])star", fmta("<>\\star ", { l(l.CAPTURE1) })),
  md.b_math("star", t "\\star "),
  md.Ar_math("([^\\])perp", fmta("<>\\perp ", { l(l.CAPTURE1) })),
  md.b_math("perp", t "\\perp "),
  md.Ar_math("([^\\])int", fmta("<>\\int", { l(l.CAPTURE1) })),
  md.b_math("int", t "\\int"),
  md.Ar_math("([^\\])arcsin", fmta("<>\\arcsin ", { l(l.CAPTURE1) })),
  md.b_math("arcsin", t "\\arcsin "),
  md.Ar_math("([^\\])arctan", fmta("<>\\arctan ", { l(l.CAPTURE1) })),
  md.b_math("arctan", t "\\arctan "),
  md.Ar_math("([^\\])arcsec", fmta("<>\\arcsec ", { l(l.CAPTURE1) })),
  md.b_math("arcsec", t "\\arcsec "),
  md.Ar_math("([^\\])nab", fmta("<>\\nabla ", { l(l.CAPTURE1) })),
  md.b_math("nab", t "\\nabla "),
  md.Ar_math("([^\\])([aA]lpha)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([aA]lpha)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([bB]eta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([bB]eta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([gG]amma)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([gG]amma)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([dD]elta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([dD]elta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([eE]psilon)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([eE]psilon)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([zZ]eta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([zZ]eta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([tT]heta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([tT]heta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^bBhzZ\\])([eE]ta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([^bBhzZ\\])([eE]ta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([iI]ota)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([iI]ota)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([kK]appa)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([kK]appa)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([lL]ambda)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([lL]ambda)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([mM]u)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([mM]u)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([nN]u)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([nN]u)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([pP]i)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([pP]i) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([rR]ho)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([rR]ho)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([sS]igma)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([sS]igma)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([tT]au)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([tT]au)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([pP]hi)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([pP]hi) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([cC]hi)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([cC]hi) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([pP]si)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([pP]si) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.Ar_math("([^\\])([oO]mega)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.br_math("([oO]mega)", fmta("\\<> ", { l(l.CAPTURE1) })),
}
