// symbolic 2nd derivatives

math a04 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	real a(t), b(t), c(t);
	a = t^3/6;
	b = a:t;
	c = a:t:t;
}
