local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl
local M = {}

function M.change_colors(color)
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

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#ff0000" })
    vim.cmd.colorscheme(color)
end

M.change_colors("catppuccin")
-- M.change_colors("gruvbox")

return M
