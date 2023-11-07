local neodev = vim.F.npcall(require, "neodev")
if neodev then
  neodev.setup {
    override = function(_, library)
      library.enabled = true
      library.plugins = true
    end,
    lspconfig = true,
    pathStrict = true,
  }
end

local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
    return
end

local tele_maps = require("furry.telescope.telemaps")

local buf_key = vim.keymap.set
local custom_attach = function(client)
    if client.name == "copilot" then
        return
    end
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    buf_key("n", "K", vim.lsp.buf.hover, {buffer=0})
    buf_key("n", "gd", vim.lsp.buf.definition, {buffer=0})
    buf_key("n", "gD", vim.lsp.buf.declaration, {buffer=0})
    buf_key("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    buf_key("n", "gi", vim.lsp.buf.implementation, {buffer=0})

    buf_key("n", "<space>ld", vim.diagnostic.goto_next, {buffer=0})
    buf_key("n", "<space>lp", vim.diagnostic.goto_prev, {buffer=0})
    buf_key("n", "<space>lD", vim.lsp.buf.type_definition, {buffer=0})

    buf_key("n", "<space>ca", vim.lsp.buf.code_action, {buffer=0})

    buf_key("n", "<space>r", vim.lsp.buf.rename, {buffer=0})

    buf_key("n", "<space>lr", "<cmd>LspRestart<cr>")
    tele_maps("<space>lf", "lsp_references")
    tele_maps("<space>ll", "lsp_implementations")
    tele_maps("<space>ls", "lsp_document_symbols", { ignore_filename = true }, true)
    tele_maps("<space>lw", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

end

-- local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
    bashls = true,
    clangd = true,
    cssls = true,
    gopls = true,
    html = true,
    lua_ls = true,
    dartls = true,
    rust_analyzer = true,
    svelte = true,
    tailwindcss = true,
    texlab = true,
    pyright = true,
    tsserver = {
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx"
        },
    },
}

local setup_servers = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    config = vim.tbl_deep_extend("force", {
        on_init = custom_init,
        on_attach = custom_attach,
        capabilities = capabilities,
    }, config)

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_servers(server, config)
end
