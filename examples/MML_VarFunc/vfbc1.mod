// tank/pipe system with pipe output calculated using VF
import nsrunit;
unit conversion on;
math vfbc1 {
  realDomain t sec;             // time grid
  t.min=0; t.max=10; t.delta=.1;  
  realDomain x cm;              // pipe spatial grid
  real L=1 cm; x.min=-L; x.max=L; x.ct=51; 
  real C1(t,x) mM, C2(t) mM;    // pipe (C1) & tank(C2) conc.
  real C1in(t) mM, C1out(t) mM; // pipe input & output conc.
  real F = 1 ml/sec;            // flow rate
  real V1 = 1 ml, V2 = 1 ml;    // pipe & tank volumes  
  real D = 1 cm^2/sec;          // diffusion constant
  when (t=t.min) { C1=C2*(x/x.max)^2; C2=1; }// initial pipe & tank conc.
  when (x=x.min) C1=C1in;       // pipe left-hand BC
  when (x=x.max) C1:x = 0;      // pipe right-hand BC
  C1:t = D*C1:x:x - 2*F*L/V1*C1:x;// pipe PDE
  C2:t = F/V2*(C1out-C2);       // tank ODE
  C1in = C2;                    // pipe input calculate from C2
  C1out = C1(t, x.max);         // pipe output calculated via VF
}
