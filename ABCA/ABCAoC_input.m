
function [mttu] = ABCAoC_input(mttx,mtty,mttt,mttpar);
## [mttu] = ABCAoC_input(mttx,mtty,mttt,mttpar);
## System ABCAoC, representation input, language m; 
## File ABCAoC_input.m; 
## Generated by MTT on Mon Mar  2 14:51:12 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_a 	= mttpar(1);
   k_b 	= mttpar(2);
   k_c 	= mttpar(3);
   k_f 	= mttpar(4);
   k_r 	= mttpar(5);
   rt 	= mttpar(6);
   kappa_1 	= mttpar(7);
   kappa_2 	= mttpar(8);
   kappa_3 	= mttpar(9);

## States 
mttx1 = mttx(1) ;
mttx2 = mttx(2) ;
mttx3 = mttx(3) ;
mttx4 = mttx(4) ;
mttx5 = mttx(5) ;

   mttu = zeros(3,1);

## BEGIN Code

## States
  abcaoc__a 	= mttx(1);
  abcaoc__b 	= mttx(2);
  abcaoc__c 	= mttx(3);
  abcaoc__f 	= mttx(4);
  abcaoc__r 	= mttx(5);

## User defined code from ABCAoC_input.txt
  abcaoc__r1__v_1__u	=  1.0; 
  abcaoc__r2__v_1__u	=  1.0; 
  abcaoc__r3__v_1__u	=  1.0; 

  ## Set up the mttu vector
  mttu(1)	= abcaoc__r1__v_1__u;
  mttu(2)	= abcaoc__r2__v_1__u;
  mttu(3)	= abcaoc__r3__v_1__u;
## END Code
endfunction
