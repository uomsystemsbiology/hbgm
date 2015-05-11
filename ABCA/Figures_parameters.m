## Convert from K_eq to K 


## Closed system
sys="ABCA";
Figures_stoich;

##K_eq = [1;0.5;2];
K_c = Keq2K (K_eq,N,K,G)

## Open system
## N_i = N;
## N_e = [0 0 -1
##        0 0 1];
## N = [N_i; N_e];
sys="ABCAoC";
Figures_stoich;
N_i = N(1:3,:)
N_e = N(4:5,:)

K_0 = Keq2K (K_eq,N,K,G)

k_1 = [1/K_0(1);2/K_0(4)]

K_c = Keq2K (K_eq,N,K,G,k_1)
