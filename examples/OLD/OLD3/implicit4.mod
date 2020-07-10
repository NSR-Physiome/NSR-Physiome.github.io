// linear implicit ODE state eqns
math implicit4 {
  realDomain t;
  real u(t), v(t);
  when (t=t.min) {
    u=2;
    v=1;
  }
  u:t + v:t = u-v^2;
  u:t - v:t = u+v^2; 
}
