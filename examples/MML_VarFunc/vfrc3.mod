// RC circuit, non-linear R driven by external data
import nsrunit;
unit conversion on;
math rc1 {
  realDomain t sec;     // time
  t.min=0; t.max=5; t.delta=0.1;  // time grid definition
  real C = 1 farad;     // capacitance
  real Q0 = 1 coulomb;  // initial charge on capacitor
  realDomain vr volt;   // voltage over resistor
  vr.min=0; vr.max=Q0/C; vr.ct=101; // vr grid defintion
  extern real R(vr) ohm;// resistance
  real Q(t) coulomb;    // charge on capacitor at time t
  real V(t) = Q/C;      // voltage drop over capacitor
  when (t=t.min) Q=Q0; 
  Q:t = -V/R(V);        // charge dissipated over resistor
}
