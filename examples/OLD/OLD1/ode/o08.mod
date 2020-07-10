// symbolic differentiation

math o08 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	real u(t), v(t), k(t);
	k = u*t;
	when (t=t.min) {
	    u=1;
	    v=2;
	}
	u:t = u;
	v:t = u:t + k:t;
}

