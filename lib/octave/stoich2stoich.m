function M = stoich2stoich (m)
	 
  ## usage: M = stoich2stoich (m)
  ## 
  ## 

  ## Copy
  M = m;
	 
  ## Extract info
  N = m.N;			# Stoichiometric matrix
  r = rank(N);			# Rank
  [n_X,n_V] = size(N);		# Sizes
  M.N = N;
  
  ## Null space stuff
  [G,K] = stoich2null(N);
  M.G = G;
  M.K = K;
  
  ## Range space stuff
  [RR I_x]  = rref (N');	# Reduced row echelon form
  n_x = length(I_x);		# Number of reduced-order states
  
  ## Transformations 
  
  ## Transform x to X
  M.L = M.L_Xx = L_Xx = RR'(:,1:n_x);
  
  ## Transform X to x
  T = eye(n_X);
  M.L_xX = L_xX = T(I_x,:);
  
  ## Transform X to x_d
  I_d = setdiff(1:(n_X),I_x);
  M.L_dX = L_dX = T(I_d,:);
  
  ## For reconstructing X from x
  M.G_X = G_X = L_dX'*G;			

  ## Some dimensions
  [M.n_X M.N_V] = size(N);
  M.n_x = n_x;

endfunction
