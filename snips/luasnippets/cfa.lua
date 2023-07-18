local md = require("luasnip-md-utils.nodes")

return {
  -- regular
}, {
  -- autosnippets
  md.Ar_math({ trig = "([^\\%a])(%a%a%a+)", priority = 50 }, fmta("<>\\text{<><>}", { l(l.CAPTURE1), l(l.CAPTURE2), i(1) })),
}
