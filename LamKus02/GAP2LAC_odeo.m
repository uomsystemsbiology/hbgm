
function [mtty] = GAP2LAC_odeo(mttx,mttu,mttt,mttpar);
## [mtty] = GAP2LAC_odeo(mttx,mttu,mttt,mttpar);
## System GAP2LAC, representation odeo, language m; 
## File GAP2LAC_odeo.m; 
## Generated by MTT on Mon Mar  2 14:53:54 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_dpg 	= mttpar(1);
   k_lac 	= mttpar(2);
   k_laco 	= mttpar(3);
   k_nad 	= mttpar(4);
   k_nadh 	= mttpar(5);
   k_p2g 	= mttpar(6);
   k_p3g 	= mttpar(7);
   k_pep 	= mttpar(8);
   k_pyr 	= mttpar(9);
   rt 	= mttpar(10);
   k_eno 	= mttpar(11);
   k_fout 	= mttpar(12);
   k_gapdh 	= mttpar(13);
   k_ldh 	= mttpar(14);
   k_pgk 	= mttpar(15);
   k_pgm 	= mttpar(16);
   k_pk 	= mttpar(17);
   rho_eno 	= mttpar(18);
   rho_fout 	= mttpar(19);
   rho_gapdh 	= mttpar(20);
   rho_ldh 	= mttpar(21);
   rho_pgk 	= mttpar(22);
   rho_pgm 	= mttpar(23);
   rho_pk 	= mttpar(24);
   v_eno 	= mttpar(25);
   v_fout 	= mttpar(26);
   v_gapdh 	= mttpar(27);
   v_ldh 	= mttpar(28);
   v_pgk 	= mttpar(29);
   v_pgm 	= mttpar(30);
   v_pk 	= mttpar(31);

## States 
mttx1 = mttx(1) ;
mttx2 = mttx(2) ;
mttx3 = mttx(3) ;
mttx4 = mttx(4) ;
mttx5 = mttx(5) ;
mttx6 = mttx(6) ;
mttx7 = mttx(7) ;
mttx8 = mttx(8) ;
mttx9 = mttx(9) ;

## Inputs 
mttu1 = mttu(1);
mttu2 = mttu(2);
mttu3 = mttu(3);
mttu4 = mttu(4);
mttu5 = mttu(5);
mttu6 = mttu(6);
mttu7 = mttu(7);

## Unknown Inputs 

   mtty = zeros(7,1);

## BEGIN Code

## Code
  mtty(1) = (v_eno*(k_p2g*mttx6 - k_pep*mttx8))/(k_eno - k_p2g*mttx6*rho_eno +  \
k_p2g*mttx6 + k_pep*mttx8*rho_eno);
  mtty(2) = (v_fout*(k_lac*mttx2 - k_laco*mttx3))/(k_fout - k_lac*mttx2* \
rho_fout + k_lac*mttx2 + k_laco*mttx3*rho_fout);
  mtty(3) = (v_pgm*( - k_p2g*mttx6 + k_p3g*mttx7))/(k_p2g*mttx6*rho_pgm - k_p3g \
*mttx7*rho_pgm + k_p3g*mttx7 + k_pgm);
  mtty(4) = (v_gapdh*( - k_dpg*k_nadh*mttx1*mttx5 + k_nad*mttx4))/(k_dpg*k_nadh \
*mttx1*mttx5*rho_gapdh + k_gapdh - k_nad*mttx4*rho_gapdh + k_nad*mttx4);
  mtty(5) = (v_ldh*( - k_lac*k_nad*mttx2*mttx4 + k_nadh*k_pyr*mttx5*mttx9))/( \
k_lac*k_nad*mttx2*mttx4*rho_ldh + k_ldh - k_nadh*k_pyr*mttx5*mttx9*rho_ldh +  \
k_nadh*k_pyr*mttx5*mttx9);
  mtty(6) = (v_pgk*( - k_dpg*mttx1 + k_p3g*mttx7))/(k_dpg*mttx1*rho_pgk - k_dpg \
*mttx1 - k_p3g*mttx7*rho_pgk - k_pgk);
  mtty(7) = (v_pk*( - k_pep*mttx8 + k_pyr*mttx9))/(k_pep*mttx8*rho_pk - k_pep* \
  mttx8 - k_pk - k_pyr*mttx9*rho_pk);
## END Code
endfunction
