---@type NvPluginSpec[]
local plugins = {
  -- Core IDE Plugins
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require("core.utils").load_mappings "lsp"
      require "custom.configs.lsp"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = require "custom.utils.mason_servers",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require "custom.utils.treesitters",
    },
    config = function()
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(require "plugins.configs.treesitter")
      require "custom.configs.treesitter"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        "jmbuhr/cmp-pandoc-references",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
      require "custom.configs.cmp"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
      require "custom.configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
      },
    },
    config = function()
      require "custom.configs.dapui"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
      },
    },
    config = function()
      require("dap-python").setup "~/Envs/debugpy/Scripts/pythonw.exe"
    end,
  },
  {
    "NvChad/nvterm",
    config = function()
      require "custom.configs.nvterm"
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      labels = "arstneiodkqqwfpluy",
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Nice to have
  {
    "nvim-telescope/telescope.nvim",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
      },
    },
    opts = require("custom.configs.telescope").opts,
  },
  {
    "nvim-telescope/telescope-bibtex.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      require("telescope").load_extension "bibtex"
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "ii" },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "Bufenter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        event = "Bufenter",
        cmd = { "Telescope" },
      },
    },
    config = function()
      require "custom.configs.project"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zen-mode"
    end,
  },
  {
    "vigemus/iron.nvim",
    ft = "python",
    config = function()
      require("core.utils").load_mappings "iron"
      require "custom.configs.iron"
    end,
  },

  -- Markdown and Quarto
  {
    "quarto-dev/quarto-nvim",
    ft = "quarto",
    config = function()
      require("core.utils").load_mappings "quarto"
      require "custom.configs.quarto"
    end,
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function()
      require("core.utils").load_mappings "otter"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "quarto" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require("core.utils").load_mappings "markdown_preview"
      require "custom.configs.markdown-preview"
    end,
  },
  {
    "AckslD/nvim-FeMaco.lua",
    ft = { "markdown", "quarto", "rmarkdown" },
    config = function()
      require("core.utils").load_mappings "femaco"
      require "custom.configs.femaco"
    end,
  },
  {
    "henrystern/luasnip-md-utils",
    ft = { "markdown", "rmarkdown", "quarto", "tex" },
    dependencies = { "L3MON4D3/LuaSnip", "nvim-treesitter/nvim-treesitter" },
  },

  -- Other Languages
  {
    "jalvesaq/Nvim-R",
    ft = { "r", "rmd", "rrst", "rnoweb", "quarto", "rhelp" },
    -- dependencies = { "jalvesaq/R-Vim-runtime" },
    config = function()
      require("core.utils").load_mappings "r"
      require "custom.configs.r"
    end,
  },
  {
    "lervag/vimtex",
    ft = "tex",
  },

  -- Orgmode
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
      {
        "akinsho/org-bullets.nvim",
        config = function()
          require("org-bullets").setup()
        end,
      },
      { "dhruvasagar/vim-table-mode" },
    },
    event = "VeryLazy",
    config = function()
      local org_path = "~/Nextcloud/Sync/Notes/"
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()
      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = org_path .. "**/*.org",
        org_default_notes_file = org_path .. "_.org",
        -- org_indent_mode = "noindent",
        org_ellipsis = "…",
        -- win_split_mode = "vertical",
        org_agenda_span = "week",
        org_agenda_skip_scheduled_if_done = true,
        org_agenda_skip_deadline_if_done = true,
        org_agenda_skip_if_done = true,
        org_agenda_start_on_weekday = false,
        org_blank_before_new_entry = false,
        org_todo_keyword_faces = {
          -- DONE = ":foreground #003601",
        },
        org_capture_templates = {
          y = {
            description = "School",
            template = "\n** %?\n",
            target = org_path .. "/school.org",
            -- headline = "%^{COMPLETION}",
          },
          j = {
            description = "Journal",
            -- template = "** %<%Y-%m-%d> %<%A>\n** %<%X>\n%?",
            template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n    %?",
            target = org_path .. "/journal.org",
          },
        },
        mappings = {
          org_return = false,
          global = {
            org_agenda = { "<M-a>", "<leader>oa" },
            org_capture = { "<M-c>", "<leader>oc" },
          },
        },
      }
    end,
  },
}

return plugins
