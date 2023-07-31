local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl

local M = {}

function M.awesome_colors(color)
    opt.termguicolors = true

    g.gruvbox_contrast_dark = "hard"
    g.gruvbox_invert_selection = "0"

    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false, -- true para fondo transparente (necesita compositor)
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
      transparent_mode = false,
    })

    vim.cmd.colorscheme(color)
end

-- M.awesome_colors("catppuccin")
-- M.awesome_colors("gruvbox")

return M
