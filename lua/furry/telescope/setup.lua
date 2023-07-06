local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

require('telescope').setup {
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",

    winblend = 0,

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "top",

      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-n>"] = "move_selection_next",

        ["<C-y>"] = set_prompt_to_entry_value,

        ["<C-space>"] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist,
          }
          require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
        end,
      },
    },

    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

    file_ignore_patterns = {
    },

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },

  pickers = {
    buffers = {
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
            i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
            n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
            }
        },
    },
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    fzf_writer = {
      use_highlighter = false,
      minimum_grep_characters = 6,
    },

    hop = {
      keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

      sign_hl = { "WarningMsg", "Title" },

      line_hl = { "CursorLine", "Normal" },

      clear_selection_hl = false,
      trace_entry = true,
      reset_selection = true,
    },
  },
}
