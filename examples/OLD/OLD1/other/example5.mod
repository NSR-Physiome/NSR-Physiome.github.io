// algebra only

math example5 {                  // this is an example with algebraic 
                                 // equations only.

  realDomain t; t.min=0; t.max=10; t.delta=0.1;

  extern real Cin(t);

  real y(t);

  y = sqrt(1-Cin^2);
}
