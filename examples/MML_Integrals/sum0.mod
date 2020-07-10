import nsrunit;
unit conversion on;
math sum0{
realDomain t sec; t.min=0; t.max=10; t.ct=101;
real x(t) = t^2;

/* Compute the average over x(t):
   x(t) is a discrete series. */
   real Average sec^2;
   Average = sum(x@t)/t.ct;

/* An approximate integral can be calculated in
   two different ways: The first way,
   ApproximateIntegral1 uses the sum operator
   AND IS NOT RECOMMENDED;   */
   real ApproximateIntegral1 sec^3;
   ApproximateIntegral1 = sum(x*t.delta@t);
// yields ApproximateIntegral1=338.35.

/* The second way is more accurate. It uses
   the integral operator which uses trapezoidal integration.
*/
   real  ApproximateIntegral2 sec^3;
   ApproximateIntegral2 = integral(x@t);
// yields ApproximateIntegral2=333.35

/* Both of these methods converge to the exact answer as
   t.ct (the number of points between t.min=0 and t.max=10
   gets large. The most accurate method is to directly
   integrate the function.                                */
   real ExactIntegral(t) sec^3;
   when(t=t.min) ExactIntegral = 0;
   ExactIntegral:t = x;
// yields ExactIntegral = 333.33333333333.
}
