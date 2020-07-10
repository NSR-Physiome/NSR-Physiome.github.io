// two interconnected ODEs

math o1 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	real u(t), v(t);
	when (t=t.min) u=1;
	when (t=t.min) v=2;
	u:t = v-u;
	v:t = u-v;
}
