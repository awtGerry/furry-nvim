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
        capabilities = updated_capabilities,
    }, config)

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_servers(server, config)
end
