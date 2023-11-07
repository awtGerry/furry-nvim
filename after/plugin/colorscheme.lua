local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl

local M = {}

function M.awesome_colors(color)
    opt.termguicolors = true

    g.gruvbox_contrast_dark = "hard"
    g.gruvbox_invert_selection = "0"

    color = color or "rose-pine"

    -- vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    require("rose-pine").setup({
        disable_background = true,
    })

    vim.cmd[[
        hi! FidgetTitle ctermbg=NONE guibg=NONE
        hi! FidgetTask ctermbg=NONE guibg=NONE
    ]]

    -- Default options:
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        emphasis = true,
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      invert_selection = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      transparent_mode = true,
    })

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
    vim.api.nvim_set_hl(0,"TelescopeBorder",{bg="none"})
    vim.api.nvim_set_hl(0,"TelescopePromptNormal",{bg="none"})

end

return M
