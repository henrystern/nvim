local M = {
  "hrsh7th/nvim-cmp",
  commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
    },
    {
      "hrsh7th/cmp-buffer",
      commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    },
    {
      "hrsh7th/cmp-path",
      commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    },
    {
      "hrsh7th/cmp-cmdline",
      commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      commit = "18095520391186d634a0045dacaa346291096566",
    },
    {
      "L3MON4D3/LuaSnip",
      commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
        commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
      commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
    },
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  -- project extend snippets
  local project_extends = {
    -- ['pattern'] = 'snippets name',
    ['CFA.*Notes'] = 'cfa',
  
  }
  local default_filetype_load_function = require("luasnip.extras.filetype_functions").from_filetype_load
  local function extended_filetype_load_function(bufnr)
    -- this still repeats unnecessarily but not too bad
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
    local args = {...}
    local result = vim.deepcopy(initial_list);

    for _, values in ipairs(args) do
      vim.list_extend(result, values);
    end

    return result;
  end
  local function resolve_filetypes(bufnr)
    -- print("resolve_filetypes")
    return list_deep_extend(
      {},
      -- file_extends has higher priority than default.
      extended_filetype_load_function(bufnr),
      default_filetype_load_function(bufnr)
    );
  end
  
  luasnip.config.set_config({
    history = true,
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI',
    store_selection_keys = "<Tab>",
    ft_func = function()
      -- print("ft_func")
      return resolve_filetypes(vim.api.nvim_get_current_buf())
    end,
    load_ft_func = resolve_filetypes
  })

  -- filetype extend snippets
  luasnip.filetype_extend("quarto", { "md-math" })
  luasnip.filetype_extend("markdown", { "md-math" })
  luasnip.filetype_extend("rmarkdown", { "md-math" })

  -- friendly-snippets
  require("luasnip/loaders/from_vscode").lazy_load({ exclude = { "quarto" } })
  -- custom snippets
  require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snips/luasnippets" } })

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
      ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false })),
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
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
          otter = "",
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
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
