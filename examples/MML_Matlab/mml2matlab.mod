// Example for MML to Matlab translation
import nsrunit; 
unit conversion on;

math mml2matlab {
   realDomain t sec; t.min=0; t.max=1; t.delta=0.01;
   real C(t) mM;
   real k =1 sec^(-1);
   when(t=t.min) C=1;
   C:t = -k*C; 
}
