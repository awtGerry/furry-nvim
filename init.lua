vim.loader.enable()

vim.g.mapleader = " " -- Espacio como mapleader

package.path = os.getenv("HOME") .. "/.config/nvim/" .. package.path

-- Manejar plugins automaticamente con lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("packer.plugins", {
    ui = {
        icons = {
            cmd = "󰘳",
            config = "",
            event = "󰃭",
            ft = "",
            init = "",
            keys = "",
            plugin = "",
            runtime = "󰌢",
            source = "",
            start = "",
            task = "",
        },
    },
})

-- require ("after.plugin.colorscheme").awesome_colors("catppuccin")
require ("after.plugin.colorscheme").awesome_colors("gruvbox")

require "furry.configs"
require "furry.keymaps"
require "furry.lsp"
require "furry.telescope.setup"
