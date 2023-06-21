local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = 'arstneiogmdkc,x.qwfpluy;bj',
  },
  keys = {
    {
      "<leader>fw",
      mode = {"n", "x", "o"},
      function()
        require("flash").jump()
      end,
    },
    -- {
    --   "<leader>fw",
    --   mode = {"n", "x", "o"},
    --   function()
    --     require("flash").jump({search = {mode = function(str) return "\\<" .. str end}})
    --   end,
    -- },
  }
}

return M
