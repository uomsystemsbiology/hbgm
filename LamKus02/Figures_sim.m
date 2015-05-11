global sim_par
i_colour = 2;

if !exist("sys")
  sys="LamKus02"
end

## Simulation.
Setpath; Setplot

## Set up initial conditions (1mM except for LACo=0 and GLY) 
## X_0 = ones(length(bg.species),1);
## X_0(bg.s_index.LACo) = 1e-10;
## X_0(bg.s_index.GLYf) = 100;
## X_0(bg.s_index.GLYr) = 100;


LamKus02_initial;
X_0 = NaN*ones(length(bg.species),1);
for i = 1:length(bg.species)
  spec = bg.species{i};
  eval(sprintf("X_0(bg.s_index.%s) = %s.x_0;",spec,spec))
endfor

##X_0 = 0.1*ones(length(bg.species),1);

## Sanity check
x_0 = bg.L_xX*X_0;
XX_0 = bg.L_Xx*x_0 + bg.G_X*X_0;
CHECK_X_0 = norm(XX_0-X_0)

## Time (log scale)
##t = logspace(-1,4,1000);	# Time (min)
t = logspace(-1,2,100);	# Time (min)
n_t = length(t);
one = ones(1,n_t);  

if max(t)>1000
  long = "-long";
else
  long = "";
endif

##for open_mode = [0 2 3 4]
for open_mode = [0 4]

  name = sprintf("LamKus02-%i%s",open_mode,long)

  if open_mode==0		# Closed system: Fout off, ATPase off
    ## Fixed quantities
    #Species
    ##i_fix = [bg.s_index.LACo] # Species
    i_fix = [] # Species
    j_fix = [bg.r_index.ATPase,bg.r_index.Fout]		      # Flows
    
    
  elseif open_mode==1 # Closed system: Fout on, ATPase off		
    ## Set up initial conditions
    X_0 = X_inf;
    
    ## Fixed quantities
    ##i_fix = [bg.s_index.LACo] # Species
    i_fix = [] # Species
    j_fix = [bg.r_index.ATPase]				      # Flows
    
  elseif open_mode==2	# Closed system: Fout off, ATPase on	
    ## Set up initial conditions
    X_0 = X_inf;
    
    ## Fixed quantities
    ##i_fix = [bg.s_index.LACo] # Species
    i_fix = [] # Species
    j_fix = [bg.r_index.Fout]				      # Flows
    
  elseif open_mode==3	# Open system: Fout on, ATPase off	
    ## Set up initial conditions
    X_0 = X_inf;
    
    ## Fixed quantities
    i_fix = [bg.s_index.LACo] # Species
    j_fix = [bg.r_index.ATPase]				      # Flows
    
  elseif open_mode==4	# Open system: Fout on, ATPase on	
    ## Set up initial conditions
    X_0 = X_inf;
    
    ## Fixed quantities
    i_fix = [bg.s_index.LACo] # Species
    j_fix = []				      # Flows
    
  else
    error(sprintf("open_mode == %i not recognised", open_mode)) 
  endif

  ## Simulation
  ##lsode_options("maximum step size",0.001)
  ##lsode_options("maximum step size",0.01)
  lsode_options("minimum step size",-1)
  lsode_options("maximum step size",0.01)
  [x X V] = stoich_sim (sys, [], t, X_0, i_fix,j_fix);
  
  if (open_mode==0)
    X_inf = X(:,n_t);		# Final value
    save X_inf.mat X_inf
  endif
  
  ## K_combo
  X_LAC = X(bg.s_index.LAC,:);
  X_LACo = X(bg.s_index.LACo,:);
  X_ATP = X(bg.s_index.ATP,:);
  X_ADP = X(bg.s_index.ADP,:);
  X_AMP = X(bg.s_index.AMP,:);
  X_P = X(bg.s_index.P,:);
  
  ## X_GLYf = X(bg.s_index.GLYf,:);
  ## X_GLYr = X(bg.s_index.GLYr,:);
  X_GLY = X(bg.s_index.GLY,:);
  
  X_NAD = X(bg.s_index.NAD,:);
  X_NADH = X(bg.s_index.NADH,:);

  V_GP = V(i_r.GPa,:)+V(i_r.GPb,:);

  
  K_eq_combo = (X_LAC.^2).*( (X_ATP./(X_ADP.*X_P)).^3 );
  
  X_eq = exp(-bg.N'*log(X));

  ## Final values
  printf("ATPase coefficient & %g\\\\\n",ATPase_COEFFICIENT)
  printf("ATP flux & %g\\\\\n", V(i_r.ATPase,n_t))
  printf("ATP  & %g\\\\\n", X(i_s.ATP,n_t))
  printf("ADP  & %g\\\\\n", X(i_s.ADP,n_t))
  printf("AMP  & %g\\\\\n", X(i_s.AMP,n_t))
  printf("P  & %g\\\\\n", X(i_s.P,n_t))
  printf("PCr  & %g\\\\\n", X(i_s.PCr,n_t))
  
  ## ## Plot
  graphics_toolkit('gnuplot') 
  figure(9);
  if (open_mode==0)		# Formerly 0
    loglog(t,X_ATP,";ATP;", t,X_ADP,";ADP;", t,X_P,";P;",t,K_eq_combo*1e-19,";K_{combo};");
    ylabel("ATP,ADP,P,LAC,K_{combo}")
  else
    loglog(t,X_ATP,";ATP;", t,X_ADP,";ADP;", t,X_P,";P;")
    ylabel("X")
  endif
  axis([min(t) max(t) 1e-6 100])
  legend("location","southeast")
  fig(name,"ATP",i_colour);

  figure(10);
  if (open_mode==999)		# Formerly 0
    loglog(t,X_ATP,";ATP;", t,X_ADP,";ADP;", t,X_P,";P;"...
	   ,t,X_GLY,";GLY;",t,X_LAC,";LAC;",t,K_eq_combo*1e-19,";K_{combo};");
    ylabel("ATP,ADP,P,LAC,K_{combo}")
    axis([min(t) max(t) 1e-6 100])
  else
    loglog(t,X_ATP,";ATP;", t,X_ADP,";ADP;", t,X_P,";P;",t,X_GLY,";GLY;",t,X_LAC,";LAC;");
    ylabel("X (mM)")
    xlabel("t (min)")
  endif
  legend("location","southeast")
  fig(name,"X",i_colour);
  
  figure(11);
  loglog(t,X_GLY,";GLY;", t,X_LAC,";LAC;", t,X_LACo,";LACo;");
  ##grid
  xlabel("t (min)")
  ylabel("GLY, LAC")
  fig(name,"GLY",i_colour);
   
  figure(12);
  rho_v = X_eq.*K_eq;
  i_plot = setdiff(1:length(bg.reaction), [i_r.Fout,i_r.ATPase]);
  loglog(t,rho_v(i_plot,:));
  ##grid
  xlabel("t (min)")
  ylabel("\\rho_v")
  fig(name,"Xeq",i_colour);

  CHECK_rho_v = norm(rho_v(i_plot,n_t) - one)
  CHECK_flows = norm(V(:,n_t))

  disp("## Discrepancies in reactions");
  I_disc = find( abs(rho_v(:,n_t)-1)>0.5 )';
  for i=I_disc
    disp(bg.reaction{i});
  endfor
  
  ## CHECK conserved moities
  figure(13);
  CM = bg.G*X;
  CM_0 = bg.G*X_0;
  rho_CM = CM./(CM_0*one);
  loglog(t,CM); 
  ##grid;
  ylabel("Conserved Moieties (mM)");
  xlabel("t (min)")
  fig(name,"CM",i_colour);
  CHECK_CM = norm(CM-CM_0*one)
  
  K_eq_combo_final = K_eq_combo(n_t)
  K_eq_red = GLY2LAC.K_eq
  ## K_eq_combo_adj =  K_eq_combo_final/(X_GLYf(n_t)/X_GLYr(n_t))
  ## K_eq_red_adj = K_eq_red/(X_GLYf(n_t)/X_GLYr(n_t))
  
  ## Flows.
  for i = 1:length(bg.reaction)
    val = eval(bg.reaction{i});
    vmax_f = val.v_max/(1-val.rho_v);
    vmax_r = val.v_max/(val.rho_v);
    Vmax_f(i,1) = vmax_f;
    Vmax_r(i,1) = vmax_r;
  endfor

  
  one = ones(size(t));
  
  ## figure(20);
  ## plot(t,V./(Vmax_f*one))
  
  CHECK_max_f = max(max(V./(Vmax_f*one)))
  
  
  ## figure(21);
  ## plot(t,V./(Vmax_r*one))
  
  CHECK_max_r = min(min(V./(Vmax_r*one)))
  
  ## Ext. flows
  dX_0 = bg.N*V;

  ## Flow out of C's required to fix at constant value.
  if length(i_fix)>0
    V_ext = dX_0(i_fix,:);
  else
    V_ext = zeros(size(t));
  endif

  figure(30)
  if open_mode==0
    semilogx(t,V_ext);
  else
    V_GLYo = V_GP;
    semilogx(t,V_ext, t, V_GLYo);
  endif
  axis([min(t) max(t) 0 5]);
  ##grid
  if (length(i_fix)==0)
    Legend = {"V_GLYo"};
  else
    Legend = {bg.species{i_fix} "V_GLYo"};
  endif
      
  legend(Legend)
  ylabel("V_{ext}")
  xlabel("t (min)")
  fig(name,"extFlow",i_colour);

  figure(31)
  if (open_mode==0)
     Fin = 0*V_GP;
  else
     Fin = V_GP;
  endif
  ## semilogx(t,Fin,";Fin;", t,V(i_r.Fout,:),";Fout;", ...
  ## 	   t,V(i_r.ATPase,:),";ATPase;");
  semilogx(t,V(i_r.ATPase,:),"-;ATPase;", ...
	   t,Fin,"--;in;", ...
	   t,V(i_r.Fout,:),"-.;out;" ...
	   );
  ##axis([min(t) max(t) 0 100])
  ylabel("V (mM/min)")
  xlabel("t (min)")
  ##grid
  fig(name,"FoutATPase",i_colour);

  figure(32)
  loglog(t,X(i_s.AMP,:),";AMP;", t,X(i_s.Cr,:),";Cr;");
  ylabel("AMP, Cr")
  xlabel("t (min)")
  fig(name,"AMP",i_colour);

 ## figure(33)
 ## semilogx(t,V_GP);
 ## ylabel("V_{GP}")
 ## xlabel("t (min)")
 ## fig(name,"GP",i_colour);

  ## Mass stuff
  ratio_Fout = V(i_r.Fout,:)./V_GP;
  ratio_ATPase = V(i_r.ATPase,:)./V_GP;

  
  figure(40)
  i_t = find(t>0.1);
##  semilogx(t(i_t),ratio_Fout(i_t),";Fout;",t(i_t),ratio_ATPase(i_t),";ATPase;");
  semilogx(t(i_t),ratio_Fout(i_t),";Fout;",t(i_t),ratio_ATPase(i_t),";ATPase;");
  ylabel("Flow ratios")
  xlabel("t (min)")
  fig(name,"M",i_colour);

  ## Power stuff
  ## dK_c = diag(bg.K_c); 
  ## mu = RT*log(dK_c*X);		# Chemical potential/RT
  KK_c = bg.K_c*one;
  mu = RT*log(KK_c.*X);		# Chemical potential/RT
  A = -bg.N'*mu;			# Affinity
  i_ext = i_s.LACo;
  i_int = setdiff(1:length(bg.species), i_ext);

 ## i_buff = [i_s.PCr, i_s.Cr, i_s.ATP, i_s.ADP, i_s.AMP];
 i_buff = [i_s.PCr, i_s.Cr];

  j_ext = i_r.Fout;		       # External flow
  j_int = setdiff(1:length(bg.reaction), j_ext);
  j_int_other = setdiff(j_int, i_r.ATPase); # exclude ATPase


  V_0 = V/(1000*60);		      # V in M/sec
  p_r_all = A.*V_0;			# R components (W).
  p_r = p_r_all(j_int,:);		# R components (excluding F_out)
  p_r_ATPase = p_r_all(i_r.ATPase,:);  # ATPase only
p_r_other =  sum(p_r_all(j_int_other,:));   # Others
p_i = -mu(i_int,:).*(bg.N(i_int,:)*V_0); # Internal C components
p_e = -mu(i_s.LAC,:).*V_0(i_r.Fout,:);   # External power (flow from
				# LAC)
p_buff = -mu(i_buff,:).*(bg.N(i_buff,:)*V_0);


figure(41);
## semilogx(t,p_e,";p_E;", ...
## 	 t,sum(p_r),";p_R;",...
## 	 t, p_r_ATPase,";p_{ATPase};")

semilogx(t, p_r_ATPase,"-;p_{ATPase};", ...
	 t,p_e,"--;p_E;", ...
	 t,sum(p_r),"-.;p_R;"
	 )

##grid;
if min(sum(p_i))<-1
  axis([min(t) max(t) -10 10]);
else
  axis([min(t) max(t) 0 10]);
endif
ylabel("P (W)")
xlabel("t (min)")
legend("location","northeast");
fig(name,"P",i_colour);
drawnow;


power_ratio = p_r_ATPase(n_t)/sum(p_r(:,n_t))

## Standard quatities (X=1)
mu_0 = RT*log(bg.K_c);		# Chemical potential/RT
A_0 = -bg.N'*mu_0;			# Affinity

## Some reality checks on ATPase

## Indices of ATPase reaction
i_ATPASE = [i_s.ATP i_s.ADP i_s.P]
j_ATPASE = i_r.ATPase

## States
X_ATPASE = X(i_ATPASE,n_t)
X_ATPASE_0 = X_0(i_ATPASE)

## Stoic. matrix
N_ATPASE = bg.N(i_ATPASE,j_ATPASE)
K_ATPASE = bg.K_c(i_ATPASE)

## Chem.potential and affinities
mu_0_ATPASE = RT*log(K_ATPASE)
Delta_G_0 =  -N_ATPASE'*mu_0_ATPASE
Delta_G_1 =  -N_ATPASE'*RT*log(X_ATPASE)
AFFINITY = A(i_r.ATPase,n_t)
AFFINITY_0 = A_0(i_r.ATPase)

## K^v X^v stuff
K_v_ATPASE = exp(-N_ATPASE'*log(K_ATPASE))
K_eq_ATPASE = K_eq(i_r.ATPase)
Delta_GG = RT*log(K_eq_ATPASE)
X_v_ATPASE = exp(-N_ATPASE'*log(X_ATPASE))

## Various sanity checks
CHECK_Delta_G = norm(Delta_G_0/1000 -31)
CHECK_Affinity_0 = norm(AFFINITY_0-Delta_G_0)
CHECK_K_v_ATPASE = norm(RT*log(K_v_ATPASE) - Delta_G_0)
CHECK_X_v_ATPASE = norm(RT*log(X_v_ATPASE) - Delta_G_1)

CHECK_AFFINITY = norm(AFFINITY - (Delta_G_0+Delta_G_1)) 

FLOW_mMpmin = V(i_r.ATPase,n_t)
FLOW_Mps = V_0(i_r.ATPase,n_t)
POWER = FLOW_Mps*AFFINITY

## Save up results for Figures_paper.m
SAVE.t = t;
SAVE.X = X;
SAVE.V = V;

eval(sprintf("MODE_%i = SAVE;", open_mode));

endfor

