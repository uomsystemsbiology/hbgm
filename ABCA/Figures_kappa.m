## Explore state-dependent kappa.
##Figures_lin;			# Setup stuff + linearisation

kappa_1 = 1;
kappa_0 = kk*kappa_1;
i_kappa = 1;

## Plot kappa v x
Kappa = [];
dKappa = [];
Lambda = [0.5:0.01:2];
dLambda = mean(diff(Lambda));
X_e = [1;1];
for lambda = Lambda
  X = X_ss;
  X(i_kappa) = lambda*X_ss(i_kappa);
  [kappa dkappa] = sdkappa (N_f,N_r,kappa_0,kappa_1,KK,N_ef,N_er,KK_e,X);
  
  Kappa = [Kappa kappa];
  dKappa = [dKappa dkappa(:,i_kappa)];
endfor

DKappa = diff(Kappa')'/(dLambda*X_ss(i_kappa));

figure(10);plot(Lambda,Kappa)
grid
xlim([min(Lambda) max(Lambda)])
##ylim([0 1])

figure(11);plot(Lambda,dKappa, Lambda(2:length(Lambda)), DKappa)
grid
xlim([min(Lambda) max(Lambda)])

## Derivative at SS

kappa_0 = ones(3,1)
[kappa dkappa] = sdkappa (N_f,N_r,kappa_0,kappa_1,KK,N_ef,N_er,KK_e,X_ss);

## Redo to give same steady state as with fixed kappa
kappa_0 = kk./kappa

[kappa dkappa] = sdkappa(N_f,N_r,kappa_0,kappa_1,KK,N_ef,N_er,KK_e,X_ss);
CHECK_kappa = norm(kappa-kk)

C_kappa = dkappa;		# dkappa/dX_i


A_kappa = N*dkappa;
[eig(A0) eig(A0+A_kappa)]
