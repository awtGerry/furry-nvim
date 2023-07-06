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
  ps("doc",
[[
\documentclass{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage[document]{ragged2e}

\usepackage{amsfonts}
\usepackage{natbib}
\usepackage[dvipsnames]{xcolor}
\usepackage{graphicx}

\usepackage[fleqn]{amsmath}
\usepackage{amssymb}

\title{$1}
\author{Victor Gerardo Rodríguez Barragán}
\date{$2}

\begin{document}
\maketitle
$0

\end{document}]]
  ),
  s("bg", fmt("\\begin{{{}}}\n\\end{{{}}}", { i(1, ""), rep(1) })),
  s("bgs", fmt("\\begin{{{}}}\\end{{{}}}", { i(1, ""), rep(1) })),
  ps("im", '\\includegraphics[width=$1\\textwidth]{$2}$0'),
  ps("s", '\\section{$1}$0'),
  ps("ss", '\\section*{$1}$0'),
  ps("sb", '\\subsection{$1}$0'),
  ps("ssb", '\\subsection*{$1}$0'),
  ps("sbb", '\\subsubsection{$1}$0'),
  -- Text
  ps("tc", "\\textcolor{$1}{$2}$0"),
  ps("tu", "\\underline{$1}$0"),
  ps("tb", "\\textbf{$1}$0"),
  ps("en", "\\begin{enumerate}\n\\item $0\n\\end{enumerate}"),
  ps("it", "\\item $0"),
  ps("t", "\\text{$1}$0"),
  ps("vs", "\\vspace{$1}$0"),
  ps("vss", "\\vspace{0.5cm}$0"),

  -- Math
  ps("mk", "\\$$1\\$$0"),
  ps("vc", "\\vec{$1}$0"),
  ps("fc", "\\frac{$1}{$2}$0"),
  ps("eq", "\\begin{equation}\n$0\n\\end{equation}"),
  ps("al", "\\begin{align*}\n\t$0\n\\end{align*}"),
  ps("nt", "\\notag"),
  ps("mx", "\\begin{bmatrix}\n\t$0\n\\end{bmatrix}"),
  ps("dc", "\\dotsc"),

  -- OneLine
  s("lbg", fmt("\\begin{{{}}}\\end{{{}}}", { i(1, ""), rep(1) })),
  ps("lmx", "\\begin{bmatrix}$1\\end{bmatrix}$0"),
})
