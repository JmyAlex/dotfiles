local lualine = require('lualine')
local colors_theme = require("catppuccin.palettes").get_palette("frappe")

local colors = {
  bg       = colors_theme.mantle,
  fg       = colors_theme.text,
  yellow   = colors_theme.yellow,
  cyan     = colors_theme.sapphire,
  darkblue = colors_theme.teal,
  green    = colors_theme.green,
  orange   = colors_theme.peach,
  violet   = colors_theme.mauve,
  magenta  = colors_theme.pink,
  blue     = colors_theme.blue,
  red      = colors_theme.red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

-- ins_left {
--   -- mode component
--   function()
--     return ''
--   end,
--   color = function()
--     -- auto change color according to neovims mode
--     local mode_color = {
--       n = colors.red,
--       i = colors.green,
--       v = colors.blue,
--       [''] = colors.blue,
--       V = colors.blue,
--       c = colors.magenta,
--       no = colors.red,
--       s = colors.orange,
--       S = colors.orange,
--       [''] = colors.orange,
--       ic = colors.yellow,
--       R = colors.violet,
--       Rv = colors.violet,
--       cv = colors.red,
--       ce = colors.red,
--       r = colors.cyan,
--       rm = colors.cyan,
--       ['r?'] = colors.cyan,
--       ['!'] = colors.red,
--       t = colors.red,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { right = 1 },
-- }

ins_left {
  'mode',
}

ins_left {
  function()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  end,
  color = { fg = colors.fg, gui = 'bold' },
}

-- ins_left {
--   function()
--     local result = vim.fn.getcwd()
--       local home = os.getenv("HOME")
--       if home and vim.startswith(result, home) then
--         result = "~" .. result:sub(home:len() + 1)
--       end
--     return result
--   end,
-- }

-- return {
--   ActiveLSP = "",
--   ActiveTS = "綠",
--   ArrowLeft = "",
--   ArrowRight = "",
--   BufferClose = "",
--   DapBreakpoint = "",
--   DapBreakpointCondition = "",
--   DapBreakpointRejected = "",
--   DapLogPoint = ".>",
--   DapStopped = "",
--   DefaultFile = "",
--   Diagnostic = "裂",
--   DiagnosticError = "",
--   DiagnosticHint = "",
--   DiagnosticInfo = "",
--   DiagnosticWarn = "",
--   Ellipsis = "…",
--   FileModified = "",
--   FileReadOnly = "",
--   FolderClosed = "",
--   FolderEmpty = "",
--   FolderOpen = "",
--   Git = "",
--   str = '  ',
--   GitAdd = "",
--   GitBranch = "",
--   GitChange = "",
--   GitConflict = "",
--   GitDelete = "",
--   GitIgnored = "◌",
--   GitRenamed = "➜",
--   GitStaged = "✓",
--   GitUnstaged = "✗",
--   GitUntracked = "★",
--   LSPLoaded = "",
--   LSPLoading1 = "",
--   LSPLoading2 = "",
--   LSPLoading3 = "",
--   MacroRecording = "",
--   NeovimClose = "", -- TODO v3: remove this icon
--   Paste = "",
--   Search = "",
--   Selected = "❯",
--   Spellcheck = "暈",
--   TabClose = "",
-- }

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.blue },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- Add components to right sections

ins_right { 'location', color = { fg = colors.fg, gui = 'bold' } }

ins_right {
  function ()
    if not vim.opt.expandtab:get() then
      return "Tab:" .. vim.opt.tabstop:get() .. " "
    else
      local size = vim.opt.shiftwidth:get()
      if size == 0 then
        size = vim.opt.tabstop:get()
      end
      return "Spaces:" .. size .. " "
    end
  end
}

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  -- Lsp server name .
  function()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' ',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
