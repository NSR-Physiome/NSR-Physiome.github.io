// adding user-defined units
import nsrunit;
unit teaspoon = 0.203 cm^3 prefixable,
furlong = 201 m,
grosdik = 77 furlong/sec;
unit degree = 3.14159/180 radian;
unit mySpecialOne = fundamental;
unit conversion on;
math example7 {
  real vol = 15 microteaspoon;
  real len = 8 furlong;
  real rate = vol/len;
  real car = 2 mySpecialOne/furlong;

  real angle_rad = PI radian;
  real angle_degree degree;
       angle_degree = angle_rad;
}
