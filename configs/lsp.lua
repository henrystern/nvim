local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

-- fixes clangd formatting error
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup { capabilities = capabilities }

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

for _, server in pairs(require "custom.utils.servers") do
  Opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "settings." .. server)
  if require_ok then
    Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
  end

  if server == "marksman" then
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "markdown", "quarto" },
      root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
    }
  elseif server == "tsserver" then
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        "ojs",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    }
  else
    lspconfig[server].setup(Opts)
  end
end

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    suffix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
