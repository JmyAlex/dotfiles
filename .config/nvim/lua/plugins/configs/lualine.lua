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

ins_left {
  'mode',
}

ins_left {
  function()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  end,
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.fg },
    modified = { fg = colors.fg },
    removed = { fg = colors.fg },
  },
  cond = conditions.hide_in_width,
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  diagnostics_color = {
    error = { fg = colors.fg },
    warn = { fg = colors.fg },
    info = { fg = colors.fg },
    hint = { fg = colors.fg },
  },
  cond = conditions.hide_in_width,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- Add components to right sections

ins_right {
  function ()
    local search = vim.fn.searchcount({ maxcount = 0 })
    if next(search) ~= nil then
      if search.current > 0 and vim.v.hlsearch ~= 0 then
        return search.current .. "/" .. search.total
      else
        return ""
      end
    end
  end,
  icon = ' ',
}

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
