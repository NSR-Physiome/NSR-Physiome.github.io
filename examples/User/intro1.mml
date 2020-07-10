JSim v1.1   // The double slashes indicate a comment
import  nsrunit; unit conversion on; // Provides uit balance on Eqs

math comp2.Flow { 	
      realDomain t sec; t.min=0; t.max=30; t.delta=0.10;

// Description: Stirred tank model for exchange between plasma, and ISF
// with an external input function, Cin.(Tanks in tandem, not in series.)
// Uses physiological units, i.e. flow per gram of tissue, 
// and volumes of space of distribution of solute per gram of tissue.

//             __________________
// Flow        |Vp        Cp(t) |
// Cin->------>|                |---> Cp(t)    plasma space
//             |       ^ PSg    |
//             --------|--------|
//             |       v Cisf(t)|
//             |                |              interstitial fluid space       
//             |Visf            |
//             -----------------|
//
//

//EQUATIONS:
//      dCp/dt   =   Flow*(Cin-Cp)/Vp     - PSc*(Cp-Cisf)/Vp;
//      dCisf/dt =                          PSc*(Cp-Cisf)/Visf;


// Parameters
       real Flow  = 1.0  ml/(g*min), //Flow through Vp 
             Vp   = 0.06 ml/g,       //Volume of plasma
             Visf = 0.16 ml/g,       //Volume of ISF spce
             PSc  = 1    ml/(g*min), //Capillary wall Perm-surf area product
             Cp0  = 0 mM, Cisf0 = 0 mM; //Init concns
		 
// Variables: concentrations in the two stirred tank regions
       extern real Cin(t) mM;	// externally calculated input variable	

       real Cp(t) mM,    Cisf(t) mM,        // concns
            Q(t) mmol/g, Q1(t) mmol/g;      // Quantities contained
		
// Initial conditions:
       when(t=t.min) {Cp = Cp0;   Cisf = Cisf0; 
                      Q1 = Vp*Cp0 + Visf*Cisf0;}

// ODEs:
       Cp:t  =   Flow*(Cin-Cp)/Vp -  PSc*(Cp-Cisf)/Vp;
       Cisf:t=                       PSc*(Cp-Cisf)/Visf;
	
       Q     =   Vp*Cp + Visf*Cisf; //quantity within system
       Q1:t  =   Flow*(Cin-Cp);   // Q1 is the difference between integrals
                                 // used as a mass balance check
} //END

// KEY WORDS: compartmental model, flow and exchange, mixing chamber, permeability,
//            PS/F, washout, inflow-outflow operator.ISF, parenchymal cell

