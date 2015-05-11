
function [mtta,mttb,mttc,mttd,mtte] = FBP2GAP_dm(mttpar,mttx);
## [mtta,mttb,mttc,mttd,mtte] = FBP2GAP_dm(mttpar,mttx);
## System FBP2GAP, representation dm, language m; 
## File FBP2GAP_dm.m; 
## Generated by MTT on Mon Mar  2 14:53:19 AEDT 2015; 

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

   mtta = zeros(3,3);
   mttb = zeros(3,2);
   mttc = zeros(2,3);
   mttd = zeros(2,2);
   mtte = zeros(3,3);

## BEGIN Code

## Code
  mtte(1,1) = 1;
  mtte(2,2) = 1;
  mtte(3,3) = 1;
  mttb(1,1) = 1;
  mttb(1,2) = 1;
  mttb(2,1) = -1;
  mttb(3,1) = 1;
  mttb(3,2) = -1;
  mttc(1,2) = (k_fbp*v_ald)/k_ald;
  mttc(2,1) = ( - k_dhap*v_tpi)/k_tpi;
  mttc(2,3) = (k_gap*v_tpi)/k_tpi;
## END Code
endfunction
