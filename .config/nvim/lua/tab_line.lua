local colors = {
    white = "#abb2bf",
    darker_black = "#1b1f27",
    black = "#1e222a", --  nvim bg
    black2 = "#252931",
    one_bg = "#282c34", -- real bg of onedark
    one_bg2 = "#353b45",
    one_bg3 = "#30343c",
    grey = "#42464e",
    grey_fg = "#565c64",
    grey_fg2 = "#6f737b",
    light_grey = "#6f737b",
    red = "#d47d85",
    baby_pink = "#DE8C92",
    pink = "#ff75a0",
    line = "#2a2e36", -- for lines like vertsplit
    green = "#A3BE8C",
    vibrant_green = "#7eca9c",
    nord_blue = "#81A1C1",
    blue = "#61afef",
    yellow = "#e7c787",
    sun = "#EBCB8B",
    purple = "#b4bbc8",
    dark_purple = "#c882e7",
    teal = "#519ABA",
    orange = "#fca2aa",
    cyan = "#a3b8ef",
    statusline_bg = "#22262e",
    lightbg = "#2d3139",
    lightbg2 = "#262a32"
}

require("bufferline").setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        auto_hide = true,
        animation = false,
        icon_separator_active = '▎',
        icon_separator_inactive = ' ',
        icon_close_tab = '',
        icon_close_tab_modified = ' ',
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        -- Enable/disable close button
        closable = false,
        --[[ max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20, ]]
        show_tab_indicators = false,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        mappings = false,
        always_show_bufferline = false
    },
    --[[ highlights = {
        fill = {
            guifg = colors.grey_fg,
            guibg = colors.black2
        },
        background = {
            guifg = colors.grey_fg,
            guibg = colors.black2
        },
        -- buffers
        buffer_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        buffer_selected = {
            guifg = colors.white,
            guibg = colors.black2,
            gui = "bold"
        },
        -- tabs
        tab = {
            guifg = colors.light_grey,
            guibg = colors.one_bg3
        },
        tab_selected = {
            guifg = colors.black2,
            guibg = colors.nord_blue
        },
        tab_close = {
            guifg = colors.red,
            guibg = colors.black
        },
        indicator_selected = {
            guifg = colors.black,
            guibg = colors.black
        },
        -- separators
        separator = {
            guifg = colors.blue,
            guibg = colors.black2
        },
        separator_visible = {
            guifg = colors.red,
            guibg = colors.black2
        },
        separator_selected = {
            guifg = colors.green,
            guibg = colors.black2
        },
        -- modified
        modified = {
            guifg = colors.red,
            guibg = colors.black2
        },
        modified_visible = {
            guifg = colors.red,
            guibg = colors.black2
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.black2
        },
        -- close buttons
        close_button = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        close_button_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        close_button_selected = {
            guifg = colors.red,
            guibg = colors.black2
        }
    } ]]
}
