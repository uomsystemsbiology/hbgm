(TeX-add-style-hook "_region_"
 (lambda ()
    (LaTeX-add-bibliographies
     "common")
    (LaTeX-add-labels
     "subfig:#1"
     "fig:sim_LamKus02-#1"
     "sec:introduction"
     "fig:LamKus02"
     "sec:bond-graph-model"
     "fig:bg"
     "fig:bg_submodel_1"
     "fig:bg_submodel_2"
     "fig:bg_submodel_3"
     "eq:sub_stoich"
     "tab:K_eq"
     "eq:GP"
     "eq:Keqb"
     "sec:sim"
     "tab:ME"
     "sec:errors-citelamkus02"
     "sec:TPI"
     "sec:discr-sbml-vers")
    (TeX-add-symbols
     '("FIG" 2)
     '("SubFig" 3)
     '("Fig" 2)
     '("reacu" 1)
     '("reacul" 2)
     "reac")
    (TeX-run-style-hooks
     "doi"
     "url"
     "hyperref"
     "pagebackref"
     "endfloat"
     "color"
     "fancybox"
     "subfigure"
     "graphicx"
     "natbib"
     "longnamesfirst"
     "sort"
     "round"
     "authoryear"
     "amsxtra"
     "mathtools"
     "amstext"
     "amscd"
     "amsbsy"
     "amssymb"
     "amsmath"
     ""
     "latex2e"
     "art12"
     "article"
     "a4paper"
     "12pt"
     "BG_reac")))

