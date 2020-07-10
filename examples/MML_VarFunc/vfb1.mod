// Variable Function introductory example
math vfb1 {
  realDomain t;
  t.min=0; t.max=1; t.delta=0.1;
  real u(t) = sin(10*t);
  real v(t) = u(t^2);
}
