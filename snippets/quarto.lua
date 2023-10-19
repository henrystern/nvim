local md = require("luasnip-md-utils.nodes")

return {
  -- regular
  md.b_no_math("include-figure", fmta("![<>][./figures/<>]", { i(2), i(1) })),
  md.b_no_math("include-file", fmt("{{< include ./{} >}}", i(1))),
  md.b_no_math("include-header", fmta(
    [[
      include-in-header:
        text: |
          <>
    ]], i(1, "\\usepackage{}")
  )),
  md.b_no_math("yamlblog", fmta(
    [[
      ---
      title: "<>"
      date: <>
      categories: [<>]
      ---
    ]], {i(1), i(2, "last-modified"), i(3)}
  )),
}, {
  -- autosnippets
  md.b_no_math("where:", fmta(
    [[
      | where:
      |          <>
    ]], dl(1, l.LS_SELECT_RAW)
  )),
  md.b_no_math(".div", fmta(
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
  md.b_no_math(".call", fmta(
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
  md.br_no_math("#(%w*)-", fmta(
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
  md.br_no_math("%.(%S*) ", fmta(
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
  md.b_no_math("cbl", fmta(
      [[
        ```<>
        <>
        ```
      ]], { i(1), dl(1, l.LS_SELECT_RAW) }
  )),
  md.b_no_math("xbl", fmta(
      [[
        ```{<>}
        <>
        ```
      ]], { i(1), i(2) }
  )),
  md.b_no_math("rbl", fmta(
      [[
        ```{r}
        <>
        ```
      ]], { dl(1, l.LS_SELECT_RAW) }
  )),
  md.no_math("rbl", fmta("`r <>`", { dl(1, l.LS_SELECT_RAW) })),
  md.b_no_math("pbl", fmta(
      [[
        ```{python}
        <>
        ```
      ]], { dl(1, l.LS_SELECT_RAW) }
  )),
  md.no_math("pbl", fmta(
      [[
        ```{python} 
        #| echo: false
        from IPython.display import display, Markdown
        display(Markdown("""
        {<>}.
        """.format(<> = <>)))
        ```
      ]], { i(1), rep(1), rep(1) }
  )),
  md.b_no_math("jbl", fmta(
      [[
        ```{ojs}
        <>
        ```
      ]], { dl(1, l.LS_SELECT_RAW) }
  )),
  md.no_math("jbl", fmta("${<>}", { dl(1, l.LS_SELECT_RAW) })),
}
