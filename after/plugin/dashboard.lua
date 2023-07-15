local alpha = require "alpha"

local headers = {
    psyduck = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠸⣷⣮⣿⣿⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢀⡠⠒⠉⠀⠀⠀⠀⠀⠀⠈⠁⠲⢖⠒⡀⠀⠀",
        "⠀⠀⠀⡠⠴⣏⠀⢀⡀⠀⢀⡀⠀⠀⠀⡀⠀⠀⡀⠱⡈⢄⠀",
        "⠀⠀⢠⠁⠀⢸⠐⠁⠀⠄⠀⢸⠀⠀⢎⠀⠂⠀⠈⡄⢡⠀⢣",
        "⠀⢀⠂⠀⠀⢸⠈⠢⠤⠤⠐⢁⠄⠒⠢⢁⣂⡐⠊⠀⡄⠀⠸",
        "⠀⡘⠀⠀⠀⢸⠀⢠⠐⠒⠈⠀⠀⠀⠀⠀⠀⠈⢆⠜⠀⠀⢸",
        "⠀⡇⠀⠀⠀⠀⡗⢺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡄⢀⠎",
        "⠀⢃⠀⠀⠀⢀⠃⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠷⡃⠀",
        "⠀⠈⠢⣤⠀⠈⠀⠀⠑⠠⠤⣀⣀⣀⣀⣀⡀⠤⠒⠁⠀⢡⠀",
        "⡀⣀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⠀",
        "⠑⢄⠉⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀",
        "⠀⠀⠑⠢⢱⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⠀",
        "⠀⠀⠀⠀⢀⠠⠓⠢⠤⣀⣀⡀⠀⠀⣀⣀⡀⠤⠒⠑⢄⠀⠀",
        "⠀⠀⠀⠰⠥⠤⢄⢀⡠⠄⡈⡀⠀⠀⣇⣀⠠⢄⠀⠒⠤⠣⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀",
    },

    furry = {
      "███████ ██    ██ ██████  ██████  ██    ██ ███    ██ ██    ██ ██ ███    ███ ",
      "██      ██    ██ ██   ██ ██   ██  ██  ██  ████   ██ ██    ██ ██ ████  ████ ",
      "█████   ██    ██ ██████  ██████    ████   ██ ██  ██ ██    ██ ██ ██ ████ ██ ",
      "██      ██    ██ ██   ██ ██   ██    ██    ██  ██ ██  ██  ██  ██ ██  ██  ██ ",
      "██       ██████  ██   ██ ██   ██    ██    ██   ████   ████   ██ ██      ██ ",
    },
}


local dashboard = require "alpha.themes.dashboard"

local function get_size()
    local alpha_wins = vim.tbl_filter(function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
    end, vim.api.nvim_list_wins())

    if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 30 then
        return headers.furry
    else
        return headers.psyduck
    end
end
dashboard.section.header.val = get_size

dashboard.section.buttons.val = {
  dashboard.button("n", "  Crear archivo", "<cmd>ene!<cr>"),
  dashboard.button("f", "  Buscar archivos", "<cmd>Telescope find_files<cr>"),
  dashboard.button("s", "󰊄  Buscar texto", "<cmd>Telescope live_grep<cr>"),
  dashboard.button("e", "  Explorador de archivos", "<cmd>NvimTreeOpen<cr>"),
  dashboard.button("c", "  Configuracion", "<cmd>e $MYVIMRC<cr>"),
  -- dashboard.button("d", "󰆼  Bases de datos", "<cmd>DBUI<cr>"),
  dashboard.button("q", "󰩈  Salir de neovim", "<cmd>quit<cr>"),
}

dashboard.opts.opts.noautocmd = false
alpha.setup(dashboard.opts)
