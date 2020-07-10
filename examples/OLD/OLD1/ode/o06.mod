// ODE state eqns and ICs are implicit equations

math o6 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	real u(t), v(t);
	when (t=t.min) {
	   u + v = 2;
	   u - v = 0;
	}
	u:t + v:t = u+v;
	u:t - v:t = u-v;
}
