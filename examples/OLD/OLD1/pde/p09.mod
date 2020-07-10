// ODE->PDE->ODE->PDE sequence

math p09 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;

	real u1(t);
	when (t=t.min) u1=1; 
	u1:t = u1;

	real v1(t,x);
	when (t=t.min) v1=1*x^2; 
	when (x=x.min) v1=u1;
	when (x=x.max) v1:x=0;
	v1:t = v1:x:x + v1;
	real v1out(t);
	when (x=x.max) v1out = v1;

	real u2(t);
	when (t=t.min) u2=1; 
	u2:t = v1out + u2;

	real v2(t,x);
	when (t=t.min) v2=1*x^2; 
	when (x=x.min) v2=u2;
	when (x=x.max) v2:x=0;
	v2:t = v2:x:x + v2;
}
