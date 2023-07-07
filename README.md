<div align="center">
    <h1><strong>Configuracion neovim</strong></h1>
    <img title="screenshot" alt="system" src="./public/neovim.png">
    <img title="screenshot" alt="system" src="./public/rs_example.png">
    <p>Intentando hacer una configuracion de neovim adecuada, accesible y rapida.</p>
</div>

# Plugins
Para instalar nuevos plugins en `lua/packer/plugins/init.lua`

# LSP
Hay plugin que permite implementar nuevos lenguajes con el comando
`:MasonInstall [nombre]`, si hay un lenguaje que no carga automaticamente se debe anadir
a la tabla de servidores en `lua/furry/lsp/init.lua`

# Configuracion
## Plugins
Todas las configuraciones de plugins estan en `after/plugin`, menos lsp y telescope por ser mas complejas.

# Referencias
