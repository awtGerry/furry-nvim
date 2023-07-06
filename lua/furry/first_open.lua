local fn = vim.fn
-- Ruta por defecto de packer
local path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- Checar si packer esta instalado, si no instalarlo junto con plugins
if fn.empty(fn.glob(path)) > 0 then
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        path,
    })
	vim.cmd("packadd packer.nvim")
end
