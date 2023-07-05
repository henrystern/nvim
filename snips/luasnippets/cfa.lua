local md = require("luasnip-md-utils.nodes")

return {
  -- regular
}, {
  -- autosnippets
  md.Ar_math("([^\\%a])(%a%a%a+)", fmta("<>\\text{<><>}", { l(l.CAPTURE1), l(l.CAPTURE2), i(1) })),
}
