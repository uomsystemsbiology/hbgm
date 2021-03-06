function [bonds,status] = one_cause(bonds);
% one_cause - causality for a one junction
% 
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%     %%%%% Model Transformation Tools %%%%%
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Matlab function  one_cause


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Version control history
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% $Id: one_cause.m,v 1.1 2000/12/28 11:51:32 peterg Exp $
% %% $Log: one_cause.m,v $
% %% Revision 1.1  2000/12/28 11:51:32  peterg
% %% Initial revision
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Copyright (c) P.J. Gawthrop, 1996.

%Effort
[bonds,e_status] = juncause(bonds,-1,1);

%Flow
[bonds,f_status] = juncause(bonds,-1,-1);

if (e_status==1)|(f_status==1)       % Over causal
  status = 1;
elseif (e_status==-1)|(f_status==-1) % Under causal
  status = -1;
else                                  % causal
  status = 0;
end;

