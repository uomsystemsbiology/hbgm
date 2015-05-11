Setpath;

## Get the stoichiometry from the SBML file
## Use sbml2stoic.py MODEL6623617994.xml >SBML_stoic.m 
SBML_stoic;

sbml.s_index = name2index(sbml.species);
sbml.r_index = name2index(sbml.reaction);

## Remove leading v from reaction names.
## Also change en to ENO
## and rename FDP to FBP
for i=1:length(sbml.reaction);
    reac = sbml.reaction{i};
    reac = reac(2:length(reac));
    if strcmp(reac,"en")
       reac = "eno";
    endif
    sbml.reaction{i} =reac;
endfor

for i=1:length(sbml.species);
    spec = sbml.species{i};
    if strcmp(spec,"FDP")
       spec = "FBP";
    endif
    sbml.species{i} =spec;
endfor


## ## Remove LACo and GLY from species
## sbml0.N = sbml.N;
## i_zap = [sbml.s_index.LACo, sbml.s_index.Gly];
## i_keep = setdiff(1:length(sbml.species),i_zap);
## sbml0.N = sbml0.N(i_keep,:);
## sbml0.species = sbml.species(i_keep);
## 

## Remove GLY from species
sbml0.N = sbml.N;
i_zap = [sbml.s_index.Gly];
i_keep = setdiff(1:length(sbml.species),i_zap);
sbml0.N = sbml0.N(i_keep,:);
sbml0.species = sbml.species(i_keep);

## ##Remove fout from reactions
## i_zap = [sbml.r_index.vfout];
## i_keep = setdiff(1:length(sbml.reaction),i_zap);
## sbml0.reaction = sbml.reaction(i_keep);
## sbml0.N = sbml0.N(:,i_keep);
## ## 

sbml0.reaction = sbml.reaction;

sbml0.Nf = (sbml0.N<0).*abs(sbml0.N);
sbml0.Nr = (sbml0.N>0).*abs(sbml0.N);

## Information
stoich_info (sbml.Nf,sbml.Nr,[],[],"SBML",sbml.species,sbml.reaction);

## Stoichiometric analysis.
[sbml0.G sbml0.K] = stoich2null (sbml0.N);
[n,m] = size(sbml0.G);
G_mod = sbml0.G;
G_mod(4,:) = G_mod(4,:) + G_mod(3,:) + G_mod(5,:);
#G_mod(6,:) = G_mod(6,:) - 2*G_mod(3,:) + 2*G_mod(4,:);
printf("Conserved Moieties (sbml0)\n")
for i= 1:n
    J = find(abs(G_mod(i,:))>1e-6);
    printf("(%i)\t",i)
    for j=J
	g_ij = round(G_mod(i,j));
      if (g_ij!=1)
	 num = sprintf("%i*",g_ij);
      else
	  num = "";
      endif
      printf("%s%s ",num,sbml.species{j})
    endfor
    printf("\n")
endfor


