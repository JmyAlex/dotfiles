vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

local colors = require("catppuccin.palettes").get_palette()
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

-- local CustomHighlights = {
--   TelescopeNormal = { bg = colors.mantle, },
--   TelescopeBorder = { fg = colors.mantle, bg = colors.mantle, },
--   TelescopePromptBorder = { fg = colors.surface1, bg = colors.surface1, },
--   TelescopePromptNormal = { fg = colors.white, bg = colors.surface1, },
--   TelescopePromptPrefix = { fg = colors.purple, bg = colors.cursorline, },
--   TelescopePreviewTitle = { fg = colors.black, bg = colors.green, },
--   TelescopePromptTitle = { fg = colors.base, bg = colors.red, },
--   TelescopePromptCounter = { fg = colors.gray, bg = colors.cursorline, },
--   TelescopeSelection = { bg = colors.cursorline, fg = colors.comment, },
--   TelescopeSelectionCaret = { fg = colors.purple }, TelescopeMatching = { fg = colors.purple },
--   TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle, },
--   TelescopeResultsDiffAdd = { fg = colors.green, },
--   TelescopeResultsDiffChange = { fg = colors.yellow, },
--   TelescopeResultsDiffDelete = { fg = colors.red, },
--
--   CmpItemAbbr = { fg = colors.text },
--   CmpItemAbbrMatch = { fg = colors.blue, bold = true },
--   CmpBorder = { fg = colors.overlay0 },
--   CmpDocBorder = { fg = colors.overlay0, bg = colors.base },
--   CmPmenu = { bg = colors.base },
--
-- }

-- for hl, col in pairs(CustomHighlights) do
--     vim.api.nvim_set_hl(0, hl, col)
-- end
