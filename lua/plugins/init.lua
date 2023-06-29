local M = {}

M = require("packer").startup {
  function (use)
    --[[ Necesarios ]]
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    --[[ Basicos ]]
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-context"
    -- Telescope
    use "nvim-telescope/telescope.nvim"

    --[[ Apariencia ]]
    use "nvim-tree/nvim-web-devicons"

    -- Temas
    use "catppuccin/nvim"
    use "morhetz/gruvbox"
  end
}

return M
