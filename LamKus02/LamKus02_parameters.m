## Parameter values extracted from:
##   Lambeth, M. J. & Kushmerick, M. J., (2002), "A Computational Model
##   for Glycogenolysis in Skeletal Muscle". Annals of Biomedical Engineering,
##   Vol. 30, pp. 808-827.
##       http://link.springer.com/article/10.1114%2F1.1492813
## All K_eq and Km parameter values taken from Table 1, and all v_max_f 
##  parameters taken from Table 2.

##disp("## Parameters from Lambeth & Kushmerick (2002)")
##disp("## Reaction GPa - note issues with two versions of GLY")
GPa.K_eq = 0.42;

GPa.Km_GLYf = 1.7;
GPa.Km_P = 4;
GPa.Km_GLYr = 0.15;         # Lambeth & Kushmerick use the notation GLYb
GPa.Km_G1P = 2.7;

GPa.v_max_f = 0.02;
GPa.v_max_r = [];			# Not given

## Version for single GLY moiety
GPa.Km_GLY = GPa.Km_GLYf;

##disp("## Reaction GPb - note issues with two versions of GLY")
GPb.K_eq = 0.42;

GPb.Km_GLYf = 15;
GPb.Km_P = 0.2;
GPb.Km_GLYr = 4.4;          # Lambeth & Kushmerick use the notation iGLYb
GPb.Km_G1P = 1.5;

GPb.v_max_f = 0.03;
GPb.v_max_r = [];			# Not given

## Version for single GLY moiety
GPb.Km_GLY = GPb.Km_GLYf;


##disp("## Reaction PGLM")
PGLM.K_eq = 16.62;

PGLM.Km_G1P = 0.063;	
PGLM.Km_G6P = 0.03;

PGLM.v_max_f = 0.48;
PGLM.v_max_r = [];			# Not given

##disp("## Reaction PGI")
PGI.K_eq = 0.45;
PGI.Km_G6P = 0.48;
PGI.Km_F6P = 0.119;

PGI.v_max_f = [];			# Not given
PGI.v_max_r = 0.88;

##disp("## Reaction PFK")
##disp("## Something wrong here: eq. for V_maxr does not contain K_eq")
PFK.K_eq = 242;
PFK.Km_F6P = 0.18;
PFK.Km_ATP = 0.08;

PFK.Km_FBP = 4.02;
PFK.Km_ADP = 2.7;

PFK.v_max_f = 0.056;
PFK.v_max_r = [];			# Not given

##disp("## Reaction ALD")
##disp("## NB K_eq has units")
ALD.K_eq = 9.5e-5;

ALD.Km_FBP = 0.05;

ALD.Km_DHAP = 2;
ALD.Km_GAP = 1;

ALD.v_max_f = 0.104;
ALD.v_max_r = [];			# Not given

##disp("## Reaction TPI")
TPI.K_eqRev = 0.052;        # As noted in Lambeth & Kushmerick Appendix: Model equations - 
                            # "the forward direction of TPI is defined as producing dihydroxyacetone phosphate"

TPI.K_eq = 1/TPI.K_eqRev;   # Seems to be wrong in table??

TPI.Km_GAP = 0.32;

TPI.Km_DHAP = 0.61;

TPI.v_max_f = 12.0;
TPI.v_max_r = [];			# Not given

##disp("## Reaction GAPDH")
GAPDH.K_eq = 0.089;

GAPDH.Km_GAP = 0.0025;
GAPDH.Km_NAD = 0.09;
GAPDH.Km_P = 0.29;

GAPDH.Km_DPG = 0.0008;      # Lambeth & Kushmerick use the notation 13BPG
GAPDH.Km_NADH = 0.0033;

GAPDH.v_max_f = 1.265;
GAPDH.v_max_r = [];			# Not given

##disp("## Reaction PGK")
PGK.K_eq = 57109;

PGK.Km_DPG = 0.002;         # Lambeth & Kushmerick use the notation 13BPG
PGK.Km_ADP = 0.008;

PGK.Km_P3G = 1.2;           # Lambeth & Kushmerick use the notation 3PG
PGK.Km_ATP = 0.35;

PGK.v_max_f = 1.12;
PGK.v_max_r = [];			# Not given

##disp("## Reaction PGM")
PGM.K_eq = 0.18;

PGM.Km_P3G = 0.2;           # Lambeth & Kushmerick use the notation 3PG

PGM.Km_P2G = 0.014;         # Lambeth & Kushmerick use the notation 2PG

PGM.v_max_f = 1.12;
PGM.v_max_r = [];			# Not given

##disp("## Reaction ENO")
ENO.K_eq = 0.49;

ENO.Km_P2G = 0.1;           # Lambeth & Kushmerick use the notation 2PG

ENO.Km_PEP = 0.37;

ENO.v_max_f = 0.192;
ENO.v_max_r = [];			# Not given

##disp("## Reaction PK")
PK.K_eq = 10304;

PK.Km_PEP = 0.08;
PK.Km_ADP = 0.3;

PK.Km_PYR = 7.05; 
PK.Km_ATP = 1.13;

PK.v_max_f = 1.44;
PK.v_max_r = [];			# Not given

##disp("## Reaction LDH")
LDH.K_eq = 16198;

LDH.Km_PYR = 0.335;
LDH.Km_NADH = 0.002;

LDH.Km_LAC = 17;
LDH.Km_NAD = 0.849;

LDH.v_max_f = 1.92;
LDH.v_max_r = [];			# Not given

##disp("## Reaction CK")
##disp("## NB Some confusion about reaction direction")
CK.K_eq = 233;

CK.Km_Cr = 3.8;
CK.Km_ATP = 3.5;            # Lambeth & Kushmerick use the notiation Km_iATP

CK.Km_PCr = 1.11;
CK.Km_ADP = 0.135;          # Lambeth & Kushmerick use the notiation Km_iADP

CK.v_max_f = 0.5;
CK.v_max_r = [];			# Not given

##disp("## Reaction ADK")
ADK.K_eq = 2.21;

ADK.Km_AMP = 0.32;
ADK.Km_ATP = 0.27;

ADK.Km_ADP = 0.35;

ADK.v_max_f = 0.88;
ADK.v_max_r = [];			# Not given

##disp("## Reaction ATPase")
##disp("## Not specified in the paper")

## Mass action with guessed kappa and correct K_eq.
fac = 1e3;

RT 	= 8.3144621*300;
dG_0 = 31*1e3;			# Delta G from KeeSne09

ATPase.K_eq = exp(dG_0/RT);

ATPase.Km_ATP = fac*1000;

ATPase.Km_P = fac*1000;;
ATPase.Km_ADP = fac*1000;;

LamKus02_k = 0.75; # Moderate exercise - Table 4.
#LamKus02_k = 7.5; # Maximal exercise - Table 4.
#LamKus02_k = 750; # Huge
ATPase.v_max_f = fac*LamKus02_k;	# Moderate exercise - Table 4.

ATPase.v_max_r = [];			# Not given

##disp("## Reaction Fout")
##disp("## Approx Mass Action with v = 0.2*LAC")

Fout.K_eq = 1;

Fout.Km_LAC = fac*1000;		# mM
Fout.Km_LACo = fac*1000;	# mM

Fout.v_max_f = fac*0.2;
Fout.v_max_r = [];
