// RC circuit, R constant
math vfrc1 {
  realDomain t;
  t.min=0; t.max=10; t.delta=0.1;
  real R = 1;
  real C = 1;
  real Q(t);
  when (t=t.min) Q=1;
  Q:t = -Q/R*C;
}
