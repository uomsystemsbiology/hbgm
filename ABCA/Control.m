global sim_par

Setpath; Setplot;
i_fig=10;

sys = "ABCAov"			# External flow system.
Figures_stoich;

## Extract
names = {"N_i" "N_e" "K" "n_X" "n_v" "L_xX" "L_Xx" "G_X" "J_vX"};
for i = 1:length(names)
  name = names{i};
  eval(sprintf("%s = m.%s;", name, name));
endfor

K_i = K(1:3);
A = N_i*J_vX;
B = N_e;
C = J_vX;				# flows.
r_AB = rank([B A*B]);
SYS = ss(A,B,C);

## Open-loop sim
sim_par.i_v = -1;
X_0 = [4;2;1.5;3;0.5];			# Initial state 
x_0 = L_xX*X_0;
t = [0:0.01:4];
one = ones(size(t));
u = 0*[one'];

## Linear simulation - open-loop
[V, tt, X] = lsim(SYS,u,t,X_0);		# Full system
V = V';
X = X';

## Plot
name = sprintf("%s_ol",sys)
Plot_control;

## Non-linear simulation - open-loop
[x_n X_n V_n] = stoich_sim (sys, isys, t, X_0);

## Plot
name = sprintf("%s_ol_nl",sys)
Plot_control;

## Closed-loop simulation
## i_v=1 - flow control
## i_v=0 - state control

for i_v = [0:2]
  sim_par.i_v = i_v;
  i_x = 1-i_v;
  if (i_v==0)
    name = sprintf("%s_x",sys)
  elseif (i_v==1)
    name = sprintf("%s_v",sys)
  elseif (i_v==2)
    name = sprintf("%s_r",sys)
  endif
  
  if i_v<2
    k_v = i_v*2*[1 1 1];
    k_X = i_x*5*[0 0 0 1 0];
    
    ## Params for non-linear simulation
    sim_par.k_i = K_i;
    sim_par.k_v = k_v;
    sim_par.k_x = k_X;
    sim_par.x_0 = X_0;
    sim_par.c = C;
    
    A_c = A-B*k_v*C - B*k_X;		# Closed loop A
    A_c_alt = (N_i-N_e*k_v)*C - B*k_X;
    CHECK_A_c = norm(A_c - A_c_alt)
    B_c = B*k_v*K_i + B*k_X*X_0;		# Closed-loop B
    CSYS = ss(A_c,B_c,C);	# Closed-loop system flow output
    
    ## linear simulation
    [V_c tt X_c] = lsim(CSYS,one,t,X_0);
    V_c = V_c';
    X_c = X_c';
    u_cl = k_v*(K_i*one - V_c) + k_X*(X_0*one - X_c);
    
    eig_A_c = eig(A_c)
    ss_gain = -J_vX*(A_c\B_c)
    
    tfun_ol = tf(SYS)
    tfun_cl = tf(CSYS)

    Plot_control;

    nsys = sys;
  else
    nsys = "ABCAovCon"
  endif				# i_v<2
  

  insys = sprintf("i%s", nsys);

  ## Non-linear simulation
  [x X V] = stoich_sim (nsys, insys, t, X_0);

  name = sprintf("%s_nl",name);
  Plot_control

endfor

##x = lsim(sys,u,t,x_0)';		# reduced system
##Xx = L_Xx*x + G_X*X_0*one;
##y = N_i'*(L_Xx*x + G_X*X_0*one);


