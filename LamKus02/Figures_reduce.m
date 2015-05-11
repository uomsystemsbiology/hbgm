## Reduce system of reactions to single reaction

## Extract indices
i_r = bg.r_index;
i_s = bg.s_index;

## GLY2FBP
I1 = [i_r.GPa i_r.PGLM i_r.PGI i_r.PFK];
m1 = [   1        1       1      1    ]'; 
bg.reaction{I1};
N1 = bg.N(:,I1)*diag(m1);
rN1 = sum(N1,2);
[rN1_f rN1_r] = N2Nfr(rN1);
GLY2FBP.reac =  reaction2str (1,bg.species,rN1_f,rN1_r);
GLY2FBP.K_eq = prod(K_eq(I1).^m1)

## System FBP2GAP
I2 = [i_r.ALD i_r.TPI];
m2 = [1       -1]';
N2 = bg.N(:,I2)*diag(m2);
rN2 = sum(N2,2);
[rN2_f rN2_r] = N2Nfr(rN2);
FBP2GAP.reac =  reaction2str (1,bg.species,rN2_f,rN2_r);
FBP2GAP.K_eq = prod(K_eq(I2).^m2)

## GAP2LAC
I3 = [i_r.GAPDH i_r.PGK i_r.PGM i_r.ENO i_r.PK i_r.LDH ];
m3 = ones(length(I3),1);
N3 = bg.N(:,I3)*diag(m3);
rN3 = sum(N3,2);
[rN3_f rN3_r] = N2Nfr(rN3);
GAP2LAC.reac =  reaction2str (1,bg.species,rN3_f,rN3_r);
GAP2LAC.K_eq = prod(K_eq(I3).^m3)

KK_eq = [GLY2FBP.K_eq; FBP2GAP.K_eq; GAP2LAC.K_eq];

## GLY2LAC
m123 = [1  1  2]';
N123 = [rN1 rN2 rN3]*diag(m123);
rN123 = sum(N123,2);
[rN123_f rN123_r] = N2Nfr(rN123);
GLY2LAC.reac =  reaction2str (1,bg.species,rN123_f,rN123_r);
GLY2LAC.K_eq = prod(KK_eq.^m123)

## ATPetc
I4 = [i_r.ADK i_r.ATPase i_r.CK];
m4 = ones(length(I4),1);
N4 = bg.N(:,I4)*diag(m4);
rN4 = sum(N4,2);
[rN4_f rN4_r] = N2Nfr(rN4);
ATPetc.reac =  reaction2str (1,bg.species,rN4_f,rN4_r);
ATPetc.K_eq = prod(K_eq(I4).^m4)

## CrAMP
I4 = [i_r.ADK  i_r.CK];
m4 = ones(length(I4),1);
N4 = bg.N(:,I4)*diag(m4);
rN4 = sum(N4,2);
[rN4_f rN4_r] = N2Nfr(rN4);
CrAMP.reac =  reaction2str (1,bg.species,rN4_f,rN4_r);
CrAMP.K_eq = prod(K_eq(I4).^m4)

## ATP2ADP
I4 = [i_r.ATPase];
m4 = ones(length(I4),1);
N4 = bg.N(:,I4)*diag(m4);
rN4 = sum(N4,2);
[rN4_f rN4_r] = N2Nfr(rN4);
ATP2ADP.reac =  reaction2str (1,bg.species,rN4_f,rN4_r);
ATP2ADP.K_eq = prod(K_eq(I4).^m4)
