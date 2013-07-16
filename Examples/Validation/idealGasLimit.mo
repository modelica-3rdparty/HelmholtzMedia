within HelmholtzMedia.Examples.Validation;
model idealGasLimit
  package Medium = HelmholtzFluids.Propane;

  parameter Medium.Temperature T=298.15;
  Modelica.SIunits.SpecificVolume v;
  Medium.Density d=1/v;

  Medium.EoS.HelmholtzDerivs f = Medium.EoS.setHelmholtzDerivsThird(d=d, T=T, phase=1);
  Medium.ThermodynamicState state = Medium.setState_dT(d=d, T=T, phase=1);

//Real B=f.rd*f.delta/d;
  Real B=f.rd/f.d_crit;

//Real C=f.rdd*f.delta^2/d^2;
  Real C=f.rdd/f.d_crit^2;

//Real D=f.rddd*f.delta^3/d^3;
  Real D=f.rddd/f.d_crit^3;

equation
  v = exp(time/10);

  annotation (Documentation(info="
<html>
<style type=\"text/css\">
  code{background-color:#EEEEEE; padding:2px; margin:2px;}
</style>
<body>
This model is used to validate the behavior of the EoS in the ideal gas limit, that is at <code> lim d -> 0 </code>.
<br />
How to use:
<ol>
  <li>Simulate with any <code>T_trip &lt; T &lt; T_max</code></li>
  <li>Plot <code>f.rd</code> and <code>B</code> </li>
  <li>Make <code>d</code> the independent variable of the plot </li>
  <li>Set the horizontal axis <code>(d)</code> to logarithmic scale</li>
  <li>Set line style to dotted and marker style to cross</li>
  <li>Look at the graphs </li>
</ol>

</body>
</html>"),experiment(StopTime=100000, __Dymola_NumberOfIntervals=10000),
    __Dymola_experimentSetupOutput);
end idealGasLimit;
