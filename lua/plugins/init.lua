local M = {}

M = require("packer").startup {
  function (use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use "catppuccin/nvim"
    -- use "morhetz/gruvbox"
  end
}

return M
