model Lorenz "The Lorenz model"
  type Height=Real(unit="m");
  type Velocity=Real(unit="m/s");
  parameter Real sigma=10 "sigma";
  parameter Real beta=8/3 "beta";
  parameter Real r=9/10 "r";
  parameter Real x0=-10.0 "Initial x";
  parameter Real y0=10 " initial y" ;
  parameter Real z0=5 " initial z" ;
  Real x "x";
  Real y "y" ;
  Real z "z";
initial equation 
  x = x0;
  y=y0;
  z=z0;
equation 
  der(x)=sigma*(y-x);
  der(y)=x*(r-z)-y;
  der(z)=x*y-beta*z;
end Lorenz;

