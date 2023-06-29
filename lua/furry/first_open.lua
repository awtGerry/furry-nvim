local fn = vim.fn
-- Ruta por defecto de packer
local path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- Checar si packer esta instalado, si no instalarlo junto con plugins
if fn.empty(fn.glob(path)) > 0 then
	local cmd = io.popen("git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. path)
	local res = cmd:read("*all")
	cmd:close()

	vim.cmd("packadd packer.nvim")

	-- Instalar plugins
	vim.cmd("so lua/plugins/init.lua")
	vim.cmd("PackerSync")
end
