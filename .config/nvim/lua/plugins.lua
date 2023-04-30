local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	auto_clean = true,
	compile_on_sync = true,
	git = { clone_timeout = 6000 },
	display = {
		working_sym = "ﲊ",
		error_sym = "✗ ",
		done_sym = " ",
		removed_sym = " ",
		moved_sym = "",
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

local plugins = {
	["nvim-lua/plenary.nvim"] = { module = "plenary" },
	["nvim-lua/popup.nvim"] = {},
	["wbthomason/packer.nvim"] = {},

  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    setup = function()
      require("lazy_load").on_file_open "nvim-web-devicons"
    end,
    config = function()
      require("configs.others").devicons()
    end,
  },

  ["catppuccin/nvim"] = { as = "catppuccin" },

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    run = ":TSUpdate",
    setup = function()
      require("lazy_load").on_file_open "nvim-treesitter"
    end,
    event = { "BufRead", "BufNewFile" },
    cmd = require("lazy_load").treesitter_cmds,
    config = function() require "configs.treesitter" end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    -- ft = "gitcommit",
    -- setup = function()
    --   require("lazy_load").gitsigns()
    -- end,
    event = "BufEnter",
    config = function()
      require("configs.others").gitsigns()
    end,
  },

  ["williamboman/mason.nvim"] = {
    --cmd = require("lazy_load").mason_cmds,
    config = function()
      require "configs.mason"
    end,
  },

  ["williamboman/mason-lspconfig.nvim"] = {},

  ["folke/neodev.nvim"] = {
    module = "neodev",
    config = function ()
      require("neodev").setup{}
    end
  },

  ["neovim/nvim-lspconfig"] = {
    --opt = true,
    wants = "neodev",
    setup = function()
      require("lazy_load").on_file_open "nvim-lspconfig"
    end,
    config = function()
      require "configs.lspconfig"
    end,
  },

  ["SmiteshP/nvim-navic"] = {
      requires = "neovim/nvim-lspconfig",
  },

  ["onsails/lspkind-nvim"] = { },

  ["lukoshkin/trailing-whitespace"] = { },

   -- load luasnips + cmp related in insert mode only
  ["rafamadriz/friendly-snippets"] = {
    module = { "cmp", "cmp_nvim_lsp" },
    event = "InsertEnter",
  },

  ["hrsh7th/nvim-cmp"] = {
    after = "friendly-snippets",
    config = function()
      require "configs.cmp"
    end,
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("configs.others").luasnip()
    end,
  },

  ["saadparwaiz1/cmp_luasnip"] = { after = "LuaSnip" },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  ["hrsh7th/cmp-nvim-lsp"] = { after = "cmp-nvim-lua" },
  ["hrsh7th/cmp-buffer"] = { after = "cmp-nvim-lsp" },
  ["hrsh7th/cmp-path"] = { after = "cmp-buffer" },
  ["hrsh7th/cmp-cmdline"] = { after = "cmp-buffer" },

  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require("configs.others").comment()
    end,
  },

  ["simrat39/symbols-outline.nvim"] = {
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = function()
      require("configs.others").outline()
    end,
  },

  -- ["RRethy/vim-illuminate"] = {
  --     config = function()
  --       require "configs.illuminate"
  --     end,
  -- },

  ["kyazdani42/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "configs.nvimtree"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    branch = '0.1.x',
    config = function() require "configs.telescope" end,
  },

  ["nvim-lualine/lualine.nvim"] = {
    after = "nvim-web-devicons",
    config = function() require "configs.lualine" end,
  },

  ["utilyre/barbecue.nvim"] = {
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  },

  ["akinsho/bufferline.nvim"] = {
    after = "catppuccin",
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("configs.others").bufferline()
    end
  },

  ["j-hui/fidget.nvim"] = {
    config = function ()
      require("fidget").setup{}
    end
  },

  ["rainbowhxch/beacon.nvim"] = {
    config = function ()
      require("beacon").setup{}
    end
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    setup = function()
      require("lazy_load").on_file_open "indent-blankline.nvim"
      -- require("utils").load_mappings "blankline"
    end,
    config = function()
      require("configs.others").blankline()
    end,
  },

  ["dvoytik/hi-my-words.nvim"] = {
    config = function ()
      require("hi-my-words").setup{}
    end
  },

  ["folke/trouble.nvim"] = {
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  ["dhananjaylatkar/cscope_maps.nvim"] = {
    after = "which-key.nvim",
    config = function()
      require("cscope_maps").setup({
        cscope = {
          db_file = "./cscope.out", -- location of cscope db file
        },
      })
    end,
  },

  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require "configs.whichkey"
    end,
  },
}

return packer.startup(function(use)
  -- My plugins here
  --use 'wbthomason/packer.nvim'
  for key, plugin in pairs(plugins) do
	  if type(key) == "string" and not plugin[1] then plugin[1] = key end
	  use(plugin)
  end
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
