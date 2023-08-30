local ls = require "luasnip"

-- local snippet = ls.s
local snippet_from_nodes = ls.sn

local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local shared = R "furry.snips"
local same = shared.same

local newline = function(text)
  return t { "", text }
end

local require_var = function(args, _)
  local text = args[1][1] or ""
  local split = vim.split(text, ".", { plain = true })

  local options = {}
  for len = 0, #split - 1 do
    table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), "_")))
  end

  return snippet_from_nodes(nil, {
    c(1, options),
  })
end

return {
  ignore = "--stylua: ignore",

  doc = {
      desc = "documento",
[[
\\documentclass{article}

\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage[english]{babel}
\\usepackage[document]{ragged2e}

\\usepackage{amsfonts}
\\usepackage{natbib}
\\usepackage[dvipsnames]{xcolor}
\\usepackage{graphicx}

\\usepackage[fleqn]{amsmath}
\\usepackage{amssymb}

\\title{]],i(1),[[}
\\author{Victor Gerardo Rodríguez Barragán}
\\date{]],i(2),[[}

\\begin{document}
\\maketitle
]],i(0),[[
\\end{document}

]]
    },

}
