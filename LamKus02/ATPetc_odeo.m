
function [mtty] = ATPetc_odeo(mttx,mttu,mttt,mttpar);
## [mtty] = ATPetc_odeo(mttx,mttu,mttt,mttpar);
## System ATPetc, representation odeo, language m; 
## File ATPetc_odeo.m; 
## Generated by MTT on Tue Jan 20 13:01:02 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_adp 	= mttpar(1);
   k_amp 	= mttpar(2);
   k_atp 	= mttpar(3);
   k_cr 	= mttpar(4);
   k_p 	= mttpar(5);
   k_pcr 	= mttpar(6);
   rt 	= mttpar(7);
   k_adk 	= mttpar(8);
   k_atpase 	= mttpar(9);
   k_ck 	= mttpar(10);
   rho_adk 	= mttpar(11);
   rho_atpase 	= mttpar(12);
   rho_ck 	= mttpar(13);
   v_adk 	= mttpar(14);
   v_atpase 	= mttpar(15);
   v_ck 	= mttpar(16);

## States 
mttx1 = mttx(1) ;
mttx2 = mttx(2) ;
mttx3 = mttx(3) ;
mttx4 = mttx(4) ;
mttx5 = mttx(5) ;
mttx6 = mttx(6) ;

## Inputs 
mttu1 = mttu(1);
mttu2 = mttu(2);
mttu3 = mttu(3);

## Unknown Inputs 

   mtty = zeros(3,1);

## BEGIN Code

## Code
  mtty(1) = (v_adk*( - k_adp**2*mttx2**2 + k_amp*k_atp*mttx1*mttx4))/(k_adk +  \
k_adp**2*mttx2**2*rho_adk - k_amp*k_atp*mttx1*mttx4*rho_adk + k_amp*k_atp*mttx1* \
  mttx4);
  mtty(2) = (v_atpase*( - k_adp*k_p*mttx2*mttx3 + k_atp*mttx1))/(k_adp*k_p* \
  mttx2*mttx3*rho_atpase - k_atp*mttx1*rho_atpase + k_atp*mttx1 + k_atpase);
  mtty(3) = (v_ck*( - k_adp*k_pcr*mttx2*mttx6 + k_atp*k_cr*mttx1*mttx5))/(k_adp \
*k_pcr*mttx2*mttx6*rho_ck - k_atp*k_cr*mttx1*mttx5*rho_ck + k_atp*k_cr*mttx1* \
  mttx5 + k_ck);
## END Code
endfunction