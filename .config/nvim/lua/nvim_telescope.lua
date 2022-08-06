local actions = require('telescope.actions')
local action_layout = require("telescope.actions.layout")

require'telescope'.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "    ",
    entry_prefix = "  ",
    selection_caret = "  ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    -- layout_strategy = 'flex',
    -- scroll_strategy = 'cycle',
    -- layout_config = {
    --   vertical = {
    --     mirror = true,
    --   }
    -- },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { 'build', 'tags', "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    dynamic_preview_title = true,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, -- + my_cool_custom_action.x,
        ["<a-q>"] = false,
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<M-p>"] = action_layout.toggle_preview,
	["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
    },
  }
  --pickers = {
    --find_files = {
    --  theme = "dropdown",
    --  previewer = false,
    --},
    --file_browser = {
    --  theme = "dropdown",
    --  previewer = false,
    --},
    --git_files = {
    --  theme = "dropdown",
    --  previewer = false,
    --},
    --buffers = {
    --  sort_mru = true,
      --theme = "dropdown",
    --  selection_strategy = "closest",
    --  previewer = false,
     -- mappings = {
      --  i = { ["<c-d>"] = actions.delete_buffer },
     -- }
   -- },
   -- lsp_references = { path_display = { "shorten" } },
   -- lsp_document_symbols = { path_display = { "hidden" } },
   -- lsp_workspace_symbols = { path_display = { "shorten" } },
   -- lsp_code_actions = { theme = "dropdown" },
    --current_buffer_fuzzy_find = { theme = "dropdown", previewer = false },
 -- },
}

-- require("onedarkpro").setup({
--   styles = { -- Choose from "bold,italic,underline"
--       strings = "NONE", -- Style that is applied to strings.
--       comments = "italic", -- Style that is applied to comments
--       keywords = "bold,italic", -- Style that is applied to keywords
--       functions = "NONE", -- Style that is applied to functions
--       variables = "NONE", -- Style that is applied to variables
--       virtual_text = "NONE", -- Style that is applied to virtual text
--   },
--   options = {
--       bold = true, -- Use the themes opinionated bold styles?
--       italic = true, -- Use the themes opinionated italic styles?
--       underline = true, -- Use the themes opinionated underline styles?
--       undercurl = true, -- Use the themes opinionated undercurl styles?
--       cursorline = true, -- Use cursorline highlighting?
--       transparency = false, -- Use a transparent background?
--       terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
--       window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
--   }
-- })
--
-- vim.cmd("colorscheme onedarkpro")
-- local colors = require("onedarkpro.colors").get_theme_colors()

vim.g.catppuccin_flavour = "frappe"
require("catppuccin").setup({
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
})
vim.cmd [[colorscheme catppuccin]]
local colors = require("catppuccin.palettes").get_palette()
local TelescopePrompt = {
  TelescopeBorder = {
    fg = colors.crust,
    bg = colors.crust,
  },

  TelescopePromptBorder = {
    fg = colors.surface1,
    bg = colors.surface1,
  },

  TelescopePromptNormal = {
    fg = colors.white,
    bg = colors.surface1,
  },

  TelescopePromptPrefix = {
    fg = colors.purple,
    bg = colors.cursorline,
  },

  TelescopeNormal = {
    bg = colors.crust,
  },

  TelescopePreviewTitle = {
    fg = colors.black,
    bg = colors.green,
  },

  TelescopePromptTitle = {
    fg = colors.base,
    bg = colors.pink,
  },

  TelescopePromptCounter = {
    fg = colors.gray,
    bg = colors.cursorline,
  },

  TelescopeResultsTitle = {
    fg = colors.crust,
    bg = colors.crust,
  },

  TelescopeSelection = {
    bg = colors.cursorline,
    fg = colors.comment,
  },

  TelescopeSelectionCaret = { fg = colors.purple },
  TelescopeMatching = { fg = colors.purple },

  TelescopeResultsDiffAdd = {
    fg = colors.green,
  },

  TelescopeResultsDiffChange = {
    fg = colors.yellow,
  },

  TelescopeResultsDiffDelete = {
    fg = colors.red,
  },
}

for hl, col in pairs(TelescopePrompt) do
    vim.api.nvim_set_hl(0, hl, col)
end
