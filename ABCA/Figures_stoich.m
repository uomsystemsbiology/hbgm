Setpath

if !exist("sys")
  sys="ABCA"
end

isys = sprintf("i%s",sys)

[m,tex] = dm2stoich (sys,isys);

names = {"N" "N_f" "N_r" "G" "K" "L_xX" "L_Xx" "G_X"};

for i = 1:length(names)
  name = names{i};
  eval(sprintf("%s = m.%s;", name, name));

  ## ## Print LaTeX
  ## filename = sprintf("Tex/%s_%s.tex", sys, name);
  ## fid = fopen(filename,"w");
  ## eval(sprintf("Tex = tex.%s;",name));
  ## fprintf(fid,"%s", Tex);
  ## fclose(fid);
  ## H = m.K;
endfor				# 

par = eval(sprintf("%s_numpar;",sys));
sym = eval(sprintf("%s_sympar;",sys));

if strcmp(sys,"ABCAoC")
  I_K = [sym.K_a sym.K_b sym.K_c sym.K_f sym.K_r];
else
  I_K = [sym.K_a sym.K_b sym.K_c]
endif
I_k = [sym.kappa_1 sym.kappa_2 sym.kappa_3];

KK = par(I_K)
kk = par(I_k)
K_eq = exp(-N'*log(KK))

##K_c_0 = Keq2K (K_eq,N,H,G)
## k_c_1 = 1/K_c_0(1)
## K_c = Keq2K (K_eq,N,H,G,k_c_1)

## K_eq_err = K_eq + [0 0 0.1]'
## K_c_err = Keq2K (K_eq_err,N,H,G)

## ## Linearisation stuff.
## ## NN = [m.N_f; m.N_r]

## K_r = [1;1;1];
## K_f = [1;1;1];
## kappa = [1;2;3];
## J = diag(kappa)*(diag(K_f)*N_f' - diag(K_r)*N_r')

## A = N*J

## Use inull as alternative.
[G_alt,K_alt] = stoich2null(N)

CHECK_G = norm(G_alt - G)

if length(K_alt)>0
  CHECK_K = norm(K_alt - K)
else
  CHECK_K = norm(K)
endif
