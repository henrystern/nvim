local cmp = require "cmp"
local luasnip = require "luasnip"

-- project extend snippets
local project_extends = {
  -- ['pattern'] = 'snippets name'
  ["CFA.*Notes"] = "cfa",
}
local default_filetype_load_function = require("luasnip.extras.filetype_functions").from_filetype_load
local function extended_filetype_load_function(bufnr)
  -- this still repeats unnecessarily but not too bad
  --   I think the repetition is inherent to luasnip and not part of the extension
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local extends = {}
  -- print("check patterns")
  for pattern, extension in pairs(project_extends) do
    if filename:match(pattern) then
      -- print("Luasnip Project:", extension)
      table.insert(extends, extension)
    end
  end
  return extends or {}
end
local function list_deep_extend(initial_list, ...)
  -- print("deep extend")
  local args = { ... }
  local result = vim.deepcopy(initial_list)

  for _, values in ipairs(args) do
    vim.list_extend(result, values)
  end

  return result
end
local function resolve_filetypes(bufnr)
  -- print("resolve_filetypes")
  return list_deep_extend(
    {},
    -- file_extends has higher priority than default.
    extended_filetype_load_function(bufnr),
    default_filetype_load_function(bufnr)
  )
end

luasnip.config.set_config {
  history = true,
  enable_autosnippets = true,
  update_events = "TextChanged,TextChangedI",
  store_selection_keys = "<Tab>",
  -- ft_func is run on insert used to detect codeblocks
  ft_func = function()
    -- print("ft_func")
    return resolve_filetypes(vim.api.nvim_get_current_buf())
  end,
  load_ft_func = resolve_filetypes,
}

-- filetype extend snippets
luasnip.filetype_extend("quarto", { "md-math" })
luasnip.filetype_extend("markdown", { "md-math" })
luasnip.filetype_extend("rmarkdown", { "md-math" })
luasnip.filetype_extend("tex", { "tex-math" })

-- friendly-snippets (local)
require("luasnip.loaders.from_vscode").lazy_load {
  paths = { vim.fn.stdpath "config" .. "/lua/custom/snippets/friendly-snippets" },
}

-- latex-luasnippets
-- require("luasnip.loaders.from_lua").lazy_load {}

-- custom snippets
require("luasnip.loaders.from_lua").load {
  paths = { vim.fn.stdpath "config" .. "/lua/custom/snippets/luasnippets" },
}

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local kind_icons = {
  Text = "󰉿",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰆧",
  Class = "󰌗",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰇽",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Codeium = "󰚩",
  Copilot = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-n>"] = cmp.mapping(function(fallback)
      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<M-n>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping(cmp.mapping.confirm { select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
        -- elseif luasnip.expand_or_jumpable() then
        --   luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
        -- elseif luasnip.jumpable(-1) then
        --   luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "λ",
        nvim_lua = "",
        luasnip = "⋗",
        buffer = "Ω",
        path = "🖫",
        otter = "ö",
        pandoc_references = "",
        -- nvim_lsp_signature_help = "",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "otter" },
    { name = "pandoc_references" },
    { name = "orgmode" },
    -- { name = "nvim_lsp_signature_help" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = { border = { "", "", "", "│", "", "", "", "│" } },
    documentation = { border = { "", "", "", "│", "", "", "", "│" } },
  },
  experimental = {
    ghost_text = true,
  },
}
