
function [mttu] = FBP2GAP_input(mttx,mtty,mttt,mttpar);
## [mttu] = FBP2GAP_input(mttx,mtty,mttt,mttpar);
## System FBP2GAP, representation input, language m; 
## File FBP2GAP_input.m; 
## Generated by MTT on Mon Mar  2 14:53:20 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_dhap 	= mttpar(1);
   k_fbp 	= mttpar(2);
   k_gap 	= mttpar(3);
   rt 	= mttpar(4);
   k_ald 	= mttpar(5);
   k_tpi 	= mttpar(6);
   rho_ald 	= mttpar(7);
   rho_tpi 	= mttpar(8);
   v_ald 	= mttpar(9);
   v_tpi 	= mttpar(10);

## States 
mttx1 = mttx(1) ;
mttx2 = mttx(2) ;
mttx3 = mttx(3) ;

   mttu = zeros(2,1);

## BEGIN Code

## States
  fbp2gap__dhap 	= mttx(1);
  fbp2gap__fbp 	= mttx(2);
  fbp2gap__gap 	= mttx(3);

## User defined code from FBP2GAP_input.txt
  fbp2gap__ald__v_1__u	=  1.0; 
  fbp2gap__tpi__v_1__u	=  1.0; 

  ## Set up the mttu vector
  mttu(1)	= fbp2gap__ald__v_1__u;
  mttu(2)	= fbp2gap__tpi__v_1__u;
## END Code
endfunction