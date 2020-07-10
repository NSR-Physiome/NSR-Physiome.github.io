import nsrunit; unit conversion on;
// SHORT DESCRIPTION
// Models flow (left to right) of a substance in tube with axial diffusion.

math AdvectionDiffusion { 

realDomain t sec; t.min=0; t.max=15; t.delta=0.1;
real L      = 0.1 cm,              // Length of tube
     Ngridx = 51;                  // Number of grid points
realDomain x cm; x.min=0; x.max=L; x.ct=Ngridx;

real        C(x,t) mM;                   // Concentration of substance
extern real Cin(t) mM;                   // Inflow Concentration
extern real C0(x) mM;                    // Initial Distribution of C
real        Cout(t) mM,                  // Outflow Concentration
            F    = 1 ml/min,             // Flow rate in tube
            V    = 0.05 ml,              // Volume of tube
            D    = 0.001 cm^2/sec,       // Diffusion coefficient
            U cm/sec;                    // Velocity
U  = F*L/V;

// Initial Condition
when(t=t.min) {C(x,t)=if(x=x.min) Cin else C0;}

// Boundary Conditions
when (x=x.min) { -U*C + D*C:x = -U*Cin; } // Left Hand Total Flux BC
when (x=x.max) { D*C:x=0;        Cout=C;} // Right Hand Neumann BC

// Partial Differential Equation
C:t = -U*C:x + D*C:x:x;
}

