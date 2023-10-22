local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl

local M = {}

function M.awesome_colors(color)
    opt.termguicolors = true

    g.gruvbox_contrast_dark = "hard"
    g.gruvbox_invert_selection = "0"

    require("tokyonight").setup({
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    })

    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true, -- true para fondo transparente (necesita compositor)
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = false,
        },
    })

    -- setup must be called before loading the colorscheme
    -- Default options:
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    })
    vim.cmd.colorscheme(color)
end

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   callback = function()
--     local highlights = {
--       'Normal',
--       'LineNr',
--       'Folded',
--       'NonText',
--       'SpecialKey',
--       'VertSplit',
--       'SignColumn',
--       'EndOfBuffer',
--       'TablineFill', -- this is specific to how I like my tabline to look like
--     }
--     for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end 
-- end, 
-- })

-- M.awesome_colors("catppuccin")
-- M.awesome_colors("gruvbox")

return M
