## Linearisation for this example.
Setpath;
Setplot;
clear;

## Set up external part.
sys = "ABCAoC";
Figures_stoich;

## lambda = 2;			# Ratio of external states
## x_e =[1;1];			# External state
## K_e = [lambda;1];		# External gains

KK_e = KK(4:5)

## N_ef = [0 0 1
##         0 0 0];

## N_er = [0 0 0
##         0 0 1];
N_ef = N_f(4:5,:)
N_er = N_r(4:5,:)
N_e = -N_ef + N_er;
## A_ef = N_ef'*log(KK_e.*x_e) 
## A_er = N_er'*log(KK_e.*x_e) 
 
## Parameters (set up in Figures_stoic)
##kappa = k = [1;2;3];
kappa = k = kk;

 ## Set up internal part.
 sys = "ABCAo";
 Figures_stoich;

 ## Parameters
 sym = ABCAoC_sympar;
 par = ABCAoC_numpar;

 ## Initial full state.
 ##X_0 = [1;1;1];
 X_0 = [3;1;0];			# CF Figures_sim.m
 X_0 = [2;1;1];			# Same total.

 ## New method.
 [X_ss,v_ss,x_ss] = stoich2ss (N_f,N_r,kappa,KK,N_ef,N_er,KK_e,X_0,L_xX,L_Xx,G_X);
 [A0 B0 C0 D0] = stoich2lin (N_f,N_r,kappa,KK,N_ef,N_er,KK_e,X_ss)

 ## Normalise
 A1 = A0;
 B1 = B0*diag(kappa)/diag(v_ss);
 C1 = C0;
 D1 = D0*diag(kappa)/diag(v_ss);

 ## Reduced order
 A = L_xX*A1*L_Xx
 B = L_xX*B1;
 C = C1*L_Xx;
 D = D1;

 lsys = ss(A,B,C,D);
 Lsys = ss(A1,B1,C1,D1);

 ## Step resp.
 t = [0:0.01:2]';
 n_t = length(t);
 one = ones(size(t));
 n_u = length(kappa);
 V_ss = [];
 V = [];
 for i=1:n_u
   u = zeros(n_t,n_u);
   u(:,i) = one;
   v = lsim(lsys,u,t);
   figure(20+i);
   plot(t,v);
   xlabel("t");
   y_label = sprintf("dv/\\kappa_%i",i);
   ylabel(y_label)
   grid
   axis([0 max(t) 0 1])
   Legend = {"v_1" "v_2" "v_3"};
   legend(Legend);
   ##fig("ABCA_lin",num2str(i),2)

   V = [V v];
   V_ss = [V_ss sum(v(n_t,1))];
 endfor

 CHECK_v_ss = norm(sum(V_ss) - 1)

 n_V = 3;
 Sum_v = [];
 for i_v = 1:n_V
     sum_v = sum(V(:,[i_v:3:9])')';
     Sum_v = [Sum_v sum_v];
 endfor
 figure(30); plot(t,Sum_v)
 CHECK_v = norm(Sum_v - 1)

 ## SS of linear system
 Lin_ss = D - C*(A\B);
 lin_ss = [1 0 0]*Lin_ss;		# Pick out v_1
 CHECK_ss = norm(lin_ss - V_ss)

 ## Non-linear simulation.
 sys = "ABCAok";
 isys = "iABCAok";
 dkappa_1 = 0.1;			# CF ABCAok_numpar.txt
 [x X V_nl] = stoich_sim (sys, isys, t,X_ss);
 V_norm = diag(1./v_ss)*(V_nl-v_ss)/dkappa_1;
 figure(30); plot(t,V_norm - V(:,1:3)');
 xlabel("t");
 grid
 Legend = {"v_1" "v_2" "v_3"};
 legend(Legend);
 fig("ABCA_lin","error",2);

 figure(31); plot(t,V_norm);
   xlabel("t");
   y_label = sprintf("dv/\\kappa_%i",1);
 %  ylabel(y_label)
   grid
   Legend = {"v_1" "v_2" "v_3"};
   legend(Legend);
   axis([0 max(t) 0 1])
 fig("ABCA_lin","exact",2)
 CHECK_lin = norm(V_norm-V(:,1:3)')/n_t
 max_err = max(max(abs(V_norm-V(:,1:3)')))

 ## Transfer functions etc
 i_fig = 40
 w = logspace(-1,2,200);
 for i=1:n_V
   for j=1:n_V
       B_j = B(:,j);
       C_i = C(i,:);
       D_ij = D(i,j);
       lsys_ij = ss(A,B_j,C_i,D_ij);
       tf(lsys_ij)

      ## Step resp
       figure(i_fig++);
       y_step = step(lsys_ij,max(t),mean(diff(t)));
       plot(t,y_step);
       grid;
       axis([min(t) max(t) 0 1])
       xlabel("t");
       ##ylabel("g(t)");
       fig("ABCA_lin",sprintf("step_%i%i",i,j),2)

       ## Frequency resp
       figure(i_fig++);
       mG = bode(lsys_ij,w);
       loglog(w,mG);
       grid;
       axis([min(w) max(w) 1e-2 1])
       ##ylabel("|G(j\\omega)|")
       xlabel("\\omega")
       fig("ABCA_lin",sprintf("bode_%i%i",i,j),2)
   endfor
 endfor


 ## As the system is actually linear - find the steady state directly
 ## Check A first
 X_e = [1;1];

 C1 = diag(kappa)*[KK(1) -KK(2) 0
		   0     KK(2) -KK(3)
		   -KK_e(2)*X_e(2)*KK(1) 0 KK_e(1)*X_e(1)*KK(3)];
 CHECK_C = norm(C1-C0)

 A1 = N*C1;
 CHECK_A = norm(A1-A0)

 ## Full model
 X_ss_1 = expm(A0*5)*X_0
 CHECK_X_ss = norm(X_ss_1-X_ss)

 ## Reduced Model
 aa = L_xX*A0*L_Xx
 w = L_xX*A0*G_X*X_0
 xx_ss = -aa\w
 CHECK_x_ss = norm(xx_ss-x_ss)

 XX_ss = L_Xx*x_ss + G_X*X_0
 CHECK_X_ss = norm(XX_ss-X_ss)

 ## Test formulae for linear (closed) case
 par_c = ABCA_numpar;
[A_c0 B_c0 C_c0] = ABCA_dm(par_c,ones(3,1));

C_c = -diag(kk)*N'*diag(KK);
TEST_C = norm(C_c - C_c0) 

A_c = N*C_c
[A_cl B_cl C_cl D_cl] = stoich2lin (N_f,N_r,kappa,KK,[],[],[],X_ss);
TEST_A = norm(A_cl - A_c) 
TEST_C = norm(C_cl - C_c) 
