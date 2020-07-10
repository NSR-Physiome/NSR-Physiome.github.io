// use of legacy sum() and integral() operators
unit correction on;
import nsrunit;
math legacy {
  realDomain x cm; x.min=0; x.max=1; x.delta=.1;
  real u(x) = x * (5 kg/sec); // u will have units kg
  real usum kg;
  usum = sum(u@x); // sum() has save units as u
  real uint kg*x;
  uint = integral(u@x); // integral() has product of u & x units
}
