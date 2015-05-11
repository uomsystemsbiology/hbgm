%SUMMARY oneway	One way constitutive relationship eg Diode
%DESCRIPTION Parameter 1 is a large number being the forward gain
%DESCRIPTION	-- the reciprocal is the backward gain
%DESCRIPTION The input must be an effort
%DESCRIPTION Typical use is an R component with effort input

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Version control history
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% $Id: oneway.cr,v 1.1 2000/12/28 09:18:38 peterg Exp $
% %% $Log: oneway.cr,v $
% %% Revision 1.1  2000/12/28 09:18:38  peterg
% %% put under RCS
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


OPERATOR oneway; 

%Input has flow causality
FOR ALL r,  input
LET oneway(r, effort, 1, input, flow, 1)
	 = ((1 - sign(input))/2)*r*input;

%Input has effort causality
FOR ALL r,  input
LET oneway(r, flow, 1, input, effort, 1)
	 = ((1 - sign(input))/2)*(1/r)*input;

