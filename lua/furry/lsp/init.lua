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
    buf_key("n", "<space>dn", vim.diagnostic.goto_next, {buffer=0})
    buf_key("n", "<space>dp", vim.diagnostic.goto_prev, {buffer=0})
    buf_key("n", "<space>D", vim.lsp.buf.type_definition, {buffer=0})

    buf_key("n", "<space>r", vim.lsp.buf.rename, {buffer=0})

    buf_key("n", "<space>lR", "LspRestart")
    buf_key("n", "<space>lf", "Telescope lsp_references")
    buf_key("n", "<space>li", "Telescope lsp_implementations")

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"


  if filetype == "typescript" or filetype == "lua" then
    client.server_capabilities.semanticTokensProvider = nil
  end
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
    rust_analyzer = true,
    svelte = true,
    tailwindcss = true,
    texlab = true,
    tsserver = true,
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
