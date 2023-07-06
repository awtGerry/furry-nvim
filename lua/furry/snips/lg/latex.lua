require("luasnip.session.snippet_collection").clear_snippets "markdown"

local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local ps = ls.parser.parse_snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("tex", {
  -- General
  s("bg", fmt("\\begin{{{}}}\n\\end{{{}}}", { i(1, ""), rep(1) })),
  s("bgs", fmt("\\begin{{{}}}\\end{{{}}}", { i(1, ""), rep(1) })),
  ps("lmx", "\\begin{bmatrix}$1\\end{bmatrix}$0"),
})
