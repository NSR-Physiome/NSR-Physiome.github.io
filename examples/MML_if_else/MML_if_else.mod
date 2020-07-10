
// if else syntax:
math if_else {
  realDomain t;
  t.min=0; t.max=2*PI; t.delta=0.1;
  real amp = 1;
  real phase = 0;
  real u(t), v(t), w(t), x(t);
  u = amp*sin(t-phase);
  v = amp*cos(t-phase);
  w = if (t < PI) (u + v) else (u);
  x = if(t > PI) (u + v) else ( if (phase > 0) u else u-v );

}
