// ODE drives PDE left-hand BC

math p08 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;

	real u(t);
	when (t=t.min) u=1; 
	u:t = u;

	real v(t,x);
	when (t=t.min) v=1*x^2; 
	when (x=x.min) v=u;
	when (x=x.max) v:x=0;
	v:t = v:x:x;
}
