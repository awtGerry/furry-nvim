vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_auto_execute_table_helpers = 0
vim.g.db_ui_winwidth = 40

vim.g.db_ui_icons = {
    expanded = {
        db = '▾ 󰆼',
        buffers = '▾ 󱘿',
        saved_queries = '▾ ',
        tables = '▾ ',
        table = '▾ 󰠶',
    },
    collapsed = {
        db = '▸ 󰆼',
        buffers = '▸ 󱘿',
        saved_queries = '▸ ',
        tables = '▸ ',
        table = '▸ 󰠶',
    },
    connection_ok = '✓',
    connection_error = '✕',
    new_query = '󰆺',
    saved_query = '󰈮',
    tables = '~',
    buffers = '>',
}
