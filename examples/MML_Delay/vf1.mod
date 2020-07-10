// simple variable function delay line
math vf1 {
	realDomain t;
	t.min=0; t.max=10; t.delta=0.25;
	real delay = 1;   // user-specified time delay
	real u(t);        // the normal state variable
	real udelayed(t); // the delayed state variable 
	when (t=t.min) u=1;
	u:t = -udelayed;  
	udelayed = if (t<delay) 0 else u(t-delay);
}
