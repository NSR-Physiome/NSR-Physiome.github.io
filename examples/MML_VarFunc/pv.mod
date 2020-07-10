import nsrunit;
unit conversion on;

math main {
  realDomain t sec;  // time domain
  t.min=0; t.max=10; t.delta=.1;  
  realDomain vhat ml; // volume domain in P/V relation
  vhat.min=0; vhat.max=1; vhat.delta=.01;
  extern real phat(vhat) mmHg; // P/V relationship
  real F(t) = exp(-t/(1 sec)) * (1 ml/sec); // flow at time t
  real V(t) ml;  // chamber volume at time t
  when (t=t.min) V = .01; // initial chamber volume
  V:t = F;   // chamber volume changes based upon flow
  real p(t) = phat(V);  // pressure at time t, calculated from P/V relation
  // ... more calculations based on 
}
