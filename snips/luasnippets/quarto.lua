local md = require("luasnip-md-utils.nodes")

return {
  -- regular
  md.bw_no_math("include-figure", fmta("![<>][./figures/<>]", { i(2), i(1) })),
  md.bw_no_math("include-file", fmt("{{< include ./{} >}}", i(1))),
  md.bw_no_math("include-header", fmta(
    [[
      include-in-header:
        text: |
          <>
    ]], i(1, "\\usepackage{}")
  )),
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
  -- autosnippets
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
  md.bw_no_math("cbl", fmta(
      [[
        ```<>
          <>
        ```
      ]], { i(1), i(2) }
  )),
  md.bw_no_math("xbl", fmta(
      [[
        ```{<>}
          <>
        ```
      ]], { i(1), i(2) }
  )),
  md.bw_no_math("rbl", fmta(
      [[
        ```{r}
          <>
        ```
      ]], { i(1) }
  )),
  md.w_no_math("rbl", fmta("`r <>`", { i(1) })),
  md.bw_no_math("pbl", fmta(
      [[
        ```{python}
          <>
        ```
      ]], { i(1) }
  )),
  md.w_no_math("pbl", fmta(
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
  md.bw_no_math("jbl", fmta(
      [[
        ```{ojs}
          <>
        ```
      ]], { i(1) }
  )),
  md.w_no_math("jbl", fmta("${<>}", { i(1) })),
}
