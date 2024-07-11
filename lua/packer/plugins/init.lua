return {
    "wbthomason/packer.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    --[[ Apariencia ]]
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "rcarriga/nvim-notify",

    --[[ Temas ]]
    "ellisonleao/gruvbox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim",
	  as = 'rose-pine',
	  config = function()
		  vim.cmd[[colorscheme rose-pine]]
	  end
    },

    -- Barra
    "tjdevries/express_line.nvim",
    "goolord/alpha-nvim",

    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                mappings = {},
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
                performance_mode = false,    -- Disable "Performance Mode" on all buffers.
            })
        end
    },

    --[[ Otros ]]
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    },
    "lervag/vimtex",
}
