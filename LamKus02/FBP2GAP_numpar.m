
function [mttpar] = FBP2GAP_numpar;
## [mttpar] = FBP2GAP_numpar;
## System FBP2GAP, representation numpar, language m; 
## File FBP2GAP_numpar.m; 
## Generated by MTT on Mon Mar  2 14:53:19 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

   mttpar = zeros(10,1);

## BEGIN Code

## User defined code from FBP2GAP_numpar.txt
  k_dhap	=  1.0; 
  k_fbp	=  1.0; 
  k_gap	=  1.0; 
  rt	=  1.0; 
  k_ald	=  1.0; 
  k_tpi	=  1.0; 
  rho_ald	=  1.0; 
  rho_tpi	=  1.0; 
  v_ald	=  1.0; 
  v_tpi	=  1.0; 

  ## Set up the mttpar vector
  mttpar(1)	= k_dhap;
  mttpar(2)	= k_fbp;
  mttpar(3)	= k_gap;
  mttpar(4)	= rt;
  mttpar(5)	= k_ald;
  mttpar(6)	= k_tpi;
  mttpar(7)	= rho_ald;
  mttpar(8)	= rho_tpi;
  mttpar(9)	= v_ald;
  mttpar(10)	= v_tpi;
## END Code
endfunction