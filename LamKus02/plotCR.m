function v = plotCR (bg,reaction,species,range,X_0)
	 
  ## usage: v = plotCR (bg,reaction,species,range,X_0)
  ## 
  ## 

  name = "LamKus02";
	 
  par = eval(sprintf("%s_numpar;",name));
  u = zeros(100,1);
  t = 0;
  X = X_0;

  val = eval(sprintf("bg.%s;",reaction));


  v = [];
  i = eval(sprintf("bg.s_index.%s",species));
  j = eval(sprintf("bg.r_index.%s",reaction));
  for r_i = range
    X(i) = r_i*X_0(i);
    V = eval(sprintf("%s_odeo(X,u,t,par);",name));
    v = [v V(j)];
  endfor
    
  v_max_f = val.v_max/(1-val.rho_v);
  v_max_r = val.v_max/(val.rho_v);

  one = ones(size(range));
  semilogx(range,v, range,v_max_f*one, range,-v_max_r*one); grid;

endfunction
