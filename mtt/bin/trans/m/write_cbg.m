function write_cbg(system_name,system_type,system,Flipped)

###############################################################
## Version control history
###############################################################
## $Id: write_cbg.m,v 1.6 2009/11/02 16:54:03 geraint Exp $
## $Log: write_cbg.m,v $
## Revision 1.6  2009/11/02 16:54:03  geraint
## Replaced deprecated functions from Octave 2.1 for Octave 3.0: is_struct -> isstruct, struct_contains -> isfield, struct_elements -> fieldnames, is_complex -> iscomplex, setstr -> char
##
## Revision 1.5  2004/09/12 22:27:27  geraint
## Appended 't' to fopen mode string to open in text mode.
##
## Revision 1.4  1998/08/26 12:26:17  peterg
## Replaced if N>0 by   if (N>0)&&(M>0)		# Flipped ports exist
##
## Revision 1.3  1998/08/25 20:05:33  peterg
## Write flipped port info
##
## Revision 1.2  1998/08/25 06:21:19  peterg
## Just writes additional information; basic info from the abg structure.
##
## Revision 1.1  1998/08/25 05:55:10  peterg
## Initial revision
##
###############################################################


  fid=fopen([system_name,"_cbg.m"], "wt");# Open file

  StatusFormat = "  %s.%s.%s.status = %i;\n";
  Bformat = "  %s.bonds = [\n";
  Iformat = "  %s.%s.%s.connections(%i) = %i;\n";


  fprintf(fid,"function [%s] =  %s_cbg\n", system_name, system_name);
  fprintf(fid,"# This function is the causal bond graph representation of %s\n",system_name);
  fprintf(fid,"# Generated by MTT on %s",ctime(time));
  fprintf(fid,"# The file is in Octave format\n");
  
  fprintf(fid,"\n# Acausal bond graph structure\n");
  fprintf(fid,"  [%s] =  %s_abg;\n", system_name, system_type);

  fprintf(fid,"\n# Status information\n");
#  if isfield(system,"ports")
#    for [port,name]=system.ports
#      fprintf(fid,StatusFormat,system_name,"ports",name,port.status);
#    endfor;
#  endif
  if isfield(system,"subsystems")
    for [subsystem,name]=system.subsystems
      fprintf(fid,StatusFormat,system_name,"subsystems",name,subsystem.status);
    endfor;
  endif
  
  [N,M]=size(system.bonds);		# Bonds
  fprintf(fid,"\n# Causal bond information\n");
  fprintf(fid,Bformat,system_name);
  for i=1:N
    fprintf(fid,"      ");
    for j=1:M
      fprintf(fid,"%i ", system.bonds(i,j));
    endfor;
    fprintf(fid,"\n");
  endfor;
  fprintf(fid,"      ];\n");

  [N,M]=size(Flipped.ports);
  if (N>0)&&(M>0)		# Flipped ports exist
    fprintf(fid,"\n# Flipped port information\n");
    for i=1:N
      name=deblank(Flipped.ports(i,:));
      eval(["con = system.ports.",name,".connections;"]);
      fprintf(fid,Iformat,system_name,"ports",name,1,con);
    endfor;
  endif;

  [N,M]=size(Flipped.subs);
  if (N>0)&&(M>0)		# Flipped subs exist
    for i=1:N
      name=deblank(Flipped.subs(i,:));
      k=Flipped.cons(i);
      eval(["con = system.subsystems.",name,".connections(",num2str(k),");"]);
      fprintf(fid,Iformat,system_name,"subsystems",name,k,con);
    endfor;
  endif;

  fclose(fid);
  

