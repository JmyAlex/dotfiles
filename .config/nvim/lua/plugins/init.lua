local plugins = {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      -- { 'j-hui/fidget.nvim', opts = {}, tag = "legacy" },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      {
        'SmiteshP/nvim-navic',
        lazy = true,
        dependencies = {
          {
            'utilyre/barbecue.nvim',
            opts = {
              attach_navic = false,
              show_modified = true,
              theme = "catppuccin",
            },
          },
        },
      },
    },
    config = function ()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
        vim.keymap.set('n', '<leader>b', require('gitsigns').blame_line, { buffer = bufnr, desc = '[B]lame line' })
      end,
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function ()
      return {
        require("catppuccin").setup({
          flavour = "frappe", -- latte, frappe, macchiato, mocha
          styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = { "bold", "italic" },
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
          },
          integrations = {
            navic = { enabled = true, custom_bg = "lualine" },
            treesitter_context = true,
            noice = true,
            notify = true,
            beacon = true,
            mason = true,
            symbols_outline = true,
          },
        })
      }
    end,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',

      {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        enabled = true,
        opts = { mode = "cursor", max_lines = 3 },
      },
    },
    build = ':TSUpdate',
    config = function ()
      require "plugins.configs.treesitter"
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    event = "VeryLazy",
    config = function ()
      require "plugins.configs.lualine"
    end,
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- event = { "BufReadPost", "BufNewFile" },
    cmd = { "IBLToggle", "IBLEnable", "IBLDisable" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "notify",
          "toggleterm",
          "",
        },
        buftypes = {
          "terminal",
        },
      },
    },
    main = 'ibl',
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    -- cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    keys = {
      { "<leader>?", "<cmd>Telescope oldfiles<cr>", mode = "n", desc = "[?] Find recently opened files" },
      { "<leader><space>", "<cmd>Telescope buffers<cr>", mode = "n", desc = "[ ] Find existing buffers" },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = "n", desc = "[/] Fuzzily search in current buffer" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", mode = "n", desc = "Search [G]it [F]iles" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", mode = "n", desc = "Search [G]it [S]tatus" },
      { "<leader>sa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true prompt_title=All_Files<cr>", mode = "n", desc = "[S]earch [A]ll" },
      { "<leader>sf", "<cmd>Telescope find_files<cr>", mode = "n", desc = "[S]earch [F]iles" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", mode = "n", desc = "[S]earch [H]elp" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", mode = "n", desc = "[S]earch current [W]ord" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "[S]earch by [G]rep" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", mode = "n", desc = "[S]earch [D]iagnostics" },
      { "<leader>sp", "<cmd>Telescope project<cr>", mode = "n", desc = "[S]earch [P]roject" },
    },
    config = function ()
      require "plugins.configs.telescope"
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = {
      { "<leader>T", "<cmd>ToggleTerm direction=float<cr>", mode = "n", desc = "[T]oggle terminal" },
    }
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },

    keys = {
      {
        "<leader>mp", function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        desc = "Format file or range (in visual mode)",
        mode = { "n", "v", "x" },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {
      disable_netrw = true,
      hijack_cursor = true,
      update_focused_file = {
        enable = true,
      },
      git = {
        enable = false,
        ignore = true,
      },
      renderer = {
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_label = false,
      }
    },
    keys = {
      { "<c-n>", "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree" },
    },
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    opts = {
      highlight_hovered_item = false,
      auto_preview = false,
      -- relative_width = false,
      -- width = 35,
      auto_close = true,
      show_symbol_details = false,
    },
    keys = {
      { "<leader>t", "<cmd>SymbolsOutline<cr>", desc = "SymbolsOutline" },
    },
  },

  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewClose" }, },

  {
    'niuiic/git-log.nvim',
    dependencies = {
      'niuiic/core.nvim'
    },

    keys = {
      {
        "<leader>gl",
        function ()
          require("git-log").check_log()
        end,
        desc = "Git Log" },
    },
  },

  -- highlight whitespace
  {
    'lukoshkin/trailing-whitespace',
    event = { "BufReadPost", "BufNewFile" },
    commit = "2d4aeb132973da15edbe0d093ce836563ee2aef1",
  },

  { 'rainbowhxch/beacon.nvim', opts = {}, event = { "BufReadPost", "BufNewFile" } },

  -- highlight interesting words
  {
    'dvoytik/hi-my-words.nvim',
    opts = {},
    keys = {
      { "<leader>1", "<cmd>HiMyWordsToggle<cr>", desc = "HiMyWordsToggle" },
      { "<leader>2", "<cmd>HiMyWordsClear<cr>", desc = "HiMyWordsClear" },
    },
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {}, event = "VeryLazy", },

}

local config = {
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

require("lazy").setup(plugins, config)
