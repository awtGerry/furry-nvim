local servers = require("furry.lsp")
require("mason").setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "gopls",
        "html",
        "lua_ls",
        "rust_analyzer",
        "svelte",
        "tailwindcss",
        "texlab",
        "tsserver",
    }
})
