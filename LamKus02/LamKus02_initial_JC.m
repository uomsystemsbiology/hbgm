## Parameter values extracted from:
##   Lambeth, M. J. & Kushmerick, M. J., (2002), "A Computational Model
##   for Glycogenolysis in Skeletal Muscle". Annals of Biomedical Engineering,
##   Vol. 30, pp. 808-827.
##       http://link.springer.com/article/10.1114%2F1.1492813
## Most initial condition values are taken from Table 3, the remainder are
##  taken from inequalities specified within the main text

## Table 3 of LamKus02
GLY.x_0 = 112;
G1P.x_0 = 0.0589;
G6P.x_0 = 0.75;
F6P.x_0 = 0.228;
FBP.x_0 = 0.0723;
DHAP.x_0 = 0.0764;
GAP.x_0 = 0.0355;
DPG.x_0 = 0.065;            # Lambeth & Kushmerick use the notation 13BPG
P3G.x_0 = 0.052;            # Lambeth & Kushmerick use the notation 3PG
P2G.x_0 = 0.005;            # Lambeth & Kushmerick use the notation 2PG
PEP.x_0 = 0.0194;
PYR.x_0 = 0.0994;
LAC.x_0 = 1.3;
ATP.x_0 = 8.2;
ADP.x_0 = 0.013;
AMP.x_0 = 2e-5;
P.x_0 = 4.1; 
PCr.x_0 = 34.67;
NAD.x_0 = 0.5; 

## Not given in table
Cr.x_0 = 40 - PCr.x_0;		# pp. 813 - References [24] and [44] in Lambeth & Kushmerick (2002)
                            #  specifies that total creatine species sum to 40 mM
R = 1000;
NADH.x_0 = NAD.x_0/R;		# pp. 813 - Lambeth & Kushmerick specify a starting ~R ratio 
                            #  (relating to redox potential of NADH) of 1000
GLYf.x_0 = GLY.x_0;
GLYr.x_0 = GLY.x_0;

LACo.x_0 = 1e-4;
GLYo.x_0 = GLY.x_0;
