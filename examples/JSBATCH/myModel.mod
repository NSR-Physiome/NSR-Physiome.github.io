//
// MODEL NAME: MyModel
// SHORT DESCRIPTION: Used in example for jsbatch command and flags

 //import  nsrunit; unit conversion on;
import  nsrunit; unit conversion off;

 math BTEX10 {

// INDEPENDENT VARIABLES
 realDomain t sec ; t.min=0; t.max=20; t.delta=0.1;             //TIME, seconds
 realDomain x cm; real L=0.1 cm, Ngrid=61; x.min=0; x.max=L; x.ct=Ngrid;// SPACE    
 private x.min, x.max, x.ct;
    // parameters labelled private do not appear on the run-time menu

/* PARAMETERS AND KEY TO NAMES
   p    = PLASMA */ 

real Fp     = 1 ml/(g*min),    // Plasma flow
//   VOLUME 
     Vp     = 0.05 ml/g,       // Plasma Volume
//   G is the consumption rate coefficient in each region (Gulosity)                                                    
     Gp     = 0.2 ml/(g*min),  // Gulosity or consumption in plasma
//   D is the axial diffusion coefficient
     Dp     = 1.0e-4 cm^2/sec; // Random Gaussian dispersion in plasma
//   The hVolume protects against a zero divide if Vp is set to zero.
 private real hVp       =if(Vp>0)     Vp     else (1e-6 ml/g);

//   SET INFLOWING CONCENTRATION
 extern real Cin(t) mM;

//   CONCENTRATION VARIABLES
real Cp(t,x)    mM,             // Concentration in plasma
     Cout(t)    mM;             // Outflow Concentration from plasma region

//   BOUNDARY CONDITIONS (Note total flux BC for inflowing region.)  
 when  (x=x.min) { (-Fp*L/hVp)*(Cp-Cin)+Dp*Cp:x = 0; }
 when  (x=x.max) {                         Cp:x = 0; Cout = Cp;}

//   INITIAL CONDITIONS
 when (t=t.min) {                          Cp   = 0; }

//   PARTIAL DIFFERENTIAL EQUATION
 Cp:t   = - Fp*L/hVp*Cp:x - Gp/hVp*Cp + Dp*Cp:x:x;

 } //END of MML program

/*
FIGURE:  

 Fp          ________________________________________
 Cin(t) ---> |Vp                               Cp(t)|---> Cout(t)
             |Gp                                    |              
             |Dp                              PLASMA|
             _______________________________________|
             |<----------------L------------------->|
             |--> x
            
DETAILED DESCRIPTION: 

   The partial differential equation models flow into, through and out of 
 a pipe with plug flow and axial dispersion (diffusion) along the x-axis
 and instantaneous radial dispersion so that concentration is uniform across
 the cross-section at each x-position. Consumption,Gp, equivalent to loss by 
 a first order reaction or loss by permeation is a uniform fraction per
 unit time along the pipe. (This can be modified by making G a function of
 concentration, Gp(Cp) or of position, Gp(x).) Flow is constant, as are all
 the other parameters.The boundary conditions are 
   (1) At the inflow, the diffusion coefficient, Dp, cm^2/s, times the
 spatial gradient in concentration, dC/dx, balances the difference between
 the inflow concentration and the concentration Cp just inside; 
   (2) At the outflow, the gradient dC/dx is set to zero, as if reflecting
 from an impermeable surface, so that mass is lost into the outflow only
 by flow, Cout = Cp(x=L,t).

 LIMITATIONS: This model cannot approximate Newtonian parabolic flow, where
 the response to a flow-proportiaonal cross-sectional pulse labeling at the
 inflow would give a sharp upstroke and peak at 1/2 the mean transit time
 and then, in the absence of axial dispersion, diminish in proportion to
 1/t^2. See Gonzalez-Fernandez (1962) on this point.  

KEY WORDS: BTEX10,PDE,convection,diffusion,permeation,reaction,distributed,capillary, 
plasma, piston flow or plug flow 


REFERENCES:

 W.C. Sangren and C.W. Sheppard.  A mathematical derivation of the
exchange of a labelled substance between a liquid flowing in a
vessel and an external compartment.  Bull Math BioPhys, 15, 387-394,
1953.

 Gonzalez-Fernandez JM. Theory of the measurement of the dispersion of
 an indicator in indicator-dilution studies. Circ Res 10: 409-428, 1962.

 C.A. Goresky, W.H. Ziegler, and G.G. Bach. Capillary exchange modeling:  
Barrier-limited and flow-limited distribution. Circ Res 27: 739-764, 1970.

 J.B. Bassingthwaighte. A concurrent flow model for extraction
during transcapillary passage.  Circ Res 35:483-503, 1974.

 B. Guller, T. Yipintsoi, A.L. Orvis, and J.B. Bassingthwaighte. Myocardial 
sodium extraction at varied coronary flows in the dog: Estimation of 
capillary permeability by residue and outflow detection. Circ Res 37: 359-378, 1975.

 C.P. Rose, C.A. Goresky, and G.G. Bach.  The capillary and
sarcolemmal barriers in the heart--an exploration of labelled water
permeability.  Circ Res 41: 515, 1977.

 J.B. Bassingthwaighte, C.Y. Wang, and I.S. Chan.  Blood-tissue
exchange via transport and transformation by endothelial cells.
Circ. Res. 65:997-1020, 1989.

 Poulain CA, Finlayson BA, Bassingthwaighte JB.,Efficient numerical methods 
for nonlinear-facilitated transport and exchange in a blood-tissue exchange 
unit, Ann Biomed Eng. 1997 May-Jun;25(3):547-64. 

REVISION HISTORY:
   Revised by BEJ 04/14/09 to correct Boundary Conditions
   Revised by JBB 11nov10 to add explanations and refs
   Revised by BEJ 18apr06 : use as example for 'jsbatch -func'

JSim SOFTWARE COPYRIGHT AND REQUEST FOR ACKNOWLEDGMENT OF USE:
   
JSim software was developed with support from NIH grants HL088516, 
and HL073598. Please cite these grants in any publication for which 
this software is used and send one reprint of published abstracts or 
articles to the address given below. Academic use is unrestricted. 
Software may be copied so long as this copyright notice is included.

Copyright (C) 1999-2018 University of Washington.

Contact Information:
 
The National Simulation Resource,  
Director J. B. Bassingthwaighte, 
Department of Bioengineering, 
University of Washington, Seattle, WA 
98195-5061

*/  