// private variable enforces unchangable parameter
math startzero {
  realDomain t;
  t.min=0; t.max=10; t.delta=1;
  private t.min;
  real V(t) = sqrt(t); // must ensure t>=0
}

