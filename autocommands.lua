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
  pattern = { "gitcommit", "markdown", "quarto" },
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
      set conceallevel=1 |
      let g:tex_conceal='abdmg' |

      let g:vimtex_compiler_latexmk = {
              \ 'build_dir' : '',
              \ 'callback' : 1,
              \ 'continuous' : 1,
              \ 'executable' : 'latexmk',
              \ 'hooks' : [],
              \ 'options' : [
              \   '-synctex=1',
          \   '-aux-directory=' . stdpath('data') . '/.latex_aux_files',
              \ ],
              \}
  ]]
  end,
})
