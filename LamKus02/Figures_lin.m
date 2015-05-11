X_ss = X(:,n_t);		# Final value


## Mass action equivalent
for i = 1:length(bg.reaction)
    reac = bg.reaction{i};
    val = eval(reac);
    bg.V_max(i,1) = val.v_max; 
    bg.K_v(i,1) = val.k_v; 
endfor

kappa = bg.V_max(i,1)./bg.K_v(i,1);

[A B C D] = stoich2lin (bg.N_f,bg.N_r,kappa,bg.K_c,[],[],[],X_ss);

eigs= sort(eig(bg.L_xX*A*bg.L_Xx))
