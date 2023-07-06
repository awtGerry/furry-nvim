# Configuracion de neovim
Intentando hacer una configuracion de neovim mas adecuada y accesible
para cuando el cambio.

# Plugins
Para instalar nuevos plugins en `lua/plugins/init.lua`

# LSP
La configuracion incluye un plugin que permite instalar los lenguajes con el comando
``MasonInstall [nombre]``, si hay un lenguaje que no carga automaticamente se debe anadir
a la tabla de servidores en `lua/furry/lsp/init.lua`

# Configuracion
## Plugins
Todas las configuraciones de plugins estan en `after/plugin`, menos lsp y telescope por ser mas complejas.