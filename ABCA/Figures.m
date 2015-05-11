## Figures for report

Sys = {"ABCA" "ABCAo"}
##Sys = {"ABCA" "ABCADM" "ABCAo"  "ABCAoC"}
for i = 1:length(Sys)
  sys = Sys{i}
  Figures_stoich;
  Figures_sim;
endfor

##Figures_lin;
##Figures_kappa;

## Control stuff
##Control
