local actions = require('telescope.actions')
local action_layout = require("telescope.actions.layout")

require('telescope').setup {
  defaults = {
    prompt_prefix = "    ",
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
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<a-q>"] = false,
        ["<esc>"] = actions.close,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
    git_files = {
      theme = "dropdown",
      previewer = false,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'project')

