// PDE-PDE loop w/ shared BCs

math p11 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=-1; x.max=1; x.delta=0.2;

	real v1(t,x);
	real v2(t,x);

	when (t=t.min) v1=1 - x^2; 
	v1:t = v1:x:x + v1;

	when (t=t.min) v2=x^2 - 1; 
	v2:t = v2:x:x + v2;

	when (x=x.min) v1=v2;
	when (x=x.max) v1=v2;
}
