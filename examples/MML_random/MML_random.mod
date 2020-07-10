
import nsrunit; unit conversion on;
math threeExponentials { 

// INDEPENDENT VARIABLE
realDomain t s; t.min=1; t.max=1001; t.delta=1;

// Generate CLEAN DATA:  
real CleanCurve(t) dimensionless;
real Ad1 = 1.00, Ad2 = 0.5, Ad3 = 0.25;
real kd1 = 0.05 s^(-1), kd2 = 0.005 sec^(-1), kd3 = 0.001 sec^(-1);
CleanCurve = (Ad1*exp(-kd1*t)+Ad2*exp(-kd2*t)+Ad3*exp(-kd3*t));

//Generate NOISY DATA: 5% Gaussian noise (NoiseLevel=0.05)
real NoiseLevel=0.05;
real NoisyCurve(t) = CleanCurve*(1 + NoiseLevel*randomg()); // <--- randomg()

//Generate NOISY DATA: 5% uniform noise (NoiseLevel=0.05)
real NoisyCurve2(t) = CleanCurve*(1 + NoiseLevel*random()); // <--- random()

/* To set 'seed' value for random number generation:
   - Compile model and then go to 'Run Time' page.
   - Then chose 'Pages' -> 'Solvers'
   - A seed of '0' generates a different set of random numbers each time the model is run.
     A non-zero seed will generate the same 'random' numbers each time model is run.
*/
}


