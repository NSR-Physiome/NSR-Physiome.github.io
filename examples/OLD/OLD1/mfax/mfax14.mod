// injection
import MFAX;
import nsrunit;
unit conversion on;
MFAX example14 {
        Time t sec;
        t.min=0; t.max=10; t.delta=1;
        Chem A mM;
        Compartment C1 liter;
        C1.vol = 10;
	FlowSource F1(C1) liter/sec;
	F1.flow = 1;
	Inject I1(F1,A);
	I1.flux = t*(2 mol/sec^2);
	FlowSink F3(C1) liter/sec;
}
