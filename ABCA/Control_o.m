Setpath; Setplot;
i_fig=10;
sys = "ABCAo"			# External flow system.

Figures_stoich;

## Extract
names = {"N_i" "N_e" "K" "n_X" "n_v" "L_xX" "L_Xx" "G_X"};
for i = 1:length(names)
  name = names{i};
  eval(sprintf("%s = m.%s;", name, name));
endfor

A = -N*N';
##D = [0 0;0 0;1 1];
D = [0;0;1];
B = N*D
C = eye(3);				# flows.
r_AB = rank([B A*B])
SYS = ss(A,B,C);

# a = L_xX*A*L_Xx;
# b = L_xX*B;
# r_ab = rank([b a*b])
# c = eye(2);

# sys = ss(a,b,c);
# p = 2*eig(a);
# p = [-20;-20];
# k = place(a,b,p);

## Open-loop sim
X_0 = [3;1;0];			# Initial state 
x_0 = L_xX*X_0;
t = [0:0.1:2];
one = ones(size(t));
u = 3*[one'];
X = lsim(SYS,u,t,X_0);		# Full system
V = -N'*X' + D*u';

## Plot
figure(i_fig++);
plot(t,V);
grid

figure(i_fig++);
plot(t,X);
grid

## Control
K_u = 2*[1 0 0];
CHECK_KD = K_u*D
CSYS = ss(A-B*K_u,B*K_u*K,C);
v_0 = 3*one';
X_c = lsim(CSYS,v_0,t,X_0)';		# Full system
u = K_u*(K*v_0' - C*X_c);
V_c = -N'*X_c + D*u;

## Plot
figure(i_fig++);
plot(t,V_c);
grid

figure(i_fig++);
plot(t,X_c);
grid



##x = lsim(sys,u,t,x_0)';		# reduced system
##Xx = L_Xx*x + G_X*X_0*one;
##y = N_i'*(L_Xx*x + G_X*X_0*one);


