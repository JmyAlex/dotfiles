require "options"
vim.defer_fn(function()
  require("utils").load_mappings()
end, 0)
require "plugins"
require "autocmds"
require "theme"
