
function [mttpar] = iABCADM_numpar;
## [mttpar] = iABCADM_numpar;
## System iABCADM, representation numpar, language m; 
## File iABCADM_numpar.m; 
## Generated by MTT on Sun Dec 28 11:58:32 AEDT 2014; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

   mttpar = zeros(7,1);

## BEGIN Code

## User defined code from iABCADM_numpar.txt
  k_a	=  1.0; 
  k_b	=  1.0; 
  k_c	=  1.0; 
  rt	=  1.0; 
  kappa_1	=  1.0; 
  kappa_2	=  1.0; 
  kappa_3	=  1.0; 

  ## Set up the mttpar vector
  mttpar(1)	= k_a;
  mttpar(2)	= k_b;
  mttpar(3)	= k_c;
  mttpar(4)	= rt;
  mttpar(5)	= kappa_1;
  mttpar(6)	= kappa_2;
  mttpar(7)	= kappa_3;
## END Code
endfunction