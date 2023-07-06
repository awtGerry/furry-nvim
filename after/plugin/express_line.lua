if not pcall(require, "el") then
    return
end

require("el").reset_windows()

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local sections = require ("el.sections")
local subscribe = require ("el.subscribe")
local lsp_statusline = require ("el.plugins.lsp_status")
local lsp_status, ws_diagnostic = pcall(require, "lsp_extensions.workspace.diagnostic")
local diagnostic = require ("el.diagnostic")

local lsp_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
  local icon = extensions.file_icon(_, bufnr)
  if icon then
    return icon .. " "
  end

  return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return " " .. extensions.git_icon() .. " " .. branch
  end
end)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
  return extensions.git_changes(window, buffer)
end)

require("el").setup {
    generator = function (window, buffer)
        local mode = extensions.gen_mode { format_string = " %s " }
        local items = {
            { mode, require = true },
            { " " },
            { "󰝰 " },
            { sections.maximum_width(builtin.file_relative, 0.60), required = true },
            { git_branch },
            { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
            { sections.collapse_builtin { { " " }, { builtin.readonly } } },

            { sections.split, required = true },
            { lsp_icon },
            { builtin.filetype_flag },

            { sections.split, required = true },
            { lsp_statusline.server_progress },
            { git_changes },
            { "[" },
            { builtin.line_with_width(3) },
            { ":" },
            { builtin.column_with_width(2) },
            { "]" },

        }

        local add_items = function(result, item)
            table.insert(result, item)
        end

        local result = {}
        for _, item in ipairs(items) do
            add_items(result, item)
        end
        return result
    end,
}

require("fidget").setup {
    text = {
        spinner = "moon",
    },
    align = {
        bottom = true,
    },
    window = {
        relative = "editor",
    },
}
