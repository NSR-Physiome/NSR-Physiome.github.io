// boundary condition problem, misusing Variable Function
math vfbc1 {
  realDomain t, x;
  t.min=0; t.max=10; t.delta=.1;
  x.min=-1; x.max=1; x.delta=0.05;
  real u(t,x), v(t);
  real uout(t);   
  when (t=t.min) { u=x^2; v=1; }
  when (x=x.min) u=v;
  when (x=x.max) u:x = 0;
  u:t = u:x:x - u:x;
  v:t = uout-v;
  uout=u(t,x.max);  // uout calculated via VF
}
