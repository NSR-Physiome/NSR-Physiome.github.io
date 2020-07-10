// simple examples of integral() operator
unit conversion on;
import nsrunit;
math integral1 {
  realDomain t sec; t.min=0; t.max=2; t.delta=1; // time (seconds)
  real u(t) = t^2 * (1 m/sec^2);           // (meters)
  real v(t) = integral(t=t.min to t, u);   // (meter*sec)
  real w1 = integral(t=t.min to t.max, u); // (meter*sec)
  real w2 = integral(u@t);                 // (meter*sec) 
 // Another approach (solution is ODE dependent):
  real z(t);  
  when(t=t.min) z=0;  // Initial condition
  z:t = u;            // integral of u(t) from t.min to t.max
}
