(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-bibliographies
     "common")
    (LaTeX-add-labels
     "sec:errors-citelamkus02")
    (TeX-run-style-hooks
     "natbib"
     "compress"
     "numbers"
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
     "LamKus02_reac"
     "LamKus02_ode"
     "LamKus02_flow")))

