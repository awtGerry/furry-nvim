if not pcall(require, "nvim-treesitter") then
    print("Treesitter is not installed")
    return
end

local tree = require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "rust",
        "tsx",
        "typescript",
        "vim"
    },

    highlight = {
        enable = true,
    },

    autotag = {
        enable = true,
    }
}

require("treesitter-context").setup {
    enable = true
}
