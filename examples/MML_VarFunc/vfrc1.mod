// RC circuit, R constant
import nsrunit;
unit conversion on;
math rc1 {
  realDomain t sec;     // time
  t.min=0; t.max=5; t.delta=0.1;
  real R = 1 ohm;       // resistance
  real C = 1 farad;     // capacitance
  real Q0 = 1 coulomb;  // initial charge on capacitor
  real Q(t) coulomb;    // charge on capacitor at time t
  real V(t) = Q/C;      // voltage drop over capacitor
  when (t=t.min) Q=Q0;
  Q:t = -V/R;           // charge dissipated over resistor
}
