local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl

local M = {}

function M.awesome_colors(color)
    opt.termguicolors = true

    color = color or "nightfox"

	hl(0, "Normal", { bg = "none" })
	hl(0, "NormalFloat", { bg = "none" })
    hl(0, "NormalNC", { bg = "none" })

    require('nightfox').setup({
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = true,     -- Disable setting background
        terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,    -- Non focused panes set to alternative background
        module_default = true,   -- Default enable value for modules
        colorblind = {
          enable = false,        -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0,          -- Severity [0,1] for protan (red)
            deutan = 0,          -- Severity [0,1] for deutan (green)
            tritan = 0,          -- Severity [0,1] for tritan (blue)
          },
        },
        styles = {               -- Style to be applied to different syntax groups
          comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
        inverse = {             -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = {             -- List of various plugins and additional options
          -- ...
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    })

    vim.cmd[[
        hi! FidgetTitle ctermbg=NONE guibg=NONE
        hi! FidgetTask ctermbg=NONE guibg=NONE
    ]]

    vim.cmd.colorscheme(color)

    hl(0,"TelescopeNormal",{bg="none"})
    hl(0,"TelescopeBorder",{bg="none"})
    hl(0,"TelescopePromptNormal",{bg="none"})

end

M.awesome_colors("nightfox")

return M
