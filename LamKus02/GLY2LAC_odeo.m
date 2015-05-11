
function [mtty] = GLY2LAC_odeo(mttx,mttu,mttt,mttpar);
## [mtty] = GLY2LAC_odeo(mttx,mttu,mttt,mttpar);
## System GLY2LAC, representation odeo, language m; 
## File GLY2LAC_odeo.m; 
## Generated by MTT on Mon Mar  2 14:54:59 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_dhap 	= mttpar(1);
   k_dpg 	= mttpar(2);
   k_f6p 	= mttpar(3);
   k_fbp 	= mttpar(4);
   k_g1p 	= mttpar(5);
   k_g6p 	= mttpar(6);
   k_gap 	= mttpar(7);
   k_gly 	= mttpar(8);
   k_lac 	= mttpar(9);
   k_laco 	= mttpar(10);
   k_nad 	= mttpar(11);
   k_nadh 	= mttpar(12);
   k_p2g 	= mttpar(13);
   k_p3g 	= mttpar(14);
   k_pep 	= mttpar(15);
   k_pyr 	= mttpar(16);
   rt 	= mttpar(17);
   k_ald 	= mttpar(18);
   k_eno 	= mttpar(19);
   k_fout 	= mttpar(20);
   k_gapdh 	= mttpar(21);
   k_gpa 	= mttpar(22);
   k_gpb 	= mttpar(23);
   k_ldh 	= mttpar(24);
   k_pfk 	= mttpar(25);
   k_pgi 	= mttpar(26);
   k_pgk 	= mttpar(27);
   k_pglm 	= mttpar(28);
   k_pgm 	= mttpar(29);
   k_pk 	= mttpar(30);
   k_tpi 	= mttpar(31);
   rho_ald 	= mttpar(32);
   rho_eno 	= mttpar(33);
   rho_fout 	= mttpar(34);
   rho_gapdh 	= mttpar(35);
   rho_gpa 	= mttpar(36);
   rho_gpb 	= mttpar(37);
   rho_ldh 	= mttpar(38);
   rho_pfk 	= mttpar(39);
   rho_pgi 	= mttpar(40);
   rho_pgk 	= mttpar(41);
   rho_pglm 	= mttpar(42);
   rho_pgm 	= mttpar(43);
   rho_pk 	= mttpar(44);
   rho_tpi 	= mttpar(45);
   v_ald 	= mttpar(46);
   v_eno 	= mttpar(47);
   v_fout 	= mttpar(48);
   v_gapdh 	= mttpar(49);
   v_gpa 	= mttpar(50);
   v_gpb 	= mttpar(51);
   v_ldh 	= mttpar(52);
   v_pfk 	= mttpar(53);
   v_pgi 	= mttpar(54);
   v_pgk 	= mttpar(55);
   v_pglm 	= mttpar(56);
   v_pgm 	= mttpar(57);
   v_pk 	= mttpar(58);
   v_tpi 	= mttpar(59);

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
mttx10 = mttx(10) ;
mttx11 = mttx(11) ;
mttx12 = mttx(12) ;
mttx13 = mttx(13) ;
mttx14 = mttx(14) ;
mttx15 = mttx(15) ;
mttx16 = mttx(16) ;

## Inputs 
mttu1 = mttu(1);
mttu2 = mttu(2);
mttu3 = mttu(3);
mttu4 = mttu(4);
mttu5 = mttu(5);
mttu6 = mttu(6);
mttu7 = mttu(7);
mttu8 = mttu(8);
mttu9 = mttu(9);
mttu10 = mttu(10);
mttu11 = mttu(11);
mttu12 = mttu(12);
mttu13 = mttu(13);
mttu14 = mttu(14);

## Unknown Inputs 

   mtty = zeros(14,1);

## BEGIN Code

## Code
  mtty(1) = (v_ald*( - k_dhap*k_gap*mttx1*mttx3 + k_fbp*mttx2))/(k_ald + k_dhap \
*k_gap*mttx1*mttx3*rho_ald - k_fbp*mttx2*rho_ald + k_fbp*mttx2);
  mtty(2) = (v_tpi*( - k_dhap*mttx1 + k_gap*mttx3))/(k_dhap*mttx1*rho_tpi -  \
k_gap*mttx3*rho_tpi + k_gap*mttx3 + k_tpi);
  mtty(3) = (v_eno*(k_p2g*mttx9 - k_pep*mttx11))/(k_eno - k_p2g*mttx9*rho_eno + \
 k_p2g*mttx9 + k_pep*mttx11*rho_eno);
  mtty(4) = (v_fout*(k_lac*mttx5 - k_laco*mttx6))/(k_fout - k_lac*mttx5* \
rho_fout + k_lac*mttx5 + k_laco*mttx6*rho_fout);
  mtty(5) = (v_pgm*( - k_p2g*mttx9 + k_p3g*mttx10))/(k_p2g*mttx9*rho_pgm -  \
k_p3g*mttx10*rho_pgm + k_p3g*mttx10 + k_pgm);
  mtty(6) = (v_gapdh*( - k_dpg*k_nadh*mttx4*mttx8 + k_gap*k_nad*mttx3*mttx7))/( \
k_dpg*k_nadh*mttx4*mttx8*rho_gapdh - k_gap*k_nad*mttx3*mttx7*rho_gapdh + k_gap* \
k_nad*mttx3*mttx7 + k_gapdh);
  mtty(7) = (v_ldh*( - k_lac*k_nad*mttx5*mttx7 + k_nadh*k_pyr*mttx12*mttx8))/( \
k_lac*k_nad*mttx5*mttx7*rho_ldh + k_ldh - k_nadh*k_pyr*mttx12*mttx8*rho_ldh +  \
k_nadh*k_pyr*mttx12*mttx8);
  mtty(8) = (v_pgk*( - k_dpg*mttx4 + k_p3g*mttx10))/(k_dpg*mttx4*rho_pgk -  \
k_dpg*mttx4 - k_p3g*mttx10*rho_pgk - k_pgk);
  mtty(9) = (v_pk*( - k_pep*mttx11 + k_pyr*mttx12))/(k_pep*mttx11*rho_pk -  \
k_pep*mttx11 - k_pk - k_pyr*mttx12*rho_pk);
  mtty(10) = (k_gly*mttx16*v_gpa*( - k_g1p*mttx14 + 1))/(k_g1p*k_gly*mttx14* \
  mttx16*rho_gpa - k_gly*mttx16*rho_gpa + k_gly*mttx16 + k_gpa);
  mtty(11) = (k_gly*mttx16*v_gpb*( - k_g1p*mttx14 + 1))/(k_g1p*k_gly*mttx14* \
  mttx16*rho_gpb - k_gly*mttx16*rho_gpb + k_gly*mttx16 + k_gpb);
  mtty(12) = (v_pgi*( - k_f6p*mttx13 + k_g6p*mttx15))/(k_f6p*mttx13*rho_pgi -  \
k_g6p*mttx15*rho_pgi + k_g6p*mttx15 + k_pgi);
  mtty(13) = (v_pglm*( - k_g1p*mttx14 + k_g6p*mttx15))/(k_g1p*mttx14*rho_pglm - \
 k_g1p*mttx14 - k_g6p*mttx15*rho_pglm - k_pglm);
  mtty(14) = (v_pfk*( - k_f6p*mttx13 + k_fbp*mttx2))/(k_f6p*mttx13*rho_pfk -  \
k_f6p*mttx13 - k_fbp*mttx2*rho_pfk - k_pfk);
## END Code
endfunction