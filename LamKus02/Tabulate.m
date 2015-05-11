disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
disp("%% BG Reaction parameters")
disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
printf("\\hline\n");
printf("%s & $%s$ & $%s$ & $%s$\\\\\n", "Reaction", "v_{max}", "k_v", "\\rho_v");
printf("\\hline\n");
for i = 1:length(bg.reaction)
    name = bg.reaction{i};
    params = eval(name);
    printf("%s & %5.3e & %5.3e & %5.3e\\\\\n", name, params.v_max, params.k_v, params.rho_v)
endfor
printf("\\hline\n");

disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
disp("%% BG Species parameters")
disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
printf("\\hline\n");
printf("%s & %s & %s \\\\ \n", "Species",  "K", "$\\frac{\\mu_0}{\\RT}$");
printf("\\hline\n");
for i = 1:length(bg.species)
    name = bg.species{i};
    printf("%s & %5.3e & %5.3e \\\\\n", name, bg.K_c(i), log(bg.K_c(i)));
endfor
printf("\\hline\n");

disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
disp("%% LamKus02 parameters")
disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
printf("\\hline\n");
printf("Reaction & $K^{eq}$ & $V_{maxf}$ & $V_{maxr}$ & $K^M_a$ & $K^M_b$\\\\ \n");
printf("\\hline\n");
for i = 1:length(bg.reaction)
    name = bg.reaction{i};
    params = eval(name);
    if length(params.v_max_f)>0
       v_max_f_str = sprintf("%5.3e",params.v_max_f);
       v_max_r_str = "--";
    else
       v_max_f_str = "--";
       v_max_r_str = sprintf("%5.3e",params.v_max_r);
    endif
   printf("%s & %5.3e & %s & %s & %5.3e& %5.3e\\\\\n", name, params.K_eq, ...
	  v_max_f_str, v_max_r_str, ...
	 params.Km_f, params.Km_r);       


endfor
printf("\\hline\n");
