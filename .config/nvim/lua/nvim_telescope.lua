local actions = require('telescope.actions')
require'telescope'.setup {
  defaults = {
    prompt_prefix = ' ❯ ',
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    winblend = 0,
    layout_config = {
      vertical = {
        mirror = true,
      }
    },
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, -- + my_cool_custom_action.x,
        ["<a-q>"] = false,
        ["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = { 'build', 'tags' },
    color_devicons = true,
    dynamic_preview_title = true,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    file_browser = {
      theme = "dropdown",
      previewer = false,
    },
    git_files = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      sort_mru = true,
      theme = "dropdown",
      selection_strategy = "closest",
      previewer = false,
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
      }
    },
    lsp_references = { path_display = { "shorten" } },
    lsp_document_symbols = { path_display = { "hidden" } },
    lsp_workspace_symbols = { path_display = { "shorten" } },
    lsp_code_actions = { theme = "dropdown" },
    current_buffer_fuzzy_find = { theme = "dropdown", previewer = false },
  },
}
