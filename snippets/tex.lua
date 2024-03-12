local md = require "luasnip-md-utils.nodes"

return {
  -- regular
  md.b_no_math(
    "template",
    fmta(
      [[
        % Ensure local packages are installed to ~/texmf/tex/latex
        %   git clone https://github.com/henrystern/local_latex/ $HOME/texmf/tex/latex
        
        \documentclass[letterpaper, 12pt, leqno]{article}
        \usepackage{minimal}
        \usepackage{math}
        \usepackage{colourbox}
        \bibliographystyle{econ}

        \title{<>}
        \author{Henry Stern}
        \date{<>}                       

        \begin{document}
        \maketitle

        <>
        
        \end{document}
    ]],
      { i(1), i(2, "\\today"), i(3) }
    )
  ),
}, {
  -- autosnippets
}
