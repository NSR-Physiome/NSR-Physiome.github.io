
Code taken from JSim source. optimizer ggopt code taken  directly from paper:
Bassingthwaighte JBB et al., GGOPT- an unconstrained non-linear optimizer, 
Comput. Meth. Prog. Biomed.,26, 1988


List of files included in zip:
1. Original fortran code (9 files):
   daxpy.f   dpodi.f  dposl.f  dqrsl.f  dswap.f
   dggopt.f  dpofa.f  dqrdc.f  dscal.f

These fortran files are annotated reasonably well.

2. Wrapper files and build instructions to integrate into JSim (java based
software):
  jggopt.c
  JSim_nml_opt_GGopt.h
  Makefile, Makefile.global.nml


Also you can download JSim src from:
http://www.physiome.org/jsim/download/source.html

The optimizers are in the following sub-directory:
    ..JSim/nonJava/opt/ggopt
