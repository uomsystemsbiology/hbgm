PROCEDURE mtt_solve_svd(VAR x : StateVector;
			    A : StateMatrix;
			VAR B : StateVector;
			    n : integer);

{Solve linear equation via svd}

{

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Version control history
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % $Id: mtt_solve_svd.p,v 1.3 1999/10/26 23:40:37 peterg Exp $
% % $Log: mtt_solve_svd.p,v $
% % Revision 1.3  1999/10/26 23:40:37  peterg
% % Put small as a constant - now has same arg list as mtt_solve_lud
% %
% % Revision 1.2  1998/08/17 12:40:25  peterg
% % Renamed mtt_solve to mtt_solve_svd
% % -- now also have mtt_solve_lu
% %
% % Revision 1.1  1998/08/17 12:38:52  peterg
% % Initial revision
% %
% % Revision 1.2  1998/08/14 12:09:13  peterg
% % A passed by value - its destroyed by SVDcm
% %
% % Revision 1.1  1998/08/13 08:51:57  peterg
% % Initial revision
% %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 }

CONST
   Small =  1e-6; (* Criteroion for small svd *)
VAR
   i	     : integer;
   wmax,wmin : real;
   w	     : StateVector ;
   v	     : StateMatrix;

(*$I svdcmp.p *)
(*$I svbksb.p *)

BEGIN{mtt_solve}
(* decompose matrix A using SVD *)
   svdcmp(A,n,n,w,v);
   
(* find maximum singular value *)
   wmax := 0.0;
   FOR i := 1 to n DO BEGIN
      IF  (w[i] > wmax) THEN  wmax := w[i]
   END;
   
(* define "small" *)
   wmin := wmax*Small;
   
(* zero the "small" singular values *)
   FOR i := 1 to n DO BEGIN
      IF  (w[i] < wmin) THEN  w[i] := 0.0
   END;
   
(* backsubstitute for B *)
      svbksb(A,w,v,n,n,B,x);
   
END{mtt_solve};