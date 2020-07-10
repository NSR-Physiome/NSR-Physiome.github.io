// symbolic derivatives

math a03 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	real u(t) = t^2;
	real v(t) = sin(u);
	real w(t) = v:t + 1;
}
