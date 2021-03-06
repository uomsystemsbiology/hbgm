function sympar = LamKus02_sympar();
% sympar = LamKus02_sympar();
%System LamKus02, representation sympar, language m;
%File LamKus02_sympar.m;
%Generated by MTT on Mon Mar  2 14:55:39 AEDT 2015;
%
global ...
mtt_no_globals ;
  sympar.K_ADP 	= 1; # LamKus02__mttCrAMP
  sympar.K_AMP 	= 2; # LamKus02__mttCrAMP
  sympar.K_ATP 	= 3; # LamKus02__mttCrAMP
  sympar.K_Cr 	= 4; # LamKus02__mttCrAMP
  sympar.K_DHAP 	= 5; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.K_DPG 	= 6; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_F6P 	= 7; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.K_FBP 	= 8; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.K_G1P 	= 9; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.K_G6P 	= 10; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.K_GAP 	= 11; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.K_GLY 	= 12; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.K_LAC 	= 13; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_LACo 	= 14; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_NAD 	= 15; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_NADH 	= 16; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_P 	= 17; # LamKus02__mttCrAMP
  sympar.K_P2G 	= 18; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_P3G 	= 19; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_PCr 	= 20; # LamKus02__mttCrAMP
  sympar.K_PEP 	= 21; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.K_PYR 	= 22; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.RT 	= 23; # LamKus02__mttGLY2LAC__mttFBP2GAP,LamKus02__mttGLY2LAC__mttGAP2LAC,LamKus02__mttGLY2LAC__mttGLY2FBP,
  sympar.k_ADK 	= 24; # LamKus02__mttCrAMP
  sympar.k_ALD 	= 25; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.k_ATPase 	= 26; # LamKus02
  sympar.k_CK 	= 27; # LamKus02__mttCrAMP
  sympar.k_ENO 	= 28; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_Fout 	= 29; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_GAPDH 	= 30; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_GPa 	= 31; # LamKus02__mttGLY2LAC__mttGLY2FBP__GP
  sympar.k_GPb 	= 32; # LamKus02__mttGLY2LAC__mttGLY2FBP__GP
  sympar.k_LDH 	= 33; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_PFK 	= 34; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.k_PGI 	= 35; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.k_PGK 	= 36; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_PGLM 	= 37; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.k_PGM 	= 38; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_PK 	= 39; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.k_TPI 	= 40; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.rho_ADK 	= 41; # LamKus02__mttCrAMP
  sympar.rho_ALD 	= 42; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.rho_ATPase 	= 43; # LamKus02
  sympar.rho_CK 	= 44; # LamKus02__mttCrAMP
  sympar.rho_ENO 	= 45; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_Fout 	= 46; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_GAPDH 	= 47; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_GPa 	= 48; # LamKus02__mttGLY2LAC__mttGLY2FBP__GP
  sympar.rho_GPb 	= 49; # LamKus02__mttGLY2LAC__mttGLY2FBP__GP
  sympar.rho_LDH 	= 50; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_PFK 	= 51; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.rho_PGI 	= 52; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.rho_PGK 	= 53; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_PGLM 	= 54; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.rho_PGM 	= 55; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_PK 	= 56; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.rho_TPI 	= 57; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.v_ADK 	= 58; # LamKus02__mttCrAMP
  sympar.v_ALD 	= 59; # LamKus02__mttGLY2LAC__mttFBP2GAP
  sympar.v_ATPase 	= 60; # LamKus02
  sympar.v_CK 	= 61; # LamKus02__mttCrAMP
  sympar.v_ENO 	= 62; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_Fout 	= 63; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_GAPDH 	= 64; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_GPa 	= 65; # LamKus02__mttGLY2LAC__mttGLY2FBP__GP
  sympar.v_GPb 	= 66; # LamKus02__mttGLY2LAC__mttGLY2FBP__GP
  sympar.v_LDH 	= 67; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_PFK 	= 68; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.v_PGI 	= 69; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.v_PGK 	= 70; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_PGLM 	= 71; # LamKus02__mttGLY2LAC__mttGLY2FBP
  sympar.v_PGM 	= 72; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_PK 	= 73; # LamKus02__mttGLY2LAC__mttGAP2LAC
  sympar.v_TPI 	= 74; # LamKus02__mttGLY2LAC__mttFBP2GAP
