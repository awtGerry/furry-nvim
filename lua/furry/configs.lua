local opt = vim.opt

-- Basicos
opt.belloff = "all" -- Quita la campana (creo ya no es necesario)
opt.number = true -- Linea de numeros a la izquierda
opt.relativenumber = true -- Los numeros cambian relativo a donde esta el cursor
opt.scrolloff = 10 -- La pantalla comenzara a bajar n lineas antes del final
opt.showmode = false -- Quita los modos (insert, visual, etc) en el cmd de vim
opt.signcolumn = "yes" -- Barra en donde aparecen los errores
opt.cursorline = true -- Destaca la linea en la que esta el cursor
opt.wrap = false -- Si el texto sale de la pantalla (horizontal) desabilitar que siga en la sig. linea
opt.updatetime = 1000 -- Actualiza en 1000ms al swap
opt.hidden = true -- Deja los buffers siempre abiertos (+ RAM)
opt.clipboard = "unnamedplus" -- Comparte el clipboard de vim con el del sistema
opt.shortmess = opt.shortmess + "c" -- Quita unos mensajes de error

opt.mouse = "nvi" -- Habilita el mouse
-- opt.mouse = "" -- Desabilita el mouse

-- Busqueda
opt.incsearch = true -- Mientras se escribe se van mostrando resultados
opt.hlsearch = false -- Quita highlights
opt.ignorecase = true -- Ignora caracteres en busqueda
opt.smartcase = true -- Sensible a mayusculas

opt.wildmode = "longest:full"
opt.wildoptions = "pum"

-- Tabular
-- Dejar tab en 4 excepto en web
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
vim.cmd [[
    autocmd BufRead,BufNewFile *.html,*.js,*.ts,*.svelte,*tsx,*.css,*php setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.php set autoindent
]]
opt.smartindent = true -- Tab iniciando nueva linea
opt.expandtab = true -- En modo INSERT usa el numero correcto de espacios

-- Ventanas
opt.equalalways = false -- Las pantallas divididas siempre tendran el mismo tamano (no)
opt.splitright = true -- Cuando hay una nueva ventana mandarla a la derecha (:vsplit)
opt.splitbelow = true -- Lo mismo pero hacia abajo (:split)

opt.pumblend = 17 -- Habilita pseudo-transparencia

-- UNDOTREE (plugin)
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir/"
opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.formatoptions = opt.formatoptions
    - "a" -- Autoformat
    - "t" -- Autoformat
    + "c" -- Comentarios respetan anchura.
    - "o" -- Dejar de comentar en nuevas lineas.
    - "r" -- Dejar de comentar en nuevas lineas.
    + "j" -- Quitar comentarios si es posible.
