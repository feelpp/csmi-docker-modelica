model Bioprocess "A bioprocess model"
  type Height=Real(unit="m");
  type Velocity=Real(unit="m/s");

  Real mu "mu";
  Real VCC "VCC";
  Real DCC "DCC";
  Real c_asn "c_asn";
  Real c_glc "c_glc";
  Real cp "cp" ;
  
  parameter Real D=0.4 "Dilution rate"; // 40%
  parameter Real mu_max=0.03 "mu_max";
  parameter Real k_d=0.002 "Kd";
  parameter Real k_asn=1.91 "k_asn" ;
  parameter Real Gamma_VCC_glc=0.39 "k_glc";
  parameter Real Gamma_VCC_asn=1.75 "k_asn";
  parameter Real ms=0.023 "ms";
  parameter Real qp=0.00108 "qp" ;
  parameter Real c_asn_feed=0.0001 "c_asn_feed";
  parameter Real c_glc_feed=0.0001 "c_glc_feed";
  parameter Real c_glc_init=0.0001 "c_glc_init";
  parameter Real c_asn_init=0.0001 "c_asn_init";
  parameter Real c_p_init=0.0001 "c_p_init";
  parameter Real VCC_init=1 "VCC_init";
  parameter Real DCC_init=0 "DCC_init";
initial equation 
  VCC = VCC_init;
  DCC = DCC_init;
  c_asn = c_asn_init;
  c_glc = c_glc_init;
  cp = c_p_init;
equation 
  mu = mu_max*c_asn/(c_asn+k_asn);
  der(VCC)=D*(0-VCC) + (mu-k_d)*VCC;
  der(DCC)=D*(0-DCC) + (k_d)*VCC;
  der(c_glc) = D*(c_glc_feed-c_glc) - (mu/Gamma_VCC_glc+ms)*VCC;
  der(c_asn) = D*(c_asn_feed-c_asn) - (mu/Gamma_VCC_asn)*VCC;
  der(cp) = D*(0-cp) + (qp)*VCC;
end Bioprocess;

