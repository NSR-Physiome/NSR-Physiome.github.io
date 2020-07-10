// algebra on boundaries

math a01 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	real a(t) = t^2;
	real a0;
	real a1;
	when (t=t.min) a0=a;
	when (t=t.max) a1=a;
	real b(t) = a0 + t;
	real c(t) = a1 + t;
}
