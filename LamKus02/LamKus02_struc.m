function [input_name,output_name,state_name,nonstate_name] = LamKus02_struc
%% Usage: [input_name,output_name,state_name,nonstate_name] = LamKus02_struc
%% Structure file (LamKus02_struc.m)
%% Generated by MTT at Mon Mar  2 14:55:39 AEDT 2015

## Default to null strings
 input_name = "";
 output_name = "";
 state_name  = ""; 
 nonstate_name  = "";
input_name = [
'LamKus02__mttCrAMP__ADK__v_1__u_u'
'LamKus02__mttCrAMP__CK__v_1__u_u'
'LamKus02__mttGLY2LAC__mttFBP2GAP__ALD__v_1__u_u'
'LamKus02__mttGLY2LAC__mttFBP2GAP__TPI__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__ENO__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__Fout__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PGM__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__GAPDH__Re__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__LDH__Re__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PGK__Re__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PK__Re__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGLY2FBP__GP__GPa__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGLY2FBP__GP__GPb__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGLY2FBP__PGI__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGLY2FBP__PGLM__v_1__u_u'
'LamKus02__mttGLY2LAC__mttGLY2FBP__PFK__Re__v_1__u_u'
'LamKus02__ATPase__v_1__u_u'
];
output_name = [
'LamKus02__mttCrAMP__ADK__v_2__y_y'
'LamKus02__mttCrAMP__CK__v_2__y_y'
'LamKus02__mttGLY2LAC__mttFBP2GAP__ALD__v_2__y_y'
'LamKus02__mttGLY2LAC__mttFBP2GAP__TPI__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__ENO__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__Fout__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PGM__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__GAPDH__Re__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__LDH__Re__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PGK__Re__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PK__Re__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGLY2FBP__GP__GPa__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGLY2FBP__GP__GPb__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGLY2FBP__PGI__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGLY2FBP__PGLM__v_2__y_y'
'LamKus02__mttGLY2LAC__mttGLY2FBP__PFK__Re__v_2__y_y'
'LamKus02__ATPase__v_2__y_y'
];
state_name = [
'LamKus02__mttCrAMP__ADP_ADP'
'LamKus02__mttCrAMP__AMP_AMP'
'LamKus02__mttCrAMP__ATP_ATP'
'LamKus02__mttCrAMP__Cr_Cr'
'LamKus02__mttCrAMP__P_P'
'LamKus02__mttCrAMP__PCr_PCr'
'LamKus02__mttGLY2LAC__mttFBP2GAP__DHAP_DHAP'
'LamKus02__mttGLY2LAC__mttFBP2GAP__FBP_FBP'
'LamKus02__mttGLY2LAC__mttFBP2GAP__GAP_GAP'
'LamKus02__mttGLY2LAC__mttGAP2LAC__DPG_DPG'
'LamKus02__mttGLY2LAC__mttGAP2LAC__LAC_LAC'
'LamKus02__mttGLY2LAC__mttGAP2LAC__LACo_LACo'
'LamKus02__mttGLY2LAC__mttGAP2LAC__NAD_NAD'
'LamKus02__mttGLY2LAC__mttGAP2LAC__NADH_NADH'
'LamKus02__mttGLY2LAC__mttGAP2LAC__P2G_P2G'
'LamKus02__mttGLY2LAC__mttGAP2LAC__P3G_P3G'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PEP_PEP'
'LamKus02__mttGLY2LAC__mttGAP2LAC__PYR_PYR'
'LamKus02__mttGLY2LAC__mttGLY2FBP__F6P_F6P'
'LamKus02__mttGLY2LAC__mttGLY2FBP__G1P_G1P'
'LamKus02__mttGLY2LAC__mttGLY2FBP__G6P_G6P'
'LamKus02__mttGLY2LAC__mttGLY2FBP__GLY_GLY'
];