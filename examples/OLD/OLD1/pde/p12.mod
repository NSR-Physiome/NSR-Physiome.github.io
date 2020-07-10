// PDE->ODE loop

math p12 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;

	real v(t,x);
	real vout(t);
	real u(t);

	when (t=t.min) v=1*x^2; 
	when (x=x.min) v=u;
	when (x=x.max) v:x=0;
	v:t = v:x:x + v;
	when (x=x.max) vout = v;

	when (t=t.min) u=0; 
	u:t = u + vout;
}
