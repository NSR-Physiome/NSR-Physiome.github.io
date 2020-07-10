import nsrunit; unit conversion on;
// SHORT DESCRIPTION
// Axial diffusion in one dimension. Uses only MacCormack or Toms732 solver.

math SimpleDiffusionEquation { 

realDomain t sec; t.min=0; t.max=15; t.delta=0.1;
real L = 0.1 cm,                  // Length of tube
     Ngridx = 51;                 // Number of grid divisions
realDomain x cm; x.min=0; x.max=L; x.ct=Ngridx;

real        C(x,t) mM;            // Concentration of substance
extern real C0(x) mM;             // Initial Distribution of C
real        D = 0.00005 cm^2/sec; // Diffusion coefficient

// Initial Condition
when(t=t.min) {C(x,t) = C0;}

// Boundary Conditions
when (x=x.min) { D*C:x = 0;}      // Left Hand BC
when (x=x.max) { D*C:x = 0; }     // Right Hand BC

// Partial Differential Equation
C:t = D*C:x:x;

real integralCdx mM*cm;          // Integral C(x,t.max)*dx from x.min to x.max
integralCdx = integral(x=x.min to x.max, C(x,t.max));

}

