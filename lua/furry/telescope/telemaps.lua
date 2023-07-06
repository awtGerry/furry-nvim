if not pcall(require, "telescope") then
    return
end

TelescopeMapArgs = TelescopeMapArgs or {}

local telemap = function(key, f, opt, buffer)
    local map = vim.api.nvim_replace_termcodes(key .. f, true, true, true)
    TelescopeMapArgs[map] = options or {}
    
    local mode = "n"
    local rhs = string.format("<cmd>lua require('furry.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)
    local map_opt = {
        noremap = true,
        silent = true,
    }

    if not buffer then
        vim.api.nvim_set_keymap(mode, key, rhs, map_opt)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_opt)
    end
end

vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

return telemap
