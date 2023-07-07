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
        transparent_background = false,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = false,
        },
    })

    vim.cmd.colorscheme(color)
end

-- M.awesome_colors("catppuccin")
-- M.awesome_colors("gruvbox")

return M
