local md = require("luasnip-md-utils.nodes")

return {
  -- regular
  md.bw_no_math("yamlblog", fmta(
    [[
      ---
      title: "<>"
      date: <>
      categories: [<>]
      ---
    ]], {i(1), i(2, "last-modified"), i(3)}
  )),
}, {
  md.bw_no_math(".div", fmta(
    [[
      ::: {<>}
      <>
      :::

    ]],
    {
      i(1),
      dl(2, l.LS_SELECT_RAW)
    }
  )),
  md.bw_no_math(".call", fmta(
    [[
      ::: {.callout-<>}
      <>
      :::

    ]],
    {
      i(1, "note"),
      dl(2, l.LS_SELECT_RAW)
    }
  )),
  md.bwr_no_math("#(%w*)-", fmta(
    [[
      ::: {#<>-<>}
      <>
      :::

    ]],
    {
      l(l.CAPTURE1),
      i(1),
      dl(2, l.LS_SELECT_RAW)
    }
  )),
  md.bwr_no_math("%.(%S*) ", fmta(
    [[
      ::: {.<>}
      <>
      :::

    ]],
    {
      l(l.CAPTURE1:gsub("%.", " %.")),
      dl(1, l.LS_SELECT_RAW)
    }
  )),
}
