// Hodgkin-Huxley Model
// Ref: A.L. Hodgkin and A.F. Huxley, "A quantitative description 
//      of membrane current and its application to conduction and 
//      excitation in nerve," J. Physiol. 117:500-544, 1952
//
math hodhux {
  realDomain t; t.min=0; t.max=10; t.delta=0.1;

  real Cm       = 1,
       gNa0     = 120,
       gK0      = 36,
       gl0      = 0.3,
       VNa      = -115,
       VK       = 12,
       Vl       = -10.613,
       Temp     = 6.3,
       phi      = 3^((Temp-6.3)/10),
       Vclamp   = 0,
       Vdepolar = 0;
		
  private real    
       alphan0 = 0.1/(exp(1)-1),      // always use V=0
       betan0  = 0.125,               // to calculate i.c.
       alpham0 = 2.5/(exp(2.5)-1),
       betam0  = 4,
       alphah0 = 0.07,
       betah0  = 1/(exp(3)+1);

  extern real I(t);

  //Variables for all the algebraic equations
  real INa(t), IK(t), Il(t), 
       alphan(t), betan(t),
       alpham(t), betam(t),
       alphah(t), betah(t), 
       gNa(t), gK(t), Iion(t);

  //State variables for all the ODEs
  real V(t), n(t), m(t), h(t);

  when (t=t.min) {
    V = if (Vclamp<>0) Vclamp
        else           Vdepolar;

    n = alphan0/(alphan0+betan0);
    m = alpham0/(alpham0+betam0);
    h = alphah0/(alphah0+betah0);
  }

  alphan  = if (V > -10) 0.01*(V+10)/(exp((V+10)/10)-1)
            else         0.1;
  betan   = 0.125*exp(V/80);
  alpham  = if (V > -25) 0.1*(V+25)/(exp((V+25)/10)-1)
            else         1;
  betam   = 4*exp(V/18);
  alphah  = 0.07*exp(V/20);
  betah   = 1/(exp((V+30)/10)+1);

  gNa     = gNa0 * m^3 * h;
  gK      = gK0  * n^4;
  INa     = gNa * (V-VNa);
  IK      = gK  * (V-VK);
  Il      = gl0 * (V-Vl);
  Iion    = INa + IK + Il;

  V:t = if (Vclamp = 0) (I-INa-IK-Il)/Cm
        else            0;                            // Votage clamp
  n:t = phi*(alphan*(1-n)-betan*n);
  m:t = phi*(alpham*(1-m)-betam*m);
  h:t = phi*(alphah*(1-h)-betah*h);
}
