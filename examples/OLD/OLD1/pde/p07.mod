// PDE & ODE connect

math p7 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;
	real u(t,x), uOut(t);
	real v(t);
	when (t=t.min) { u=x^2; v=0; }
	when (x=x.min) u=t;
	when (x=x.max) u:x=0;
	u:t = u:x:x + u:x + u + x + t;
	when (x=x.max) uOut = u;
	v:t = v + uOut;
}
