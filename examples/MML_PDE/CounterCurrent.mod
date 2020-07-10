import nsrunit; unit conversion on;
// SHORT DESCRIPTION
// Counter current exchanging flows in two tubes with axial diffusion.

math AdvectionDiffusion { 

realDomain t sec; t.min=0; t.max=15; t.delta=0.1;
real L      = 0.1 cm,              // Length of tubes
     Ngridx = 51;                  // Number of grid points
realDomain x cm; x.min=0; x.max=L; x.ct=Ngridx;
//Left to Right Concentration
real        Clr(x,t) mM;                   // Concentration of substance
extern real Clrin(t) mM;                   // Inflow Concentration
extern real Clr0(x) mM;                    // Initial Distribution of C
real        Clrout(t) mM;                  // Outflow Concentration
//Right to Left Concentration
real        Crl(x,t) mM;                   // Concentration of substance
extern real Crlin(t) mM;                   // Inflow Concentration
extern real Crl0(x) mM;                    // Initial Distribution of C
real        Crlout(t) mM;                  // Outflow Concentration
real        PS   = 3 ml/min,               // Exchange rate between two tubes
            F    = 1 ml/min,               // Flow rate in tubes
            V    = 0.05 ml,                // Volume of tubes
            D    = 0.0001 cm^2/sec,        // Diffusion coefficient
            U cm/sec;                      // Velocity
U  = F*L/V;

// Initial Conditions
when(t=t.min) {Clr(x,t)=if(x=x.min) Clrin else Clr0;
               Crl(x,t)=if(x=x.max) Crlin else Crl0;}

// Boundary Conditions
when (x=x.min) { -U*Clr + D*Clr:x = -U*Clrin; } // Left Hand Total Flux BC
when (x=x.max) { D*Clr:x=0;        Clrout=Clr;} // Right Hand Neumann BC
when (x=x.max) { U*Crl + D*Crl:x  = U*Crlin; }  // Right Hand Total Flux BC
when (x=x.min) { D*Crl:x=0;        Crlout=Crl;} // Left Hand Neumann BC

// Partial Differential Equations
Clr:t = -U*Clr:x + D*Clr:x:x +PS/V*(Crl-Clr);
Crl:t =  U*Crl:x + D*Crl:x:x +PS/V*(Clr-Crl);
}

