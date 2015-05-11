
function [mttpar] = iABCAok_numpar;
## [mttpar] = iABCAok_numpar;
## System iABCAok, representation numpar, language m; 
## File iABCAok_numpar.m; 
## Generated by MTT on Sun Dec 28 11:36:43 AEDT 2014; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

   mttpar = zeros(11,1);

## BEGIN Code

## User defined code from iABCAok_numpar.txt
  k_a	=  1;
  k_b	=  1;
  k_c	=  1;
  k_f	=  1;
  k_r	=  1;
  rt	=  1;
  kappa_1	=  1;
  kappa_2	=  1;
  kappa_3	=  1;
  x_f	=  2;
  x_r	=  1;

  ## Set up the mttpar vector
  mttpar(1)	= k_a;
  mttpar(2)	= k_b;
  mttpar(3)	= k_c;
  mttpar(4)	= k_f;
  mttpar(5)	= k_r;
  mttpar(6)	= rt;
  mttpar(7)	= x_f;
  mttpar(8)	= x_r;
  mttpar(9)	= kappa_1;
  mttpar(10)	= kappa_2;
  mttpar(11)	= kappa_3;
## END Code
endfunction