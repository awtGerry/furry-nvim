local keymap = vim.api.nvim_set_keymap
local tele_maps = require("furry.telescope.telemaps")

local map = function(map, f, buffer)
    local mode = "n"
    local cmd = string.format("<cmd>%s<cr>", f)
    local opt = {
        noremap = true,
        silent = true,
    }
    if not buffer then
        keymap(mode, map, cmd, opt)
    else
        keymap(0, mode, map, cmd, opt)
    end
end

map("<leader>y", "%y+")
map("<leader><leader>s", "source ~/.config/nvim/lua/furry/snips/init.lua")

map("<leader>e", "NvimTreeToggle")

tele_maps("<leader>fd", "fd")
tele_maps("<leader>fb", "buffers")
tele_maps("<leader>fs", "live_grep")
tele_maps("<leader>fn", "edit_neovim")

-- Harpoon
map("<leader><leader>a", "lua require('harpoon.mark').add_file()")
map("<leader>h", "lua require('harpoon.ui').toggle_quick_menu()")
map("<leader>1", "lua require('harpoon.ui').nav_file(1)")
map("<leader>2", "lua require('harpoon.ui').nav_file(2)")
map("<leader>3", "lua require('harpoon.ui').nav_file(3)")
map("<leader>4", "lua require('harpoon.ui').nav_file(4)")
map("<leader>5", "lua require('harpoon.ui').nav_file(5)")
map("<leader>6", "lua require('harpoon.ui').nav_file(6)")
map("<leader>7", "lua require('harpoon.ui').nav_file(7)")
map("<leader>8", "lua require('harpoon.ui').nav_file(8)")
map("<leader>9", "lua require('harpoon.ui').nav_file(9)")
