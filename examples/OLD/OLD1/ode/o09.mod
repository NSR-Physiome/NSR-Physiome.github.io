// extract an ODE's final value

math o09 {
	realDomain t;
	t.min = 0; t.max = 10; t.delta = 1;

	real a(t), afinal;
	when (t=t.min) a = 1;
	a:t = a;
	when (t=t.max) afinal = a;
}
