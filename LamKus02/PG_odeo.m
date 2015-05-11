
function [mtty] = PG_odeo(mttx,mttu,mttt,mttpar);
## [mtty] = PG_odeo(mttx,mttu,mttt,mttpar);
## System PG, representation odeo, language m; 
## File PG_odeo.m; 
## Generated by MTT on Wed Jan 14 13:57:23 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_dhap 	= mttpar(1);
   k_dpg 	= mttpar(2);
   k_fdp 	= mttpar(3);
   k_gap 	= mttpar(4);
   k_p2g 	= mttpar(5);
   k_p3g 	= mttpar(6);
   rt 	= mttpar(7);
   k_ald 	= mttpar(8);
   k_gapdh 	= mttpar(9);
   k_pfk 	= mttpar(10);
   k_pgk 	= mttpar(11);
   k_pgm 	= mttpar(12);
   k_tpi 	= mttpar(13);
   rho_ald 	= mttpar(14);
   rho_gapdh 	= mttpar(15);
   rho_pfk 	= mttpar(16);
   rho_pgk 	= mttpar(17);
   rho_pgm 	= mttpar(18);
   rho_tpi 	= mttpar(19);
   v_ald 	= mttpar(20);
   v_gapdh 	= mttpar(21);
   v_pfk 	= mttpar(22);
   v_pgk 	= mttpar(23);
   v_pgm 	= mttpar(24);
   v_tpi 	= mttpar(25);

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
mttu4 = mttu(4);
mttu5 = mttu(5);
mttu6 = mttu(6);

## Unknown Inputs 

   mtty = zeros(6,1);

## BEGIN Code

## Code
  mtty(1) = (v_ald*( - k_dhap*k_gap*mttx1*mttx4 + k_fdp*mttx3))/(k_ald + k_dhap \
*k_gap*mttx1*mttx4*rho_ald - k_fdp*mttx3*rho_ald + k_fdp*mttx3);
  mtty(2) = (v_pgm*( - k_p2g*mttx5 + k_p3g*mttx6))/(k_p2g*mttx5*rho_pgm - k_p3g \
*mttx6*rho_pgm + k_p3g*mttx6 + k_pgm);
  mtty(3) = (v_tpi*( - k_dhap*mttx1 + k_gap*mttx4))/(k_dhap*mttx1*rho_tpi -  \
k_gap*mttx4*rho_tpi + k_gap*mttx4 + k_tpi);
  mtty(4) = (v_gapdh*( - k_dpg*mttx2 + k_gap*mttx4))/(k_dpg*mttx2*rho_gapdh -  \
k_gap*mttx4*rho_gapdh + k_gap*mttx4 + k_gapdh);
  mtty(5) = (v_pfk*( - k_fdp*mttx3 + 1))/(k_fdp*mttx3*rho_pfk + k_pfk - rho_pfk \
 + 1);
  mtty(6) = (v_pgk*( - k_dpg*mttx2 + k_p3g*mttx6))/(k_dpg*mttx2*rho_pgk - k_dpg \
*mttx2 - k_p3g*mttx6*rho_pgk - k_pgk);
## END Code
endfunction