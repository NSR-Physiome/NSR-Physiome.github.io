source real function determinant(u@x@y) {
	language="java";
	maincode={{
	    RegularGridData gx = (RegularGridData) u.grid(0);
	    RegularGridData gy = (RegularGridData) u.grid(1);
	    int N = gx.ct();
	    try { 
	    	java.io.File f = new java.io.File("jdet.m");
	        java.io.PrintWriter wrt = new java.io.PrintWriter(
	           new java.io.FileWriter(f));
	 	wrt.print("A=[" + Util.pretty(u.samples()) + "];");
		wrt.print("A=reshape(A," + N + "," + N + ");");
	    	wrt.println("B=det(A');");
	    	wrt.println("save 'mdet.txt' B -ASCII");
		wrt.println("exit");
	    	wrt.close();

		Process proc = Runtime.getRuntime().exec(
		    "matlab -nodesktop -nosplash -r jdet");
		proc.waitFor();
		String txt = UtilIO.readText(
		    new java.io.File("mdet.txt"));
		return Util.toDouble(txt);
 	    } catch (Exception e) {
	        throw Xcept.wrap(e);
	    }
	}};
}

math main {
  	int N=2;
	realDomain x, y;
	x.min=1; x.max=N; x.delta=1;
	y.min=1; y.max=N; y.delta=1;
	real u(x,y) = random();
	real v = determinant(u@x@y);
}

