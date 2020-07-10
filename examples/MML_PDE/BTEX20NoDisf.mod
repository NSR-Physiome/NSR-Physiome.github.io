/* DESCRIPTION: Shows the difference between setting Disf to zero vs.
   omitting Disf from the isf concentration equation. The omission causes
   an error. Run LOOPS with t.delta = 0.2, 0.1, 0.01; PDE solver equals LSFEA; 
   and plot Cout and CoutNoDisf. Then repeat with the other PDE solvers. */

import  nsrunit; unit conversion on;

math BTEX20NoDisf {

// INDEPENDENT VARIABLES
realDomain t sec ; t.min=0; t.max=50; t.delta=0.2;
realDomain x cm; real L=0.1 cm, Ngrid=61; x.min=0; x.max=L; x.ct=Ngrid;    
private x.min, x.max, x.ct;

// PARAMETERS
real Fp     = 1 ml/(g*min),    // plasma flow
     Vp     = 0.05 ml/g,       // plasma volume 
     Visfp  = 0.15 ml/g,       // isf volume (Visf')
     PSg    = 100 ml/(g*min),  // exchange coefficient between plasma and isf                                                   
     Dp     = 0.0 cm^2/sec,    // plasma diffusion coefficient
     Disf   = 0.0 cm^2/sec;
//   INFLOWING CONCENTRATION
real Cin(t) mM; Cin = if (t>=1 and t<2) (1 mM) else (0 mM);

//   CONCENTRATION VARIABLES (Disf in equation for Cisf)
real Cp(t,x)    mM,             // plasma
     Cisf(t,x)  mM,             // isf
     Cout(t)    mM;             // Outflow Concentration from plasma region
//   BOUNDARY CONDITIONS 
when  (x=x.min) { (-Fp*L/Vp)*(Cp-Cin)+Dp*Cp:x = 0;  Cisf:x = 0;  }
when  (x=x.max) {                        Cp:x = 0; Cisf:x = 0; Cout = Cp;}
//   INITIAL CONDITIONS
when (t=t.min) {                          Cp   = 0; Cisf   = 0; }
//   PARTIAL DIFFERENTIAL EQUATIONS
Cp:t   = -Fp*L/Vp*Cp:x + PSg/Vp*(Cisf-Cp)    + Dp*Cp:x:x     ;
Cisf:t =                 PSg/Visfp*(Cp-Cisf) + Disf*Cisf:x:x ;

//   CONCENTRATION VARIABLES (Disf omitted from equation for CisfNoDisf)
real CpNoDisf(t,x)    mM,             // plasma
     CisfNoDisf(t,x)  mM,             // isf
     CoutNoDisf(t)    mM;             // Outflow Concentration from plasma region
//   BOUNDARY CONDITIONS 
when  (x=x.min) { (-Fp*L/Vp)*(CpNoDisf-Cin)+Dp*CpNoDisf:x = 0;  }
when  (x=x.max) {                              CpNoDisf:x = 0; CoutNoDisf = CpNoDisf;}
//   INITIAL CONDITIONS
when (t=t.min) {                          CpNoDisf   = 0; CisfNoDisf = 0;}
//   PARTIAL DIFFERENTIAL EQUATIONS 
CpNoDisf:t   = -Fp*L/Vp*CpNoDisf:x + PSg/Vp*(CisfNoDisf-CpNoDisf) + Dp*CpNoDisf:x:x ;
CisfNoDisf:t =                     + PSg/Visfp*(CpNoDisf-CisfNoDisf) ; //<-No diffusion term

}
