
function [mttu] = ABCA_input(mttx,mtty,mttt,mttpar);
## [mttu] = ABCA_input(mttx,mtty,mttt,mttpar);
## System ABCA, representation input, language m; 
## File ABCA_input.m; 
## Generated by MTT on Mon Mar  2 14:48:39 AEDT 2015; 

## Horrible fudge to make mtt_m2p work
global ...
mtt_no_globals ;

## Parameters 
   k_a 	= mttpar(1);
   k_b 	= mttpar(2);
   k_c 	= mttpar(3);
   rt 	= mttpar(4);
   kappa_1 	= mttpar(5);
   kappa_2 	= mttpar(6);
   kappa_3 	= mttpar(7);

## States 
mttx1 = mttx(1) ;
mttx2 = mttx(2) ;
mttx3 = mttx(3) ;

   mttu = zeros(3,1);

## BEGIN Code

## States
  abca__a 	= mttx(1);
  abca__b 	= mttx(2);
  abca__c 	= mttx(3);

## User defined code from ABCA_input.txt
  abca__r1__v_1__u	=  1.0; 
  abca__r2__v_1__u	=  1.0; 
  abca__r3__v_1__u	=  1.0; 

  ## Set up the mttu vector
  mttu(1)	= abca__r1__v_1__u;
  mttu(2)	= abca__r2__v_1__u;
  mttu(3)	= abca__r3__v_1__u;
## END Code
endfunction
