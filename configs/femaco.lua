require("femaco").setup {
  -- @param opts: the return value from float_opts
  prepare_buffer = function(opts)
    local buf = vim.api.nvim_create_buf(false, false)
    return vim.api.nvim_open_win(buf, true, opts)
  end,

  -- @param code_block: data about the code-block with the keys
  --   * range
  --   * lines
  --   * lang
  float_opts = function(code_block)
    return {
      relative = "win",
      bufpos = { code_block.range[1] - 1, code_block.range[2] },
      width = vim.api.nvim_win_get_width(0) - 10,
      height = math.min(#code_block.lines, vim.api.nvim_win_get_height(0) - 6),
      style = "minimal",
      -- border = "none",
      border = { "", "", "", "│", "", "", "", "│" },
      zindex = 1,
    }
  end,

  -- post_open_float = function(winnr)
  --   vim.wo.signcolumn = "no"
  -- end,

  ensure_newline = function(base_filetype)
    return true
  end,
}
