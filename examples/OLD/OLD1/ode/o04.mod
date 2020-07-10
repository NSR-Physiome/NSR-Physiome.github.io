// ODE with extra dimension

math o4 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;
	real u(x, t);
	when (t=t.min) u=1+x;
	u:t = u;
}
