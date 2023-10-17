---@type NvPluginSpec[]
local plugins = {
  -- Core IDE Plugins
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
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
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "jmbuhr/cmp-pandoc-references",
        "hrsh7th/cmp-cmdline",
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
    config = function()
      require("mason-nvim-dap").setup()
    end,
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

  -- Markdown and Quarto
  {
    "quarto-dev/quarto-nvim",
    dev = false,
    ft = "quarto",
    config = function()
      require("core.utils").load_mappings "quarto"
      require "custom.configs.quarto"
    end,
  },
  {
    "jmbuhr/otter.nvim",
    ft = "quarto",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
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
    lazy = false,
    event = "VeryLazy",
    ft = { "r", "rmd", "rrst", "rnoweb", "quarto", "rhelp" },
    init = function()
      require "custom.configs.r"
    end,
  },
  {
    "lervag/vimtex",
    ft = "tex",
  },
}

return plugins
