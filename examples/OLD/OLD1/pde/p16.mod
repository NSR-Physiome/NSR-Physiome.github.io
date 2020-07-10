// ODE->PDE->ODE->PDE loop PDEs w/ differing x

math p10 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x1;
	x1.min=0; x1.max=1; x1.delta=0.1;
	realDomain x2;
	x2.min=0; x2.max=1; x2.delta=0.1;

	real u1(t);
	real v1(t,x1);
	real v1out(t);
	real u2(t);
	real v2(t,x2);
	real v2out(t);

	when (t=t.min) u1=1; 
	u1:t = v2out + u1;

	when (t=t.min) v1=1*x1^2; 
	when (x1=x1.min) v1=u1;
	when (x1=x1.max) v1:x1=0;
	v1:t = v1:x1:x1 + v1;
	when (x1=x1.max) v1out = v1;

	when (t=t.min) u2=1; 
	u2:t = v1out + u2;

	when (t=t.min) v2=1*x2^2; 
	when (x2=x2.min) v2=u2;
	when (x2=x2.max) v2:x2=0;
	v2:t = v2:x2:x2 + v2;
	when (x2=x2.max) v2out = v2;
}
