if not pcall(require, "luasnip") then
  return
end

local require = require

local ok, plenary_reload = pcall(require, "plenary.reload")
local reloader = require
if ok then
  reloader = plenary_reload.reload_module
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  local ok, plenary_reload = pcall(require, "plenary.reload")
  if ok then
    reloader = plenary_reload.reload_module
  end

  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

local make = R("furry.snips").make

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = false,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,

  -- ext_opts = {
  --   [types.choiceNode] = {
  --     active = {
  --       virt_text = { { " « ", "NonTest" } },
  --     },
  --   },
  -- },
}

local snippet = ls.s
local snippet_from_nodes = ls.sn
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local events = require "luasnip.util.events"

-- local str_snip = function(trig, expanded)
--   return ls.parser.parse_snippet({ trig = trig }, expanded)
-- end

local same = function(index)
  return f(function(args)
    return args[1]
  end, { index })
end

local toexpand_count = 0

ls.add_snippets(nil, {
  snippet("simple", t "wow, you were right!"),
  snippet("toexpand", c(1, { t "hello", t "world", t "last" }), {
    callbacks = {
      [1] = {
        [events.enter] = function(--[[ node ]])
          toexpand_count = toexpand_count + 1
          print("Number of times entered:", toexpand_count)
        end,
      },
    },
  }),
  snippet("never_expands", t "this will never expand, condition is false", {
    condition = function()
      return false
    end,
  }),
  snippet({ trig = "date" }, {
    f(function()
      return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
    end, {}),
  }),
  snippet("for", {
    t "for ",
    i(1, "k, v"),
    t " in ",
    i(2, "ipairs()"),
    t { "do", "  " },
    i(0),
    t { "", "" },
    t "end",
  }),
})

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
ls.add_snippets(nil, {
  snippet(
    { trig = "$$ (.*)", regTrig = true },
    f(function(_, snip, command)
      if snip.captures[1] then
        command = snip.captures[1]
      end

      local file = io.popen(command, "r")
      local res = { "$ " .. snip.captures[1] }
      for line in file:lines() do
        table.insert(res, line)
      end
      return res
    end, {}, "ls"),
    {
      -- Don't show this one, because it's not useful as a general purpose snippet.
      show_condition = function()
        return false
      end,
    }
  ),
})

local js_attr_split = function(args)
  local val = args[1][1]
  local split = vim.split(val, ".", { plain = true })

  local choices = {}
  local thus_far = {}
  for index = 0, #split - 1 do
    table.insert(thus_far, 1, split[#split - index])
    table.insert(choices, t { table.concat(thus_far, ".") })
  end

  return snippet_from_nodes(nil, c(1, choices))
end

local fill_line = function(char)
  return function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(0, row - 2, row, false)
    return string.rep(char, #lines[1])
  end
end

ls.add_snippets(
  "rst",
  make {
    jsa = {
      ":js:attr:`",
      d(2, js_attr_split, { 1 }),
      " <",
      i(1),
      ">",
      "`",
    },

    link = { ".. _", i(1), ":" },

    head = f(fill_line "=", {}),
    sub = f(fill_line "-", {}),
    subsub = f(fill_line "^", {}),

    ref = { ":ref:`", same(1), " <", i(1), ">`" },
  }
)

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/furry/snips/tp/*.lua", true)) do
  loadfile(ft_path)()
end

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
