// flow junctions
import MFAX;
import nsrunit;
unit conversion on;
MFAX example12 {
        Time t sec;
        t.min=0; t.max=10; t.delta=1;
        Chem A mM;
	FlowJunc J1 liter/sec, J2 liter/sec;
        Compartment C1 liter, C2 liter;
        C1.vol = 10; C2.vol = 5;
	Production Q1(C1, A);
	Q1.flux = 1;	
	FlowSource F1(J1) liter/sec;
	F1.flow = 1;
	Flow F2(J1, C1) liter/sec;
	Flow F3(J1, C2) liter/sec;
	Flow F4(C1, J2) liter/sec;
	Flow F5(C2, J2) liter/sec;
	FlowSink F6(J2) liter/sec;
	J1.F2wgt = 2;
	J1.F3wgt = 1;
}

