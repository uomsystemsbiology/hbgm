global sim_par
sim_par.i_v = -1;		# Open-loop.

if !exist("sys")
  sys="ABCAo"
end

isys = sprintf("i%s",sys);	# Name of inverse system

## Simulation.
Setpath; Setplot

i_fix = [];			# No fixed parameters.
if strcmp(sys,"ABCAov");
  X_0 = [3;2;1.5;2;1];
elseif strcmp(sys,"ABCAoC");
  X_0 = [3;1;0;1;1];
  i_fix = [4 5];		# Fix last two states
else
  X_0 = [3;1;0];		# Initial state
endif
n_X = length(X_0);
i_free = setdiff([1:n_X],i_fix);

## Check eigs.
# par = ABCA_numpar;
# [AA,BB,CC] = ABCA_dm(par,X_0);
# NN = BB;
# GG = CC;
# eig(NN*GG)

t = [0:0.01:2];			# Time

## Simulation
tick = time;
[x X V] = stoich_sim (sys, isys, t,X_0,i_fix);
elapsed = time-tick

## Test version without iSys
tick = time;
[x_1 X_1 V_1] = stoich_sim (sys, [], t,X_0,i_fix);
elapsed = time-tick

##CHECK_sim_x = norm(x-x_1)
CHECK_sim_X = norm(X-X_1)

## Plot
 figure(10);
 ##subplot(2,1,1);
 ##plot(t,V(1:3,:));
 plot(t,V(1,:),"-", t,V(2,:),"--", t,V(3,:),"-.");
 xlabel("t (s)")
 ylabel("V (M/s)")
 ylim([-3 2]);
 grid
 legend({"v_1" "v_2" "v_3"},"location","south")
 legend("boxoff")
 fig(sys,"sim_v",2)

figure(11);
##subplot(2,1,2);
##plot(t,X);
plot(t,X(1,:),"-", t,X(2,:),"--", t,X(3,:),"-.");
grid
xlabel("t (s)")
ylabel("X (M)")
legend({"x_a" "x_b" "x_c"},"location","north")
legend("boxoff")
fig(sys,"sim_x",2)

## Power stuff.
RT = 8.3144621*300;
RT = 1;				# Normalise

## sys_SAVE = sys;
## sys = "ABCAoC";
## Figures_stoich;
## sys = sys_SAVE;

## Get overall N from ABCAoC
m_C = dm2stoich("ABCAoC","");
N = m_C.N;

## Get K as well.
par = ABCAoC_numpar;
sym = ABCAoC_sympar;
I_K = [sym.K_a sym.K_b sym.K_c sym.K_f sym.K_r];
I_k = [sym.kappa_1 sym.kappa_2 sym.kappa_3];
KK = par(I_K);
kk = par(I_k);

one = ones(size(t));
if strcmp(sys,"ABCA")
  A_e = [0;0;0]*one;
  N_e = 0;
  mu_e = 0;
  N = N(1:3,:); 
  K = KK(1:3);
  K_e = 0;
elseif strcmp(sys,"ABCAoC")
  A_e = [0;0;0]*one;
  N_e = 0;
  mu_e = 0;
  K = KK(1:5);
  K_e = 0;
else
  N_e = N(4:5,:);
  N = N(1:3,:);  
  K = KK(1:3);
  K_e = KK(4:5);
  sym = ABCAo_sympar;
  par = ABCAo_numpar;
  X_e = [par(sym.X_f); par(sym.X_r)]*one;
  mu_e = RT*log(K_e.*X_e);
  A_e = -N_e'*mu_e;
endif

one = ones(size(t));

## Compute chemichal potentials and affinities
if strcmp(sys,"ABCAoC")
K_i = [1;1;1;2;0.25]*one;
K_e = 0*one;
else
K_i = [1;1;1]*one;
K_e = [2;0.25]*one;
endif
mu_i = RT*log(K_i.*X);		
A_i = -N'*mu_i;

## Resistive power dissipated
A = A_i + A_e;
P_r = sum(V.*A);


if strcmp(sys,"ABCAoC")
  ## Power into C components
  V_i = N*V;
  P_i = sum(V_i(i_free,:).*mu_i(i_free,:));

  ## Power from outside
  P_e = -sum(V_i(i_fix,:).*mu_i(i_fix,:));
else
  ## Power into C components
  V_i = N*V;
  P_i = sum(V_i.*mu_i);

  ## Power from outside
  V_e = N_e*V;
  P_e = -sum(V_e.*mu_e);
endif

## CHECK
CHECK_P = max(abs(P_e -(P_i + P_r)))

figure(20);
plot(t,P_e,"-;P_E;", t,P_i,"--;P_C;", t,P_r,"-.;P_R;" );
grid
xlabel("t (sec)")
ylabel("P/RT (M/s)")
ylim([-20 20]);
legend("location","south")
legend("boxoff")

fig(sys,"sim_P",2)


