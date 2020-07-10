// simple diffusion PDE

math p1 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;
        real D=1;
	real u(t,x);
	when (t=t.min) u=sin(x);
	when (x=x.min) u=t;
	when (x=x.max) u:x=0;
	u:t = D*u:x:x;
}
