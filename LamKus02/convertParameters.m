function [v_max,rho_v,k_v] = convertParameters (v_max_f,v_max_r,Km_f,Km_r,K_eq,K_r)
	 
## usage: [v_max,rho_v,k_v] = convertParameters(v_maxf,Km_f,Km_r,K_eq)
## 
## 

tol = 1e-10;

if nargin<6
   K_r = 1;
endif
	 
if isempty(v_max_r)
  ## Compute v_max_r from Haldane
  v_max_r = (v_max_f*Km_r)/(K_eq*Km_f);
endif

if isempty(v_max_f)
  ## Compute v_max_f from Haldane
  v_max_f = (v_max_r*Km_f*K_eq)/(Km_r);
endif

## Compute v_max & rho
v_max = (v_max_f*v_max_r)/(v_max_f+v_max_r);
rho_v = v_max_f/(v_max_f+v_max_r);

## Compute k_v 
K_f = K_r*K_eq;
k_v = (1-rho_v)*Km_f*K_f;
k_v_r =rho_v*Km_r*K_r;

CHECK_k_v = norm(k_v - k_v_r)/k_v;
if (CHECK_k_v>tol)
  k_v = k_v
  k_v_r = k_v_r
  error("convert: Discrepancy in k_v = %g", CHECK_k_v);
endif 
endfunction
