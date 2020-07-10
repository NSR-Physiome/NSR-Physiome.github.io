// simple examples of sum() operator
unit conversion on;
import nsrunit;
math sums {
  realDomain t sec; t.min=0; t.max=5; t.delta=1; // time (seconds)
  real u(t) = t^2 * (1 m/sec^2);  // u (meters)
  real v(t) = sum(t=t.min to t, u); // v (meter)
  real w1 = sum(t=t.min to t.max, u); // w1 (meter)
  real w2 = sum(u@t); // w2 (meter)
}
