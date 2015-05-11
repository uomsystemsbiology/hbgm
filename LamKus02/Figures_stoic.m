clear;
Setpath;

## Get the stoichiometry from the BG
bg = dm2stoich("LamKus02","");
bg.s_index = name2index(bg.species);
bg.r_index = name2index(bg.reaction);

## Show the reduced state
i_x = bg.L_xX*[1:bg.n_X]';
i_z = setdiff(1:bg.n_X,i_x)
CHECK_n_x = bg.n_x-length(i_x)
disp("Reduced system species")
reduced_species = bg.species(i_x);
other_species = bg.species(i_z);
## ## Zap the two GLY states
## [n,m] = size(bg.N);
## i_zap = [bg.s_index.GLYf, bg.s_index.GLYr];
## i_keep = setdiff(1:n,i_zap);
## bg0.N = bg.N(i_keep,:);
## bg0.species = bg.species(i_keep);

## Zap the  GLY
[n,m] = size(bg.N);
i_zap = [bg.s_index.GLY];
i_keep = setdiff(1:n,i_zap);
bg0.N = bg.N(i_keep,:);
bg0.species = bg.species(i_keep);

#Zap second GP reaction (GPb) and rename GPa to GP
bg0.reaction = bg.reaction;
bg0.reaction{bg.r_index.GPa} = "GP";
i_zap = [bg.r_index.GPb];
i_keep = setdiff(1:length(bg.reaction),i_zap);
bg0.N = bg0.N(:,i_keep);
bg0.reaction = bg0.reaction(i_keep);

## Information
stoich_info (bg.N_f,bg.N_r,[],[],"BG",bg.species,bg.reaction);

## Stoichiometric analysis.
#[bg0.G bg0.K] = stoich2null (bg0.N);
[n,m] = size(bg.G);
G_mod = bg.G;
G_mod(5,:) = G_mod(5,:) + 2*G_mod(1,:) + G_mod(2,:);
#G_mod(4,:) = G_mod(4,:) + 2*G_mod(1,:) + G_mod(5,:) + + G_mod(3,:) ;
#G_mod(6,:) = G_mod(6,:) + G_mod(2,:);
##G_mod(7,:) = G_mod(7,:) - G_mod(6,:);
printf("Conserved Moieties (bg)\n")
for i= 1:n
    J = find(abs(G_mod(i,:))>1e-6);
    printf("%i\t&",i)
    for j=J
	g_ij = round(G_mod(i,j));
      if (g_ij!=1)
	 num = sprintf("%i",g_ij);
      else
	  num = "";
      endif
      printf("%s%s ",num,bg.species{j})
    endfor
    printf("\\\\\n")
endfor

## Pathways
printf("Pathways (bg)\n")
[n,m] = size(bg.K);
for j = 1:m
  I = find(abs(bg.K(:,j))>1e-6);
  for i=I
    printf("%s ",bg.reaction{i});
  endfor
  printf("\n")
endfor

## Get the parameters
LamKus02_parameters;


## Check and convert K_eq
K_eq = zeros(length(bg.reaction),1);
for i=1:length(bg.reaction)
  val = eval(sprintf("%s;", bg.reaction{i})); # Extract data
    K_eq(i) = val.K_eq;
endfor
bg.K_eq = K_eq;
bg.K_c = Keq2K (bg.K_eq,bg.N,bg.K,bg.G); # Thermodynamic K.

## Other related stuff
K_eq_1 = exp(-bg.N'*log(bg.K_c));
CHECK_K_eq = norm(K_eq_1-K_eq)

K_f = exp(bg.N_f'*log(bg.K_c));
K_r = exp(bg.N_r'*log(bg.K_c));

CHECK_K_f = norm((K_f./K_r)-K_eq)

for i=1:length(bg.reaction)
    eval(sprintf("%s.K_f = %g;", bg.reaction{i},K_f(i)));
    eval(sprintf("%s.K_r = %g;", bg.reaction{i},K_r(i)));
endfor

## Write Numpar
write_numpar;

## CHECK ATPase equilibrium constant etc
i_s = bg.s_index;
K_eq_K_c = bg.K_c(i_s.ATP)/(bg.K_c(i_s.ADP)*bg.K_c(i_s.P))
CHECK_K_eq_ATP = ATPase.K_eq - K_eq_K_c

delta_G = RT*log(K_eq(bg.r_index.ATPase))

ATPase_COEFFICIENT = (ATPase.v_max/ATPase.k_v)*bg.K_c(i_s.ATP)

## Put parameters into the bg structure
for i = 1:length(bg.reaction)
    eval(sprintf("bg.%s = %s;", bg.reaction{i}, bg.reaction{i}));
endfor

CHECK_Fout = (Fout.v_max/Fout.k_v)*bg.K_c(bg.s_index.LAC) - 0.2

## Reduced stuff
Figures_reduce;

## SBML stuff
Figures_stoic_sbml;


## Work out how to permute SBML version
perm_species = name2perm(bg0.species,sbml0.species);
perm_reaction = name2perm(bg0.reaction,sbml0.reaction);

## Permute reduced SBML version & check
sbml0_bg.N = sbml0.N(perm_species,perm_reaction);

N_diff = sbml0_bg.N - bg0.N;
CHECK_N = norm(N_diff)
