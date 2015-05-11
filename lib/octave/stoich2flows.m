function eqns = stoich2flows (N,i_i)

  ## usage:  eqns = stoich2flows (N,i_i)
  ## N: stoichiometric matrix
  ## i_i: indices of independent flows.
  ## Generates Mass-action equations from stoichiometric matrix.

  if nargin<2
    i_i = [];
  end
  
  [n_x,n_v] = size(N);

  eqns = "";
  for i_v = 1:n_v

    for fr = [-1 1];		# -1 forward, 1 reverse
      eq = "";
      N_fr = abs(N).*(fr*N<0);	# N_f (fr==-1) or N_r (fr==1)

      for i_x = 1:n_x

	## Element of N_f or N_r
	## Non-zero element implies factor
	k = N_fr(i_x,i_v);	

	## Another factor
	if (k>0)&&(length(eq)>0)	
	  eq = sprintf("%s.*",eq);
	endif
	
	## Create factor raised to power k
	if k==1
	  eq = sprintf("%s(K(%i)*X(%i,:))",eq,i_x,i_x);
	elseif k>1
	  eq = sprintf("%s(K(%i)*X(%i,:))^%i",eq,i_x,i_x,k);
	endif

      endfor

      ## Append backward flow to forward flow. 
      if fr==-1
	eqn = eq;
      else
	eqn = sprintf("%s - %s",eq,eqn);
    endif
    endfor

    if ismember(i_v,i_i);
      ## Create expression for v if external flow
      eqn = sprintf("V(%i,:) = u(%i,:);\n",i_v,find(i_v==i_i));
    else
      ## Create expression for v
      eqn = sprintf("V(%i,:) = kappa(%i)*(%s);\n", i_v,i_v,eqn);
    endif
	
    eqns = [eqns eqn];
  endfor
endfunction