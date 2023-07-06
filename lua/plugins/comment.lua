return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {

        opleader = {
          -- Comentar por linea
          line = "gc",
          --[[ Comentar por bloque ]]
          block = "gb",
        },

        mappings = {
          basic = true,
          extra = true,
        },

        toggler = {
          line = "gcc",
          block = "gbc",
        },
      }

      local comment_ft = require "Comment.ft"
      comment_ft.set("lua", { "--%s", "--[[%s]]" })
    end,
  },
}
