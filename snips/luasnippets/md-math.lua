local math_utils = require("luasnip-md-utils.math-utils")
local md = require("luasnip-md-utils.nodes")

return {
  -- regular
}, {
  -- autosnippets
  md.bw("beg", fmta(
    [[
      \begin{<>}
        <>
      \end{<>}
    ]],
    { i(1), dl(2, l.LS_SELECT_RAW), rep(1) }
  )),
  md.bw_math("ali", fmta(
    [[
      \begin{align}
        <>
      \end{align}
    ]],
    dl(1, l.LS_SELECT_RAW)
  )),
  md.w_math("case", fmta(
    [[
      \begin{cases}
        <>
      \end{cases}
    ]],
    dl(1, l.LS_SELECT_RAW)
  )),
  md.w_math("split", fmta(
    [[
      \begin{split}
        <>
      \end{split}
    ]],
    dl(1, l.LS_SELECT_RAW)
  )),
  md.w_no_math("#dm", fmta(
    [[
      $$
        <>
      $$ {#eq-<>}

    ]],
      { dl(1, l.LS_SELECT_RAW), i(2, "noref") }
  )),
  md.w_no_math("dm", fmta(
    [[
      $$
        <>
      $$

    ]],
    dl(1, l.LS_SELECT_RAW)
  )),
  md.w_no_math("mk", fmta("$<>$", dl(1, l.LS_SELECT_RAW))),
  md.math(";a", t("\\alpha ")),
  md.math(";A", t("\\Alpha ")),
  md.math(";b", t("\\beta ")),
  md.math(";B", t("\\beta ")),
  md.math(";d", t("\\delta ")),
  md.math(";D", t("\\Delta ")),
  md.math(";e", t("\\epsilon ")),
  md.math(";E", t("\\varepsilon ")),
  md.math(";t", t("\\theta ")),
  md.math(";T", t("\\Theta ")),
  md.math(";l", t("\\lambda ")),
  md.math(";L", t("\\Lambda ")),
  md.math(";s", t("\\sigma ")),
  md.math(";S", t("\\Sigma ")),
  md.math("std", fmta("_{<>}^{<>}", { i(1), i(2) })),
  md.math("td", fmta("^{<>}", { i(1) })),
  md.math("ss", fmta("_{<>}", { i(1) })),
  md.math("gr", fmta("{<>}", { i(1) })),
  md.math("cb", t("^3")),
  md.math("sr", t("^2")),
  md.math("EE", t("\\exists ")),
  md.math("AA", t("\\forall ")),
  md.math("xnn", t("x_{n}")),
  md.math("ynn", t("y_{n}")),
  md.math("xjj", t("x_{j}")),
  md.math("yjj", t("y_{j}")),
  md.math("RR", t("\\mathbb{R}")),
  md.math("QQ", t("\\mathbb{Q}")),
  md.math("ZZ", t("\\mathbb{Z}")),
  md.math("NN", t("\\mathbb{N}")),
  md.math("nee", t("\\not\\in ")),
  md.math("!ee", t("\\not\\in ")),
  md.math("ee", t("\\in ")),
  md.math("UU", t("\\cup ")),
  md.math("cc", t("\\subset ")),
  md.math("<->", t("\\leftrightarrow ")),
  md.math("...", t("\\ldots ")),
  md.math("!>", t("\\mapsto ")),
  md.math("//", fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  md.math("->", t("\\to ")),
  md.math("xx", t("\\times ")),
  md.math("**", t("\\cdot ")),
  md.math("!=", t("\\neq ")),
  md.math("~=", t("\\approx ")),
  md.math("===", t("\\equiv ")),
  md.math("compl", t("^{c}")),
  md.math("=>", t("\\implies ")),
  md.math("=<", t("\\impliedby ")),
  md.math("<=", t("\\le ")),
  md.math(">=", t("\\ge ")),
  md.math("inv", t("^{-1}")),
  md.math("__", fmta("_{<>}", i(1))),
  md.math("}utt", fmta("\\underbrace{<>}_{\\text{<>}}", { dl(1, l.LS_SELECT_RAW), i(2) })),
  md.math("utt", fmta("\\underset{\\text{<>}}{<>}", { i(1), dl(2, l.LS_SELECT_RAW) })),
  md.math("tt", fmta("\\text{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.math("mat ", fmta("\\begin{matrix} <> \\end{matrix}", { i(1) })),
  md.math("mat)", fmta("\\begin{pmatrix} <> \\end{pmatrix}", { i(1) })),
  md.math("mat]", fmta("\\begin{bmatrix} <> \\end{bmatrix}", { i(1) })),
  md.math("mat}", fmta("\\begin{Bmatrix} <> \\end{Bmatrix}", { i(1) })),
  md.math("mat|", fmta("\\begin{vmatrix} <> \\end{vmatrix}", { i(1) })),
  md.math("lr ", fmta("\\left( <> \\right)", { dl(1, l.LS_SELECT_RAW) })),
  md.math("lr)", fmta("\\left( <> \\right)", { dl(1, l.LS_SELECT_RAW) })),
  md.math("lr]", fmta("\\left[ <> \\right]", dl(1, l.LS_SELECT_RAW))),
  md.math("lr}", fmta("\\left\\{ <> \\right\\}", dl(1, l.LS_SELECT_RAW))),
  md.math("lr|", fmta("\\left| <> \\right|", dl(1, l.LS_SELECT_RAW))),
  md.math("\\quad   ", t("\\qquad ")),
  md.w_math("nd", t("&")),
  md.r_math("d(%a)d(%a)", fmta("\\frac{d<>}{d<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.r_math("(%a)vec", fmta("\\vec{<>}", { l(l.CAPTURE1) })),
  md.r_math("(.*%))vec", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")"}, "%s\\vec{%s}" }}) })),
  md.r_math("(.*%})vec", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}"}, "%s\\vec{%s}" }}) })),
  md.r_math("(.*%])vec", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]"}, "%s\\vec{%s}" }}) })),
  md.r_math("(%a)bar", fmta("\\overline{<>}", { l(l.CAPTURE1) })),
  md.r_math("(%a)hat", fmta("\\hat{<>}", { l(l.CAPTURE1) })),
  md.r_math("(.*%))bar", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")"}, "%s\\overline{%s}" }}) })),
  md.r_math("(.*%})bar", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}"}, "%s\\overline{%s}" }}) })),
  md.r_math("(.*%])bar", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]"}, "%s\\overline{%s}" }}) })),
  md.r_math("(.*%))hat", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")"}, "%s\\hat{%s}" }}) })),
  md.r_math("(.*%})hat", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}"}, "%s\\hat{%s}" }}) })),
  md.r_math("(.*%])hat", fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]"}, "%s\\hat{%s}" }}) })),
  md.r_math("(.*%))/", fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "(", ")"}, "%s\\frac{%s}" }}), i(1) })),
  md.r_math("(.*%})/", fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "{", "}"}, "%s\\frac{%s}" }}), i(1) })),
  md.r_math("(.*%])/", fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "[", "]"}, "%s\\frac{%s}" }}), i(1) })),
  md.r_math("(\\?[%w]+\\?^%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.r_math("(\\?[%w]+\\?_%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.r_math("(\\?[%w]+\\?^{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.r_math("(\\?[%w]+\\?_{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.r_math("(\\?%w+)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  md.r_math("^(.*[^%s].*)   ", fmta("<> \\quad ", { l(l.CAPTURE1) })),
  md.math_noslash("sq", fmta("\\sqrt[]{<>}", { i(1) })),
  md.math_noslash("iff", t("\\iff ")),
  md.math_noslash("hat", fmta("\\hat{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.math_noslash("bar", fmta("\\overline{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.math_noslash("abs", fmta("\\abs{<>}", { dl(1, l.LS_SELECT_RAW) })),
  md.math_noslash("inf", t("\\infty ")),
  md.math_noslash("sin", t("\\sin ")),
  md.math_noslash("cos", t("\\cos ")),
  md.math_noslash("tan", t("\\tan ")),
  md.math_noslash("csc", t("\\csc ")),
  md.math_noslash("sec", t("\\sec ")),
  md.math_noslash("cot", t("\\cot ")),
  md.math_noslash("binom", fmta("\\binom{<>}{<>}", { i(1), i(2) })),
  md.math_noslash("ln", t("\\ln ")),
  md.math_noslash("log", t("\\log ")),
  md.math_noslash("exp", t("\\exp ")),
  md.math_noslash("star", t("\\star ")),
  md.math_noslash("perp", t("\\perp ")),
  md.math_noslash("int", fmta("\\int_{<>}^{<>}", { i(1), i(2) })),
  md.math_noslash("arcsin", t("\\arcsin ")),
  md.math_noslash("arctan", t("\\arctan ")),
  md.math_noslash("arcsec", t("\\arcsec ")),
  md.math_noslash("nab", t("\\nabla ")),
  md.math_noslash("lim", fmta("\\lim_{<> \\to <>}", { i(1, "n"), i(2, "\\infty") })),
  md.math_noslash("sum", fmta("\\sum_{<>}^{<>}", { i(1, "n=0"), i(2, "\\infty") })),
  md.math_noslash("prod", fmta("\\prod_{<>}^{<>}", { i(1, "n=0"), i(2, "\\infty") })),
  md.math_noslash("part", fmta("\\frac{\\partial <>}{\\partial <>}", { i(1, "f"), i(2, "x") })),
  -- md.w_math_noslash("rt", fmta("\\sqrt[<>]{<>}", { i(1, "2"), i(2) })), -- rt is common in econ
  md.r_math_noslash("([aA]lpha)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([bB]eta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([gG]amma)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([dD]elta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([eE]psilon)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([zZ]eta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([tT]heta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("^([eE]ta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([^bBhzZ\\])([eE]ta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  md.r_math_noslash("([iI]ota)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([kK]appa)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([lL]ambda)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([mM]u)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([nN]u)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([pP]i)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([rR]ho)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([sS]igma)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([tT]au)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([pP]hi)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([cC]hi)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([pP]si)", fmta("\\<> ", { l(l.CAPTURE1) })),
  md.r_math_noslash("([oO]mega)", fmta("\\<> ", { l(l.CAPTURE1) })),
}
