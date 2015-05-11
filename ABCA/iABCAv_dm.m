
function [mtta,mttb,mttc,mttd,mtte] = iABCAv_dm(mttpar,mttx);
## [mtta,mttb,mttc,mttd,mtte] = iABCAv_dm(mttpar,mttx);
## System iABCAv, representation dm, language m; 
## File iABCAv_dm.m; 
## Generated by MTT on Mon Mar  2 14:50:41 AEDT 2015; 

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
mttx4 = mttx(4) ;
mttx5 = mttx(5) ;

   mtta = zeros(5,5);
   mttb = zeros(5,2);
   mttc = zeros(4,5);
   mttd = zeros(4,2);
   mtte = zeros(5,5);

## BEGIN Code

## Code
  mtte(1,1) = 1;
  mtte(2,2) = 1;
  mtte(3,3) = 1;
  mtta(1,4) = -1;
  mtta(1,5) = -1;
  mtta(2,4) = 1;
  mtta(3,5) = 1;
  mtta(4,1) = k_a/k_b;
  mtta(4,2) = -1;
  mtta(5,1) = k_a/k_c;
  mtta(5,3) = -1;
  mttc(1,4) = 1;
  mttc(1,5) = 1;
  mttc(2,5) = 1;
  mttd(1,1) = 1;
  mttd(1,2) = 1;
  mttd(2,1) = 1;
  mttd(2,2) = 1;
  mttd(3,1) = 1;
  mttd(4,2) = 1;
## END Code
endfunction
