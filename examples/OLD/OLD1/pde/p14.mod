// PDE<->PDE sequence

math p11 {
	realDomain t;
	t.min=0; t.max=3; t.delta=0.25;
	realDomain x;
	x.min=0; x.max=1; x.delta=0.1;

	real v1(t,x);
	real v12(t);
	real v2(t,x);

	when (t=t.min) v1=1*x^2; 
	when (x=x.min) v1=1;
	when (x=x.max) v1:x=0;
	v1:t = v1:x:x + v1;

	when (x=x.max) v12 = v1;

	when (t=t.min) v2=1*x^2; 
	when (x=x.min) v2=v12;
	when (x=x.max) v2:x=0;
	v2:t = v2:x:x + v2;
}
