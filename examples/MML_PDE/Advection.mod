import nsrunit; unit conversion on;
// SHORT DESCRIPTION
// Model for the flow of a substance in a tube. 

math Advection {  

realDomain t sec; t.min=0; t.max=15; t.delta=0.1;
real L      = 0.1 cm,             // Length of tube
     Ngridx = 51;                 // Number of grid points spatially 
realDomain x cm; x.min=0; x.max=L; x.ct=Ngridx;

real        C(x,t) mM;            // Concentration of substance
extern real Cin(t) mM;            // Inflow Concentration
extern real C0(x) mM;             // Initial Distribution of C
real        Cout(t) mM,           // OutflowConcentration
            F = 1 ml/min,         // Flow rate
            V = 0.05 ml,          // Volume of tube
            U cm/sec,             // Flow Velocity
            Tmean sec;            // Time for inflow to appear as outflow

U     = F*L/V;
Tmean = V/F;  
         
// Initial Condition
when(t=t.min) {C(x,t)=if(x=x.min) Cin else C0;}

// Boundary Conditions
when (x=x.min) {  -U*C = -U*Cin;}                // Left Hand BC
when (x=x.max) { C:x = 0; Cout = C;}             // Right Hand BC

// Partial Differential Equation
C:t = -U*C:x ;

}


