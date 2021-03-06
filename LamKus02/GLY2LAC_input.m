
function [mttu] = GLY2LAC_input(mttx,mtty,mttt,mttpar);
## [mttu] = GLY2LAC_input(mttx,mtty,mttt,mttpar);
## System GLY2LAC, representation input, language m; 
## File GLY2LAC_input.m; 
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

   mttu = zeros(14,1);

## BEGIN Code

## States
  gly2lac__mttfbp2gap__dhap 	= mttx(1);
  gly2lac__mttfbp2gap__fbp 	= mttx(2);
  gly2lac__mttfbp2gap__gap 	= mttx(3);
  gly2lac__mttgap2lac__dpg 	= mttx(4);
  gly2lac__mttgap2lac__lac 	= mttx(5);
  gly2lac__mttgap2lac__laco 	= mttx(6);
  gly2lac__mttgap2lac__nad 	= mttx(7);
  gly2lac__mttgap2lac__nadh 	= mttx(8);
  gly2lac__mttgap2lac__p2g 	= mttx(9);
  gly2lac__mttgap2lac__p3g 	= mttx(10);
  gly2lac__mttgap2lac__pep 	= mttx(11);
  gly2lac__mttgap2lac__pyr 	= mttx(12);
  gly2lac__mttgly2fbp__f6p 	= mttx(13);
  gly2lac__mttgly2fbp__g1p 	= mttx(14);
  gly2lac__mttgly2fbp__g6p 	= mttx(15);
  gly2lac__mttgly2fbp__gly 	= mttx(16);

## User defined code from GLY2LAC_input.txt
  gly2lac__mttfbp2gap__ald__v_1__u	=  1.0; 
  gly2lac__mttfbp2gap__tpi__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__eno__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__fout__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__gapdh__re__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__ldh__re__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__pgk__re__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__pgm__v_1__u	=  1.0; 
  gly2lac__mttgap2lac__pk__re__v_1__u	=  1.0; 
  gly2lac__mttgly2fbp__gp__gpa__v_1__u	=  1.0; 
  gly2lac__mttgly2fbp__gp__gpb__v_1__u	=  1.0; 
  gly2lac__mttgly2fbp__pfk__re__v_1__u	=  1.0; 
  gly2lac__mttgly2fbp__pgi__v_1__u	=  1.0; 
  gly2lac__mttgly2fbp__pglm__v_1__u	=  1.0; 

  ## Set up the mttu vector
  mttu(1)	= gly2lac__mttfbp2gap__ald__v_1__u;
  mttu(2)	= gly2lac__mttfbp2gap__tpi__v_1__u;
  mttu(3)	= gly2lac__mttgap2lac__eno__v_1__u;
  mttu(4)	= gly2lac__mttgap2lac__fout__v_1__u;
  mttu(5)	= gly2lac__mttgap2lac__pgm__v_1__u;
  mttu(6)	= gly2lac__mttgap2lac__gapdh__re__v_1__u;
  mttu(7)	= gly2lac__mttgap2lac__ldh__re__v_1__u;
  mttu(8)	= gly2lac__mttgap2lac__pgk__re__v_1__u;
  mttu(9)	= gly2lac__mttgap2lac__pk__re__v_1__u;
  mttu(10)	= gly2lac__mttgly2fbp__gp__gpa__v_1__u;
  mttu(11)	= gly2lac__mttgly2fbp__gp__gpb__v_1__u;
  mttu(12)	= gly2lac__mttgly2fbp__pgi__v_1__u;
  mttu(13)	= gly2lac__mttgly2fbp__pglm__v_1__u;
  mttu(14)	= gly2lac__mttgly2fbp__pfk__re__v_1__u;
## END Code
endfunction
