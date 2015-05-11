
function [mttpar] = ATPetc_numpar;
## [mttpar] = ATPetc_numpar;
## System ATPetc, representation numpar, language m; 
## File ATPetc_numpar.m; 
## Generated by MTT on Tue Jan 20 13:01:01 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

   mttpar = zeros(16,1);

## BEGIN Code

## User defined code from ATPetc_numpar.txt
  k_adp	=  1.0; 
  k_amp	=  1.0; 
  k_atp	=  1.0; 
  k_cr	=  1.0; 
  k_p	=  1.0; 
  k_pcr	=  1.0; 
  rt	=  1.0; 
  k_adk	=  1.0; 
  k_atpase	=  1.0; 
  k_ck	=  1.0; 
  rho_adk	=  1.0; 
  rho_atpase	=  1.0; 
  rho_ck	=  1.0; 
  v_adk	=  1.0; 
  v_atpase	=  1.0; 
  v_ck	=  1.0; 

  ## Set up the mttpar vector
  mttpar(1)	= k_adp;
  mttpar(2)	= k_amp;
  mttpar(3)	= k_atp;
  mttpar(4)	= k_cr;
  mttpar(5)	= k_p;
  mttpar(6)	= k_pcr;
  mttpar(7)	= rt;
  mttpar(8)	= k_adk;
  mttpar(9)	= k_atpase;
  mttpar(10)	= k_ck;
  mttpar(11)	= rho_adk;
  mttpar(12)	= rho_atpase;
  mttpar(13)	= rho_ck;
  mttpar(14)	= v_adk;
  mttpar(15)	= v_atpase;
  mttpar(16)	= v_ck;
## END Code
endfunction
