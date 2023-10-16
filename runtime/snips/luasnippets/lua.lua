return {
  -- regular
  s("luasnippets", fmta(
    [[
      return {
        -- regular
        <>
      }, {
        -- autosnippets
        <>
      }
    ]], {i(1), i(2)}
  )),
  s("lazyplugin", fmta(
    [[
      local M = {
        "<>",
        event = "",
      }

      function M.config()
      end

      return M
    ]], {i(1)}
  )),
}, {
  -- autosnippets
}
