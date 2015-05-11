function [dx V] = stoich_sim_fun (x,t)
  
  ## usage:  dx = stoich_sim_fun (x,t)
  ##
  ## Function for simulation of reduced-order stoichiometric equations
  ## global  STOICH contains simulation information.
  ## Simulate using stoich_sim
  
  global STOICH

  if nargin<2
    t = STOICH.t;
  endif


  name = STOICH.name;
  N = STOICH.N;
  L = STOICH.L;
  G_X = STOICH.G_X;
  L_xX = STOICH.L_xX;
  X_0 = STOICH.X_0;
  par = STOICH.par;
  I_free = STOICH.I_free;
  J_free = STOICH.J_free;

  X = L*x + G_X*X_0;		# Convert x to X

  ## Avoid numerical issues !!??
  ## small = 1e-10;
  ## i_neg = find(X<small);
  ## X(i_neg) = small;

  u = eval(sprintf("%s_input(X,[],t,par);",name));
  V = eval(sprintf("%s_odeo(X,u,t,par);",name));
  
  V = J_free*V;			# Set some flows to zero.

  ## Enzyme modulation
  enzyme_fun = STOICH.enzyme_fun;
  if length(enzyme_fun)>0
     U = eval(sprintf("%s(X,t)",enzyme_fun));
     V = U.*V;
  endif

  ##dx = L_xX*I_free*N*V;
  dx = L_xX*N*V;

endfunction
