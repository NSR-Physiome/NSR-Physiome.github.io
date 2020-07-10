// C library for use with nmean.mod
#include "jsimapi.h"

JSIM_REAL_FUNCTION(mylib,mygmean) {
  JSIM_INIT();
  JSimArg *a = JSIM_ARG(0);
  JSimArg *b = JSIM_ARG(1);
  double aval = a->realVal[0];
  double bval = b->realVal[0];
  JSIM_RETURN(sqrt(aval*bval));
}
