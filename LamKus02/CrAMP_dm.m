
function [mtta,mttb,mttc,mttd,mtte] = CrAMP_dm(mttpar,mttx);
## [mtta,mttb,mttc,mttd,mtte] = CrAMP_dm(mttpar,mttx);
## System CrAMP, representation dm, language m; 
## File CrAMP_dm.m; 
## Generated by MTT on Mon Mar  2 14:54:20 AEDT 2015; 

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
   k_ck 	= mttpar(9);
   rho_adk 	= mttpar(10);
   rho_ck 	= mttpar(11);
   v_adk 	= mttpar(12);
   v_ck 	= mttpar(13);

## States 
mttx1 = mttx(1) ;
mttx2 = mttx(2) ;
mttx3 = mttx(3) ;
mttx4 = mttx(4) ;
mttx5 = mttx(5) ;
mttx6 = mttx(6) ;

   mtta = zeros(6,6);
   mttb = zeros(6,2);
   mttc = zeros(2,6);
   mttd = zeros(2,2);
   mtte = zeros(6,6);

## BEGIN Code

## Code
  mtte(1,1) = 1;
  mtte(2,2) = 1;
  mtte(3,3) = 1;
  mtte(4,4) = 1;
  mtte(5,5) = 1;
  mtte(6,6) = 1;
  mttb(1,1) = 2;
  mttb(1,2) = 1;
  mttb(2,1) = -1;
  mttb(3,1) = -1;
  mttb(3,2) = -1;
  mttb(4,2) = -1;
  mttb(6,2) = 1;
## END Code
endfunction
