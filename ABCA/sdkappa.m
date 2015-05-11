function [kappa dkappa] = sdkappa (Nf,Nr,kappa_0,kappa_1,K,Nef,Ner,Ke,x_ss,x_e)
	 
  ## usage: kappa = sdkappa (kappa)
  ## 
  ## 

  [n_e,m_e] = size(Nef);

  if nargin<10
    x_e = ones(n_e,1);
  endif
	 
  ## Required matrices
  NNf = [Nf;Nef];	 
  NNr = [Nr;Ner];
  X = [x_ss;x_e];
  KK = [K;Ke];
	 
  vp_0 = exp(NNf'*log(KK.*X));
  vm_0 = exp(NNr'*log(KK.*X));
  ##kappa = diag(kappa_0)/diag(kappa_1 + vp_0 + vm_0)
  kappa = kappa_0./(kappa_1 + vp_0 + vm_0);
  
  C_0 =  (diag(vp_0)*Nf' + diag(vm_0)*Nr')/diag(x_ss);
  ##dkappa = - diag( kappa_0./(kappa_1 + vp_0 + vm_0).^2)*C_0;
  dkappa = - (diag(kappa_0)/( diag(kappa_1 + vp_0 + vm_0)^2 ))*C_0;

endfunction
