vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

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
