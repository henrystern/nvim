vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "quarto", "tex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- vimtex ftplugin
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "tex" },
  callback = function()
    vim.cmd [[
      " if has('win32') |
      let g:vimtex_view_general_viewer = 'SumatraPDF' |
      let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf' |
      " else |
        " let g:vimtex_view_method='zathura' |
      " endif |

      let g:tex_flavor='latex' |
      let g:vimtex_quickfix_mode=0 |
      set conceallevel=2 |
      let g:tex_conceal='abdmg' |
  ]]
  end,
})
