## Plots for Control.m

X_legend = {"a" "b" "c" "d" "e"};
V_legend = {"1" "2" "3" "ext"};


  ## Plot
  figure(i_fig++);
  plot(t,V);
  grid
  axis([0 max(t) -1 3]);
  xlabel("t")
  ylabel("V")
  legend(V_legend)
  fig(name,"V",2);
  
  figure(i_fig++);
  plot(t,X);
  grid
  axis([0 max(t) 0 6]);
  xlabel("t")
  ylabel("X")
  legend(X_legend)
  fig(name,"X",2);
  
  # figure(i_fig++);
  # plot(t,ul)
  # axis([0 max(t) round(min(ul))-1 round(max(ul))+1])
  # xlabel("t")
  # ylabel("u")
  # grid
  # fig(name,"ul",2);
  
  figure(i_fig++);
  plot(t,sum(X(1:3,:)),";a+b+c;", t,sum(X(4:5,:)),";d+e;")
  axis([0 max(t) 0 10])
  xlabel("t")
  ylabel("\\Sigma X")
  grid
  fig(name,"sum",2);
  