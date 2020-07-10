// linear implicit eqns in ODE ICs
main implicit3 {
  realDomain t; 
  real u(t), v(t);
  when (t=t.min) {
    u + 2*v = 4;
    u - v = 1;
  }
  u:t = v-u;
  v:t = u-v;
}
